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
    
    //这里是默认的展示检查结果的地方
    
    NSString *resultString = nil;
    
    switch (self.resultType) {
            
        case LJWTextResultTypeEmpty:
        {
            resultString = [self.someone emptyDescription];
        }
            break;
        case LJWTextResultTypeFormatError:
        {
            resultString = [self.someone errorDescription];
            
        }
            break;
        case LJWTextResultTypeCorrect:
        {
            resultString = [NSString stringWithFormat:@"%@ is ok!", self.someone];
        }
            break;
        case LJWTextResultTypeEeverythingIsOK:
        {
            resultString = @"everything is ok!";
        }
            
        default:
            break;
    }
    
    NSLog(@"%@", resultString);
    
}

@end
