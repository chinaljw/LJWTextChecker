//
//  LJWTextCheckerResultInfo.h
//  LJWTextChecker
//
//  Created by ljw on 15/5/24.
//  Copyright (c) 2015年 ljw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LJWTextCheckerConfig.h"

@interface LJWTextCheckerResultInfo : NSObject

@property (nonatomic, assign) LJWTextCheckingResultType resultType;

@property (nonatomic, strong) id<LJWTextCheckProtocol> someone;

@property (nonatomic, strong) NSString *resultString;

- (void)showResult;

@end
