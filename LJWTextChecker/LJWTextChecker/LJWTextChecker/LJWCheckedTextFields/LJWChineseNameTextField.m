//
//  LJWChineseNameTextField.m
//  Parking
//
//  Created by ljw on 15/5/19.
//  Copyright (c) 2015年 Mark. All rights reserved.
//

#import "LJWChineseNameTextField.h"

@implementation LJWChineseNameTextField

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
        self.regString = RegStringChineseName;
        self.errorDescription = @"姓名格式错误!";
        self.emptyDescription = @"姓名不能为空!";
    }
    return self;
}

- (NSString *)checkedText
{
    return self.text;
}

@end
