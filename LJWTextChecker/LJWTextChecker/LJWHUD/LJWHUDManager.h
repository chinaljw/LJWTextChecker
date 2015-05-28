//
//  LJWHUDManager.h
//  LJWHUD
//
//  Created by ljw on 15/5/25.
//  Copyright (c) 2015年 ljw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^LJWHUDCompletionBlock)();

@interface LJWHUDManager : NSObject

+ (instancetype)defaultManager;

#pragma mark - MessageView
- (void)showMessageViewWithMessage:(NSString *)message inView:(UIView *)view dismissDelay:(CGFloat)delay completionBlock:(LJWHUDCompletionBlock)completionBlock;

- (void)showMessageViewWithMessage:(NSString *)message inView:(UIView *)view completionBlock:(LJWHUDCompletionBlock)completionBlock;

- (void)showMessageViewInKeyWindowMessage:(NSString *)message dismissDelay:(CGFloat)delay completionBlock:(LJWHUDCompletionBlock)completionBlock;

- (void)showMessageViewInKeyWindowMessage:(NSString *)message completionBlock:(LJWHUDCompletionBlock)completionBlock;


#pragma mark - WaitingView
- (void)showWaitingViewInView:(UIView *)view;

- (void)dismissWaitingView;

@end
