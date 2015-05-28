//
//  LJWMessageView.m
//  LJWHUD
//
//  Created by ljw on 15/5/25.
//  Copyright (c) 2015年 ljw. All rights reserved.
//

#import "LJWMessageView.h"

@interface LJWMessageView ()

@property (nonatomic, strong) UILabel *contentLabel;

@property (nonatomic, assign) CGSize maxSize;

@end

@implementation LJWMessageView

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
        
        self.backgroundColor = [UIColor blackColor];
        self.layer.cornerRadius = 5.f;
        self.layer.masksToBounds = YES;
        self.alpha = 1;
        
        self.contentLabel = [[UILabel alloc] initWithFrame:frame];
        self.contentLabel.font = [UIFont boldSystemFontOfSize:15.f];
        self.contentLabel.textColor = [UIColor whiteColor];
        self.contentLabel.textAlignment = NSTextAlignmentCenter;
        self.contentLabel.numberOfLines = 0;
        [self addSubview:self.contentLabel];
        
        self.dismissDelay = 1.5;
        
        CGSize screenSize = [UIApplication sharedApplication].keyWindow.frame.size;
        
        self.maxSize = CGSizeMake(screenSize.width - 20, screenSize.height - 100);
        
        self.animated = YES;
        
    }
    
    return self;
}

//重写setBounds方法在里面设置好子视图的大小
- (void)setBounds:(CGRect)bounds
{
    [super setBounds:bounds];
    
    self.contentLabel.frame = CGRectMake(0, 0, bounds.size.width - 20, bounds.size.height - 20);
    self.contentLabel.center = CGPointMake(bounds.size.width / 2, bounds.size.height / 2);
}

- (CGSize)viewSizeWithContent:(NSString *)content
{

    CGSize resultSize;
    
    CGRect boundingRect = [content boundingRectWithSize:CGSizeMake(self.maxSize.width - 20, self.maxSize.height - 20) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.contentLabel.font} context:nil];
    
    resultSize = boundingRect.size;
    
    resultSize.width += 30;
    resultSize.height += 30;
        
    return resultSize;
}

- (void)setContent:(NSString *)conent
{
    self.contentLabel.text = conent;
}

- (void)dealloc
{
//    NSLog(@"%@ dealloc", self);
}

@end
