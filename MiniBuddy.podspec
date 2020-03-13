#
#  Be sure to run `pod spec lint MiniBuddy.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|
  spec.name           = 'MiniBuddy'
  spec.version        = '0.1.0'
  spec.summary        = 'Minimum swift implementation of PlistBuddy.'
  spec.homepage       = 'https://github.com/otiai10/MiniBuddy'
  spec.license        = { type: 'MIT', file: 'LICENSE' }
  spec.author         = { 'Hiromu OCHIAI' => 'otiai10@gmail.com' }
  spec.source         = { http: "#{spec.homepage}/archive/#{spec.version}.zip" }
  spec.preserve_paths = '*'
  spec.description    = <<-DESC
    Minimum Swift implementation of PlistBuddy,
    in order to control Info.plist (e.g. bump up build version)
    only with Swift code without external dependencies.
  DESC
end
