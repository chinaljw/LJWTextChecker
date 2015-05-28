//
//  LJWCarNumberTextField.m
//  Parking
//
//  Created by ljw on 15/4/11.
//  Copyright (c) 2015年 Mark. All rights reserved.
//

#import "LJWCarNumberTextField.h"

@implementation LJWCarNumberTextField

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.regString = RegStringCarNumber;
        self.errorDescription = @"车牌格式错误!";
        self.emptyDescription = @"车牌不能为空!";
    }
    return self;
}

- (NSString *)checkedText
{
    return self.text;
}

@end
