//
//  LJWTextCheckerConfig.h
//  LJWTextChecker
//
//  Created by ljw on 15/5/23.
//  Copyright (c) 2015年 ljw. All rights reserved.
//

#ifndef LJWTextChecker_LJWTextCheckerConfig_h
#define LJWTextChecker_LJWTextCheckerConfig_h

@protocol LJWTextCheckProtocol;
@class LJWTextCheckerResultInfo;

#pragma mark - 自定义类型
typedef NS_ENUM(NSInteger, LJWTextCheckingResultType)
{
    LJWTextCheckingResultTypeCorrect = 0,
    LJWTextCheckingResultTypeEmpty = 1,
    LJWTextCheckingResultTypeFormatError = 2,
    LJWTextCheckingResultTypeUnlike = 3,
    LJWTextCheckingResultTypeEeverythingIsOK = -1,
};

typedef void(^LJWTextCheckerCompetionBlock)(LJWTextCheckerResultInfo *resultInfo);

#pragma mark - 正则表达式集合
static NSString *const RegStringPhoneNumber = @"^[1][3-8]\\d{9}$";
static NSString *const RegStringPassword = @"^[a-zA-z0-9]{6}[a-zA-z0-9]{0,10}$";
static NSString *const RegStringMessageCode = @"^[0-9]\\d{5}$";
static NSString *const RegStringCarNumber = @"^[\u4e00-\u9fa5]{1}[A-Z]{1}[A-Z_0-9]{5}$";
static NSString *const RegStringChineseName = @"^[\u4E00-\u9FA5]{2,5}$";

#pragma mark - 协议
@protocol LJWTextCheckProtocol <NSObject>

@required;

- (LJWTextCheckingResultType)checkTextIsCorrectWithCompletionBlock:(LJWTextCheckerCompetionBlock)completionBlock;

- (LJWTextCheckingResultType)checkTextIsCorrectInGroupWithCompletionBlock:(LJWTextCheckerCompetionBlock)completionBlock;

#pragma mark - PropertyMethod
- (NSString *)errorDescription;

- (BOOL)allowEmpty;

- (NSString *)emptyDescription;

- (NSString *)checkedText;

- (NSString *)regString;

@end

#endif
