# MiniBuddy

![](https://github.com/otiai10/MiniBuddy/workflows/Swift/badge.svg)

 Minimum Swift implementation of PlistBuddy, in order to control Info.plist (e.g. bump up build version) only with Swift code without external dependencies.

# Validation (WIP)

```sh
% pod lib spec
% swift test
```

```sh
% swift run minibuddy set "CFBundleVersion=" --path ./Tests/Example-Info.plist
```
