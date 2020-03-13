# MiniBuddy

![](https://github.com/otiai10/MiniBuddy/workflows/Swift/badge.svg)

Minimum Swift implementation of PlistBuddy, in order to control Info.plist (e.g. bump up build version) only with Swift code without external dependencies.

# Installation

In your `Podfile`

```ruby
target 'MiniBuddyExample' do
  use_frameworks!
  pod 'MiniBuddy'
end
```

then `pod install`

# Usage

```sh
% ./Pods/MiniBuddy/minibuddy \
    set "CFBundleVersion=" \
    --path YourProject/Info.plist
# This increments your CFBundleVersion
```

# Development

```sh
% pod lib spec
% swift test
```
