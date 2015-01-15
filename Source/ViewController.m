//
//  ViewController.m
//
//  Copyright (c) 2015 Evgeny Aleksandrov. License: MIT.

#import "ViewController.h"
#import "EARestrictedScrollView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    EARestrictedScrollView *restrictedScrollView = [[EARestrictedScrollView alloc] initWithFrame:self.view.frame];
    restrictedScrollView.alwaysBounceHorizontal = YES;
    restrictedScrollView.alwaysBounceVertical = YES;
    [self.view addSubview:restrictedScrollView];
    
    UIView *bigRedView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 600, 2000)];
    bigRedView.backgroundColor = [UIColor redColor];
    
    [restrictedScrollView addSubview:bigRedView];
    [restrictedScrollView setContentSize:bigRedView.frame.size];
    [restrictedScrollView setRestrictionArea:CGRectMake(600 - self.view.frame.size.width, 2000 - self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height)];
}

@end
