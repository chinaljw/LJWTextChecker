//
//  LJWPassworldTextField.m
//  Parking
//
//  Created by ljw on 15/4/11.
//  Copyright (c) 2015年 Mark. All rights reserved.
//

#import "LJWPassworldTextField.h"

@implementation LJWPassworldTextField

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
        self.regString = RegStringPassword;
        self.errorDescription = @"密码格式错误!";
        self.emptyDescription = @"密码不能为空!";
    }
    return self;
}

- (NSString *)checkedText
{
    return self.text;
}

@end
