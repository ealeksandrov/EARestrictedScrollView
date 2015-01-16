#EARestrictedScrollView - UIScrollView sublass with ability to restrict scrolling area

In plain UIScrollView only contentSize can be changed, but not the origin of scrolling area. This simple and universal solution allows to restrict scrolling area with CGRect.

License: MIT.

##Manual installation

* Add `EARestrictedScrollView` header and implementation to your project (2 files total).
* Include with `#import "EARestrictedScrollView.h"` to use it wherever you need.

##How To Use It

Change scrolling area with new `restrictionArea` property. Reset restriction with passing `CGRectZero` to `restrictionArea`.

##Author

Created and maintained by Evgeny Aleksandrov ([@EAleksandrov](https://twitter.com/EAleksandrov)).
