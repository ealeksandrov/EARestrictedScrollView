//
//  Tests.m
//
//  Copyright (c) 2015 Evgeny Aleksandrov. License: MIT.

#import <EARestrictedScrollView/EARestrictedScrollView.h>

SpecBegin(InitialSpecs)

__block EARestrictedScrollView *restrictedScrollView;

beforeEach(^{
    NSLog(@"Before");
    
    restrictedScrollView = [[EARestrictedScrollView alloc] initWithFrame:CGRectMake(0.f, 0.f, 400.f, 500.f)];
    
    UIImage *bgImage = [UIImage imageNamed:@"milky-way.jpg"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:bgImage];
    [restrictedScrollView addSubview:imageView];
    [restrictedScrollView setContentSize:imageView.frame.size];
    
    expect(restrictedScrollView).willNot.beNil();
});


it(@"looks normal on init", ^{
    expect(restrictedScrollView).to.haveValidSnapshotNamed(@"InitState");
});

it(@"restriction area equals to view.frame", ^{
    CGRect restrRect = CGRectMake(300.f, 300.f, restrictedScrollView.bounds.size.width, restrictedScrollView.bounds.size.height);
    
    [restrictedScrollView setRestrictionArea:restrRect];
    
    expect(restrictedScrollView.contentOffset.x).to.equal(restrRect.origin.x);
    expect(restrictedScrollView.contentOffset.y).to.equal(restrRect.origin.y);
    
    expect(restrictedScrollView).to.haveValidSnapshotNamed(@"RestrictionAreaEqualsSelf");
    
    [restrictedScrollView setRestrictionArea:CGRectZero];
    
    expect(restrictedScrollView.contentOffset.x).to.equal(restrRect.origin.x);
    expect(restrictedScrollView.contentOffset.y).to.equal(restrRect.origin.y);
});

it(@"restriction area is bigger than view.frame", ^{
    CGRect restrRect = CGRectMake(400.f, 400.f, restrictedScrollView.bounds.size.width * 1.5, restrictedScrollView.bounds.size.height * 1.5);
    
    [restrictedScrollView setRestrictionArea:restrRect];
    
    expect(restrictedScrollView.contentOffset.x).to.equal(restrRect.origin.x);
    expect(restrictedScrollView.contentOffset.y).to.equal(restrRect.origin.y);
    
    expect(restrictedScrollView).to.haveValidSnapshotNamed(@"BiggerRestrictionFrameInit");
});


it(@"restriction area is bigger than view.frame + offset", ^{
    CGRect restrRect = CGRectMake(400.f, 400.f, restrictedScrollView.bounds.size.width * 1.5, restrictedScrollView.bounds.size.height * 1.5);
    
    [restrictedScrollView setRestrictionArea:restrRect];
    
    CGPoint newOffset = CGPointMake(restrRect.origin.x + restrictedScrollView.bounds.size.width * 0.2, restrRect.origin.y + restrictedScrollView.bounds.size.height * 0.2);
    
    [restrictedScrollView setContentOffset:newOffset animated:YES];
    
    expect(restrictedScrollView.contentOffset.x).to.equal(newOffset.x);
    expect(restrictedScrollView.contentOffset.y).to.equal(newOffset.y);
    
    [restrictedScrollView setRestrictionArea:CGRectZero];
    
    expect(restrictedScrollView.contentOffset.x).to.equal(newOffset.x);
    expect(restrictedScrollView.contentOffset.y).to.equal(newOffset.y);
});

SpecEnd
