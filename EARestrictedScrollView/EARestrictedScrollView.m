//
//  EARestrictedScrollView.m
//
//  Copyright (c) 2015 Evgeny Aleksandrov. License: MIT.

#import "EARestrictedScrollView.h"

@interface EARestrictedScrollView ()

@property(nonatomic, assign) CGPoint containerOffset;

@property(nonatomic, strong) UIView *containerView;

@end

@implementation EARestrictedScrollView

#pragma mark - Subviews override

- (void)addSubview:(UIView *)view {
    if([self.subviews count] < 3 && [self checkIfScrollIndicator:view]) {
        [super addSubview:view];
    } else {
        [self.containerView addSubview:view];
    }
}

- (void)insertSubview:(UIView *)view aboveSubview:(UIView *)siblingSubview {
    [self.containerView insertSubview:view aboveSubview:siblingSubview];
}

- (void)insertSubview:(UIView *)view atIndex:(NSInteger)index {
    [self.containerView insertSubview:view atIndex:index];
}

- (void)insertSubview:(UIView *)view belowSubview:(UIView *)siblingSubview {
    [self.containerView insertSubview:view belowSubview:siblingSubview];
}

- (void)bringSubviewToFront:(UIView *)view {
    if(view.superview == self) {
        [super bringSubviewToFront:view];
    } else {
        [self.containerView bringSubviewToFront:view];
    }
}

- (void)sendSubviewToBack:(UIView *)view {
    [self.containerView sendSubviewToBack:view];
}

- (UIView *)viewWithTag:(NSInteger)tag {
    return [self.containerView viewWithTag:tag];
}

- (NSArray *)subviews {
    return self.containerView.subviews;
}

#pragma mark - Private checks

- (BOOL)checkIfScrollIndicator:(UIView *)view {
    return ((self.showsHorizontalScrollIndicator && view.frame.size.height == 2.5f) || (self.showsVerticalScrollIndicator && view.frame.size.width == 2.5f)) && [view isKindOfClass:[UIImageView class]];
}

#pragma mark - Lazy properties

- (UIView *)containerView {
    if(!_containerView || ![_containerView superview]) {
        _containerView = [[UIView alloc] init];
        [super addSubview:_containerView];
    }
    
    return _containerView;
}

#pragma mark - Custom offset getters and setters

- (CGPoint)contentOffset {
    CGPoint originalOffset = [super contentOffset];
    CGPoint newOffset = CGPointMake(originalOffset.x - self.containerOffset.x, originalOffset.y - self.containerOffset.y);
    
    return newOffset;
}

- (void)setContentSize:(CGSize)contentSize {
    [super setContentSize:contentSize];
    
    [self.containerView setFrame:CGRectMake(self.containerView.frame.origin.x, self.containerView.frame.origin.y, contentSize.width, contentSize.height)];
}

- (void)setRestrictionArea:(CGRect)restrictionArea {
    _restrictionArea = restrictionArea;
    
    [self.containerView setFrame:CGRectMake(-restrictionArea.origin.x, -restrictionArea.origin.y, restrictionArea.size.width, restrictionArea.size.height)];
    [super setContentSize:CGSizeMake(restrictionArea.size.width, restrictionArea.size.height)];
}

@end
