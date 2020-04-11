import Commandant

let commands = CommandRegistry<Error>()
commands.register(SetCommand())

var arguments = CommandLine.arguments
arguments.remove(at: 0) // Executable File Name

if let verb = arguments.first {
    arguments.remove(at: 0)
    print(verb)
    if let result = commands.run(command: verb, arguments: arguments) {
        switch result {
        case .success:
            print("SUCCESS!!")
        case .failure(let err):
            print(err)
        }
    } else {
        print("Unrecognized command:", verb)
    }
} else {
    print("No command given.")
}
