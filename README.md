# NVPullToRefresh

PullToRefresh + NVActivityIndicatorView
=======================================


[![Language: Swift 4](https://img.shields.io/badge/language-swift4-f48041.svg?style=flat-square)](https://developer.apple.com/swift)
[![CocoaPods compatible](https://img.shields.io/cocoapods/v/NVPullToRefresh.svg?style=flat-square)](https://cocoapods.org/pods/SwiftyContacts)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

NVPullToRefresh is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'NVPullToRefresh'
```


## Animation types

| Type | Type | Type | Type |
|---|---|---|---|
|1. ballPulse | 2. ballGridPulse | 3. ballClipRotate | 4. squareSpin|
|5. ballClipRotatePulse | 6. ballClipRotateMultiple | 7. ballPulseRise | 8. ballRotate|
|9. cubeTransition | 10. ballZigZag | 11. ballZigZagDeflect | 12. ballTrianglePath|
|13. ballScale | 14. lineScale | 15. lineScaleParty | 16. ballScaleMultiple|
|17. ballPulseSync | 18. ballBeat | 19. lineScalePulseOut | 20. lineScalePulseOutRapid|
|21. ballScaleRipple | 22. ballScaleRippleMultiple | 23. ballSpinFadeLoader | 24. lineSpinFadeLoader|
|25. triangleSkewSpin | 26. pacman | 27. ballGridBeat | 28. semiCircleSpin|
|29. ballRotateChase | 30. orbit | 31. audioEqualizer | 32. circleStrokeSpin|


## Get started

Import NVPullToRefresh

```swift
    import NVPullToRefresh
```

```swift
    var refresher = NVPullToRefresh(NVActivityIndicatorType: .circleStrokeSpin, Color: .black)
    
    tableView.addPullToRefresh(refresher) {
            //Do Your Thing Here.
        }
```

The easiest way to create *PullToRefresh*:

```swift
  let refresher = NVPullToRefresh()
```

It will create a default pull-to-refresh with a simple view which has single *UIActivitiIndicatorView*. To add refresher to your *UIScrollView* subclass:

```swift
tableView.addPullToRefresh(refresher) {
    // action to be performed (pull data from some source)
}
```

⚠️ Don't forget to remove pull to refresh when your view controller is releasing. ⚠️

```swift
deinit {
tableView.removePullToRefresh(tableView.topPullToRefresh!)
}
```

After the action is completed and you want to hide the refresher:

```swift
tableView.endRefreshing()
```

You can also start refreshing programmatically:

```swift
tableView.startRefreshing()
```

But you probably won’t use this component, though. *UITableViewController* and *UICollectionViewController* already have a simple type of refresher.
It’s much more interesting to develop your own pull-to-refresh control.

## Usage in UITableView with sections

Unfortunaly, *UITableView* with sections currently not supported. But you can resolve this problem in two steps:
1) Create you own *PullToRefresh* (see instructions below).
2) Set its ```shouldBeVisibleWhileScrolling``` property to ```true```. It makes you PullToRefresh always visible while you're scrolling the table.


For more Information on PullToRefresh Go to https://github.com/Yalantis/PullToRefresh

For more Information on NVActivityIndicatorView Go to https://github.com/ninjaprox/NVActivityIndicatorView

## Author

satish.babariya@gmail.com, satish.babariya@gmail.com

## License

NVPullToRefresh is available under the MIT license. See the LICENSE file for more info.
