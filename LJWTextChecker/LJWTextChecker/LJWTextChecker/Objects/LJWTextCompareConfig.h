//
//  LJWTextCompareConfig.h
//  LJWTextChecker
//
//  Created by ljw on 15/5/24.
//  Copyright (c) 2015年 ljw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LJWTextCheckerConfig.h"

@interface LJWTextCompareConfig : NSObject

@property (nonatomic, assign) id<LJWTextCheckProtocol> object_1;

@property (nonatomic, assign) id<LJWTextCheckProtocol> object_2;

/**
 *  两个元素不一样时的描述
 */
@property (nonatomic, strong) NSString *unlikeDescription;

/**
 *  比较两个元素是否一样
 *
 *  @return 结果
 */
- (LJWTextCheckingResultType)compare;

@end
