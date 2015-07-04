//
//  LJWTextCompareConfig.m
//  LJWTextChecker
//
//  Created by ljw on 15/5/24.
//  Copyright (c) 2015年 ljw. All rights reserved.
//

#import "LJWTextCompareConfig.h"

@implementation LJWTextCompareConfig

- (LJWTextCheckingResultType)compare
{
    if ([[self.object_1 checkedText] isEqualToString:[self.object_2 checkedText]]) {
        return LJWTextCheckingResultTypeCorrect;
    }
    return LJWTextCheckingResultTypeUnlike;
}

@end
