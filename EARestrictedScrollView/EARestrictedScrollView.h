//
//  EARestrictedScrollView.h
//
//  Copyright (c) 2015 Evgeny Aleksandrov. License: MIT.

#import <UIKit/UIKit.h>

@interface EARestrictedScrollView : UIScrollView

@property (nonatomic, assign) CGRect restrictionArea;

#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wproperty-attribute-mismatch"
@property (nonatomic, assign, getter=alignedContentOffset, setter=setAlignedContentOffset:) CGPoint contentOffset;
#pragma GCC diagnostic pop

- (void)setContentOffset:(CGPoint)contentOffset __attribute__((unavailable("use dot notation to access property")));
- (CGPoint)contentOffset __attribute__((unavailable("use dot notation to access property")));

@end
