//
//  LJWWaitingView.m
//  LJWHUD
//
//  Created by ljw on 15/5/26.
//  Copyright (c) 2015年 ljw. All rights reserved.
//

#import "LJWWaitingView.h"

static CGFloat const sideLength = 80;

@implementation LJWWaitingView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIView *indicatorBackground = [[UIView alloc] initWithFrame:CGRectMake(0, 0, sideLength, sideLength)];
        indicatorBackground.backgroundColor = [UIColor blackColor];
        indicatorBackground.alpha = 1;
        indicatorBackground.layer.cornerRadius = 5.f;
        indicatorBackground.layer.masksToBounds = YES;
        [self addSubview:indicatorBackground];
        indicatorBackground.center = CGPointMake(frame.size.width / 2, frame.size.height / 2);
        
        UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        indicator.color = [UIColor whiteColor];
        [indicatorBackground addSubview:indicator];
        indicator.frame = indicatorBackground.bounds;
        
        [indicator startAnimating];
        
        UIView *backgroundView = [[UIView alloc] initWithFrame:self.bounds];
        backgroundView.backgroundColor = [UIColor blackColor];
        backgroundView.alpha = 0.25;
        
        self.userInteractionEnabled = NO;
        
        [self addSubview:backgroundView];
        
    }
    return self;
}

- (void)dealloc
{
//    NSLog(@"%@ dealloc", self);
}

@end
