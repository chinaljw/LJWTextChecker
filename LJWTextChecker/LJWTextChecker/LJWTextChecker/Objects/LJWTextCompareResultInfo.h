//
//  LJWTextCompareResultInfo.h
//  LJWTextChecker
//
//  Created by ljw on 15/5/24.
//  Copyright (c) 2015年 ljw. All rights reserved.
//

#import "LJWTextCheckerResultInfo.h"
#import "LJWTextCompareConfig.h"

@interface LJWTextCompareResultInfo : LJWTextCheckerResultInfo

@property (nonatomic, strong) LJWTextCompareConfig *config;

@property (nonatomic, assign) LJWTextCheckingResultType resultType;

@end
