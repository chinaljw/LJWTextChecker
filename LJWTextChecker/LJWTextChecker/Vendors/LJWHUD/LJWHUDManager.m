//
//  LJWHUDManager.m
//  LJWHUD
//
//  Created by ljw on 15/5/25.
//  Copyright (c) 2015年 ljw. All rights reserved.
//

#import "LJWHUDManager.h"
#import "LJWMessageView.h"
#import "LJWWaitingView.h"

@interface LJWHUDManager ()

@property (nonatomic, strong) UIView<LJWMessageViewProtocol> *messageView;

@property (nonatomic, strong) UIView *waitingView;

@end

@implementation LJWHUDManager

+ (instancetype)defaultManager
{
    static LJWHUDManager *s_LJWHUDManager = nil;
    static dispatch_once_t once;
    
    dispatch_once(&once, ^{
       
        s_LJWHUDManager = [[LJWHUDManager alloc] init];
        
    });
    
    return s_LJWHUDManager;
}

#pragma mark - SetterAndGetter
- (void)setMessageView:(UIView<LJWMessageViewProtocol> *)messageView
{
    [_messageView removeFromSuperview];
    
    _messageView = messageView;
}

- (void)setWaitingView:(UIView *)waitingView
{
    
    [_waitingView removeFromSuperview];
    
    _waitingView = waitingView;
    
}

#pragma mark - MessageView
- (void)showMessageViewWithMessage:(NSString *)message inView:(UIView *)view dismissDelay:(CGFloat)delay completionBlock:(LJWHUDCompletionBlock)completionBlock
{
    
    self.messageView = [[LJWMessageView alloc] initWithFrame:CGRectZero];
    
    [self.messageView setContent:message];
    
    CGSize messageViewSize = [self.messageView viewSizeWithContent:message];

    self.messageView.bounds = CGRectMake(0, 0, messageViewSize.width, messageViewSize.height);
    
    self.messageView.transform = CGAffineTransformScale(self.messageView.transform, 0.9, 0.9);
    
    self.messageView.center = CGPointMake(view.frame.size.width / 2, view.frame.size.height / 2);
    
    [view addSubview:self.messageView];
    
    __block typeof(self.messageView) blockView = self.messageView;
    
    if (!self.messageView.animated) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.messageView.dismissDelay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if (blockView == self.messageView) {
                self.messageView = nil;
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

    CGFloat dismissDelay = delay < 0 ? self.messageView.dismissDelay : delay;
    
    [UIView animateWithDuration:0.1 animations:^{
        
        self.messageView.transform = CGAffineTransformScale(self.messageView.transform, 1 / 0.9 * 1 / 0.9, 1 / 0.9 * 1 / 0.9);
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.1 animations:^{
            
            self.messageView.transform = CGAffineTransformScale(self.messageView.transform, 0.9, 0.9);
            
        } completion:^(BOOL finished) {
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(dismissDelay * 2 / 5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                [UIView animateWithDuration:dismissDelay * 3 / 5 animations:^{
                    
                    if (blockView == self.messageView) {
                        self.messageView.alpha = 0;
                    }
                    else
                    {
                        blockView.alpha = 0;
                    }
                    
                } completion:^(BOOL finished) {
                    
                    if (blockView == self.messageView) {
                        self.messageView = nil;
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

- (void)showMessageViewInKeyWindowMessage:(NSString *)message dismissDelay:(CGFloat)delay completionBlock:(LJWHUDCompletionBlock)completionBlock
{
    [self showMessageViewWithMessage:message inView:[UIApplication sharedApplication].keyWindow dismissDelay:delay completionBlock:completionBlock];
}

- (void)showMessageViewWithMessage:(NSString *)message inView:(UIView *)view completionBlock:(LJWHUDCompletionBlock)completionBlock
{
    [self showMessageViewWithMessage:message inView:view dismissDelay:-1 completionBlock:completionBlock];
}

- (void)showMessageViewInKeyWindowMessage:(NSString *)message completionBlock:(LJWHUDCompletionBlock)completionBlock
{
    [self showMessageViewInKeyWindowMessage:message dismissDelay:-1 completionBlock:completionBlock];
}


#pragma mark - WaitingView
- (void)showWaitingViewInView:(UIView *)view
{

    self.waitingView = [[LJWWaitingView alloc] initWithFrame:view.bounds];
    
    [view addSubview:self.waitingView];
    
}

- (void)dismissWaitingView
{
    self.waitingView = nil;
}

#pragma mark -  AlertView
- (void)showAlert
{
    
    
}

@end
