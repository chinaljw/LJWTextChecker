//
//  LJWTextCheckerResultInfo.m
//  LJWTextChecker
//
//  Created by ljw on 15/5/24.
//  Copyright (c) 2015年 ljw. All rights reserved.
//

#import "LJWTextCheckerResultInfo.h"

@implementation LJWTextCheckerResultInfo

- (void)showResult
{
    
    //这里是默认的展示检查结果的地方,使用block回调将不会调用这个方法。
    
    NSString *resultString = self.resultString;
    
    NSLog(@"%@", resultString);
    
}

- (void)setResultType:(LJWTextCheckingResultType)resultType
{
    _resultType = resultType;
    
    switch (self.resultType) {
            
        case LJWTextCheckingResultTypeEmpty:
        {
            self.resultString = [self.someone emptyDescription];
        }
            break;
        case LJWTextCheckingResultTypeFormatError:
        {
            self.resultString = [self.someone errorDescription];
            
        }
            break;
        case LJWTextCheckingResultTypeCorrect:
        {
            self.resultString = [NSString stringWithFormat:@"%@ is ok!", self.someone];
        }
            break;
        case LJWTextCheckingResultTypeEeverythingIsOK:
        {
            self.resultString = @"Everything is ok!";
        }
            
        default:
            break;
    }
    
}

@end
