# EARestrictedScrollView

[![CI Status](https://github.com/ealeksandrov/EARestrictedScrollView/workflows/CI/badge.svg?branch=master)](https://github.com/ealeksandrov/EARestrictedScrollView/actions)
[![Version](https://img.shields.io/cocoapods/v/EARestrictedScrollView.svg?style=flat)](http://cocoadocs.org/docsets/EARestrictedScrollView)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License](https://img.shields.io/cocoapods/l/EARestrictedScrollView.svg?style=flat)](http://cocoadocs.org/docsets/EARestrictedScrollView)
[![Platform](https://img.shields.io/cocoapods/p/EARestrictedScrollView.svg?style=flat)](http://cocoadocs.org/docsets/EARestrictedScrollView)

![DemoGIF](https://raw.githubusercontent.com/ealeksandrov/EARestrictedScrollView/master/Demo.gif)

**`UIScrollView` sublass with ability to restrict scrolling area.**

In plain `UIScrollView` only `contentSize` can be changed, but not the origin of scrolling area. This simple and universal solution allows to restrict scrolling area with `CGRect`.

For objective-c projects you can use [version 1.1.0](https://github.com/ealeksandrov/EARestrictedScrollView/releases/tag/1.1.0).

## Installation

You can setup EARestrictedScrollView using [Carthage](https://github.com/Carthage/Carthage), [CocoaPods](http://github.com/CocoaPods/CocoaPods), [Swift Package Manager](https://github.com/apple/swift-package-manager) or [completely manually](#setting-up-manually).

### Carthage

1. Add EARestrictedScrollView to your project's `Cartfile`:

	```ruby
	github "ealeksandrov/EARestrictedScrollView"
	```

2. Run `carthage update` in your project directory.
3. On your application targets’ “General” settings tab, in the “Linked Frameworks and Libraries” section, drag and drop **EARestrictedScrollView.framework** from the `Carthage/Build/iOS/` folder on disk.
4. On your application targets’ “Build Phases” settings tab, click the “+” icon and choose “New Run Script Phase”. Create a Run Script with the following contents:

	```shell
	/usr/local/bin/carthage copy-frameworks
	```
	
	and add the path to the framework under “Input Files”:
	
	```shell
	$(SRCROOT)/Carthage/Build/iOS/EARestrictedScrollView.framework
	```

### CocoaPods

1. Add EARestrictedScrollView to your project's `Podfile`:

	```ruby
	pod 'EARestrictedScrollView', '~> 2.0.0'
	```

2. Run `pod update` or `pod install` in your project directory.

### Swift Package Manager

1. Add EARestrictedScrollView to your project’s ‘Swift Packages’ section or `Package.swift`:

```swift
.package(url: "https://github.com/ealeksandrov/EARestrictedScrollView.git", from: "2.0.0")
```

### Setting Up Manually

1. Clone EARestrictedScrollView from Github.
2. Copy and add `EARestrictedScrollView` header and implementation to your project.
3. You can now use EARestrictedScrollView by adding the following import:

	```swift
	import EARestrictedScrollView
	```

## How To Use It

Can be created from code as usual:

```swift
override func viewDidLoad() {
        super.viewDidLoad()
        
        restrictedScrollView = EARestrictedScrollView(frame: view.bounds)
        restrictedScrollView.alwaysBounceVertical = true
        restrictedScrollView.alwaysBounceHorizontal = true
        view.addSubview(restrictedScrollView)
        
        let imageView = UIImageView(image: UIImage(named: "milky-way"))
        restrictedScrollView.addSubview(imageView)
        restrictedScrollView.contentSize = imageView.frame.size
    }
```

Or from Interface Builder:

![IB screenshot](https://raw.githubusercontent.com/ealeksandrov/EARestrictedScrollView/master/ScreenshotIB.png)

Update scrolling area with new `restrictionArea` property. Reset restriction with passing `CGRectZero` to `restrictionArea`.

```swift
func flipSwitch(sender: UISwitch) {
        if sender.on {
            restrictedScrollView.restrictionArea = sender.superview!.frame
        } else {
            restrictedScrollView.restrictionArea = CGRectZero
        }
    }
```

To access subviews use `containedSubviews` property. It was added in version 0.2.0 since `subviews` override caused some [troubles with autolayout](https://github.com/ealeksandrov/EAIntroView/issues/100).

```swift
let subviews = restrictedScrollView.containedSubviews
```

## Author

Created and maintained by Evgeny Aleksandrov ([@ealeksandrov](https://twitter.com/ealeksandrov)).

## License

`EARestrictedScrollView` is available under the MIT license. See the [LICENSE.md](LICENSE.md) file for more info.
