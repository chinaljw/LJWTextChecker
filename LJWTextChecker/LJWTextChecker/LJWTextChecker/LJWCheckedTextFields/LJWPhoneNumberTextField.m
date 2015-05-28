//
//  LJWPhoneNumberTextField.m
//  Parking
//
//  Created by ljw on 15/4/11.
//  Copyright (c) 2015年 Mark. All rights reserved.
//

#import "LJWPhoneNumberTextField.h"

@implementation LJWPhoneNumberTextField

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
        self.regString = RegStringPhoneNumber;
        self.errorDescription = @"手机号格式错误!";
        self.emptyDescription = @"手机号不能为空!";
    }
    return self;
}

- (NSString *)checkedText
{
    return self.text;
}

@end
