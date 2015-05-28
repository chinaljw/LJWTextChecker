//
//  UIApplication+LJWPresentViewController.m
//  Parking
//
//  Created by ljw on 15/5/15.
//  Copyright (c) 2015年 Mark. All rights reserved.
//

#import "UIWindow+LJWPresentViewController.h"
#import <objc/runtime.h>

//static char *LJWPresentViewControllerKey = "LJWPresentViewControllerKey";

@implementation UIWindow (LJWPresentViewController)

- (UIViewController *)presentViewController
{
    return [self getPresentViewController:self.rootViewController];
}

- (UIViewController *)getPresentViewController:(UIViewController *)currentViewController
{
    
    if ([currentViewController isKindOfClass:[UINavigationController class]]) {
        return [self getPresentViewController:[(UINavigationController *)currentViewController topViewController]];
    }
    
    if ([currentViewController isKindOfClass:[UITabBarController class]]) {
        return [self getPresentViewController:[(UITabBarController *)currentViewController selectedViewController]];
    }
    
    if ([currentViewController presentingViewController]) {
        return [self getPresentViewController:[currentViewController presentingViewController]];
    }
    
    return currentViewController;
}

@end
