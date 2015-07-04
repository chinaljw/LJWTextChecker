//
//  LJWTextCompareResultInfo.m
//  LJWTextChecker
//
//  Created by ljw on 15/5/24.
//  Copyright (c) 2015年 ljw. All rights reserved.
//

#import "LJWTextCompareResultInfo.h"

@implementation LJWTextCompareResultInfo

@synthesize resultType = _resultType;

- (void)showResult
{
    
    //这里是默认的展示比较结果的地方,使用block回调将不会调用这个方法
    
    if (self.resultType) {
        NSLog(@"%@", self.config.unlikeDescription);
    }
    else
    {
        NSLog(@"same");
    }
}

- (void)setResultType:(LJWTextCheckingResultType)resultType
{
    _resultType = resultType;
    
    if (self.resultType == LJWTextCheckingResultTypeUnlike) {
        self.resultString = self.config.unlikeDescription;
    }
    else
    {
        self.resultString = @"all the same";
    }
    
}

@end
