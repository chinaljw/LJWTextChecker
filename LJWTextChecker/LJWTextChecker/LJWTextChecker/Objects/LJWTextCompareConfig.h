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

@property (nonatomic, strong) NSString *unlikeDescription;

- (LJWTextResultType)compare;

@end
