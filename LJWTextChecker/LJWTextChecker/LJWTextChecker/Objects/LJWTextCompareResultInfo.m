//
//  LJWTextCompareResultInfo.m
//  LJWTextChecker
//
//  Created by ljw on 15/5/24.
//  Copyright (c) 2015年 ljw. All rights reserved.
//

#import "LJWTextCompareResultInfo.h"

@implementation LJWTextCompareResultInfo

- (void)showResult
{
    
    //这里是默认的展示比较结果的地方
    
    if (self.resultType) {
        NSLog(@"%@", self.config.unlikeDescription);
    }
    else
    {
        NSLog(@"same");
    }
}

@end
