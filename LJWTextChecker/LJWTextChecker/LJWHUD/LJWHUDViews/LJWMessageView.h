//
//  LJWMessageView.h
//  LJWHUD
//
//  Created by ljw on 15/5/25.
//  Copyright (c) 2015年 ljw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LJWMessageViewProtocol.h"

@interface LJWMessageView : UIView <LJWMessageViewProtocol>

@property (nonatomic, assign) CGFloat dismissDelay;

@property (nonatomic, assign) BOOL animated;

@end
