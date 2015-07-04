//
//  UIView+LJWMessageView.m
//  LJWHUD
//
//  Created by ljw on 15/5/26.
//  Copyright (c) 2015年 ljw. All rights reserved.
//

#import "UIView+LJWHUD.h"
#import <objc/runtime.h>

@interface UIView ()

@end

@implementation UIView (LJWHUD)

@dynamic ljwMessageView;

@dynamic ljwWaitingView;

#pragma mark - SetterAndGetter
- (void)setLjwMessageView:(UIView<LJWMessageViewProtocol> *)ljwMessageView
{
    [objc_getAssociatedObject(self, @selector(ljwMessageView)) removeFromSuperview];
    
    objc_setAssociatedObject(self, @selector(ljwMessageView), ljwMessageView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setWaitingView:(UIView *)ljwWaitingView
{
    [objc_getAssociatedObject(self, @selector(ljwWaitingView)) removeFromSuperview];
    
    objc_setAssociatedObject(self, @selector(ljwWaitingView), ljwWaitingView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView<LJWMessageViewProtocol> *)ljwMessageView
{
    return objc_getAssociatedObject(self, _cmd);
}

- (UIView *)ljwWaitingView
{
    return objc_getAssociatedObject(self, _cmd);
}

#pragma mark - ljwMessageView
- (void)showMessageViewWithMessage:(NSString *)message dismissDelay:(CGFloat)delay completionBlock:(LJWHUDCompletionBlock)completionBlock
{
    
    self.ljwMessageView = [[LJWMessageView alloc] initWithFrame:CGRectZero];
    
    [self.ljwMessageView setContent:message];
    
    CGSize ljwMessageViewSize = [self.ljwMessageView viewSizeWithContent:message];
    
    self.ljwMessageView.bounds = CGRectMake(0, 0, ljwMessageViewSize.width, ljwMessageViewSize.height);
    
    self.ljwMessageView.transform = CGAffineTransformScale(self.ljwMessageView.transform, 0.9, 0.9);
    
    self.ljwMessageView.center = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
    
    [self addSubview:self.ljwMessageView];
    
    __block typeof(self.ljwMessageView) blockView = self.ljwMessageView;
    
    if (!self.ljwMessageView.animated) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.ljwMessageView.dismissDelay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if (blockView == self.ljwMessageView) {
                self.ljwMessageView = nil;
                if (completionBlock) {
                    completionBlock();
                }
            }
            else
            {
                [blockView removeFromSuperview];
            }
        });
        return;
    }
    
    CGFloat dismissDelay = delay < 0 ? self.ljwMessageView.dismissDelay : delay;
    
    [UIView animateWithDuration:0.1 animations:^{
        
        self.ljwMessageView.transform = CGAffineTransformScale(self.ljwMessageView.transform, 1 / 0.9 * 1 / 0.9, 1 / 0.9 * 1 / 0.9);
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.1 animations:^{
            
            self.ljwMessageView.transform = CGAffineTransformScale(self.ljwMessageView.transform, 0.9, 0.9);
            
        } completion:^(BOOL finished) {
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(dismissDelay * 2 / 5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                [UIView animateWithDuration:dismissDelay * 3 / 5 animations:^{
                    
                    if (blockView == self.ljwMessageView) {
                        self.ljwMessageView.alpha = 0;
                    }
                    else
                    {
                        blockView.alpha = 0;
                    }
                    
                } completion:^(BOOL finished) {
                    
                    if (blockView == self.ljwMessageView) {
                        self.ljwMessageView = nil;
                        if (completionBlock) {
                            completionBlock();
                        }
                    }
                    else
                    {
                        [blockView removeFromSuperview];
                    }
                    
                }];
                
            });
            
        }];
        
    }];
    
}

- (void)showMessageViewWithMessage:(NSString *)message completionBlock:(LJWHUDCompletionBlock)completionBlock
{
    [self showMessageViewWithMessage:message dismissDelay:-1 completionBlock:completionBlock];
}

#pragma mark - WaitingView
- (void)showWaitingView
{
    
    self.waitingView = [[LJWWaitingView alloc] initWithFrame:self.bounds];
    
    [self addSubview:self.ljwWaitingView];
    
//    self.userInteractionEnabled = NO;
    
}

- (void)dismissWaitingView
{
    self.waitingView = nil;
    
//    self.userInteractionEnabled = YES;
}

@end
