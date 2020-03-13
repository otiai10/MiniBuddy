import Foundation
import Commandant

struct SetCommand: CommandProtocol {
    typealias Options = SetOptions
    typealias ClientError = Error
    let verb = "set"
    let function = "Set property"

    func run(_ opt: SetOptions) -> Result<(), Error> {
        guard let data = FileManager.default.contents(atPath: opt.path) else {
            return .failure(NSError(domain: "set", code: 1001, userInfo: ["Message": "Target file not found"] ))
        }
        guard let raw = try? PropertyListSerialization.propertyList(from: data, options: .mutableContainersAndLeaves, format: nil) else {
            return .failure(NSError(domain: "set", code: 1002, userInfo: ["Message": "Failed to parse target file"]))
        }
        guard let plist = raw as? NSMutableDictionary else {
            return .failure(NSError(domain: "set", code: 1003, userInfo: ["Message": "Failed to cast plist to dictionary"]))
        }
        if plist.object(forKey: opt.key) == nil {
            return .failure(NSError(domain: "set", code: 1004, userInfo: ["Message": "Plist does not have target key"]))
        }

        // {{{ Set next value
        plist[opt.key] = {(currentValue: Any?, nextValue: Any?) -> String in
            if let nv = nextValue as? String {
                return nv
            }
            if let v: Int = currentValue as? Int {
                return String(v + 1)
            }
            return String(1)
        }(plist[opt.key], opt.value)
        // }}}

        guard let dest = try? PropertyListSerialization.data(fromPropertyList: plist, format: .xml, options: .max) else {
            return .failure(NSError(domain: "set", code: 1005, userInfo: ["Message": "Failed to re-serialize plist"]))
        }
        do {
            try dest.write(to: NSURL(fileURLWithPath: opt.path) as URL)
            return .success(())
        } catch {
            return .failure(NSError(domain: "set", code: 1006, userInfo: ["Message": "Failed to write new data on target file"]))
        }
    }
}

struct SetOptions: OptionsProtocol {
    let path: String
    let key: String
    let value: Any?
    static func create(_ path: String) -> (String) -> SetOptions {
        return { kv in
            let pair = kv.split(separator: "=")
            return SetOptions(path: path, key: String(pair[0]), value: pair.count > 1 ? pair[1] : nil)
        }
    }
    static func evaluate(_ m: CommandMode) -> Result<SetOptions, CommandantError<Error>> {
        return create
            <*> m <| Option(key: "path", defaultValue: "Info.plist", usage: "plist file path")
            <*> m <| Argument(usage: "key=value to update")
    }

}
