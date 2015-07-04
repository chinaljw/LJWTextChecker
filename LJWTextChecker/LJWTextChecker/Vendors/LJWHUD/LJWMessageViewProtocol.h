//
//  LJWMessageViewProtocol.h
//  LJWHUD
//
//  Created by ljw on 15/5/25.
//  Copyright (c) 2015年 ljw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol LJWMessageViewProtocol <NSObject>

- (void)setContent:(NSString *)conent;

- (CGFloat)dismissDelay;

- (CGSize)viewSizeWithContent:(NSString *)content;

- (BOOL)animated;

@end
