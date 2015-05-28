//
//  UIView+LJWMessageView.h
//  LJWHUD
//
//  Created by ljw on 15/5/26.
//  Copyright (c) 2015年 ljw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LJWWaitingView.h"
#import "LJWMessageView.h"

typedef void (^LJWHUDCompletionBlock)();

@interface UIView (LJWHUD)

@property (nonatomic, strong, readonly) UIView<LJWMessageViewProtocol> *ljwMessageView;

@property (nonatomic, strong, readonly) UIView *ljwWaitingView;

#pragma mark - MessageView
- (void)showMessageViewWithMessage:(NSString *)message dismissDelay:(CGFloat)delay completionBlock:(LJWHUDCompletionBlock)completionBlock;

- (void)showMessageViewWithMessage:(NSString *)message completionBlock:(LJWHUDCompletionBlock)completionBlock;


#pragma mark - WaitingView
- (void)showWaitingView;

- (void)dismissWaitingView;


@end
