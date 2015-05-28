//
//  LJWTextFieldChecker.m
//  Parking
//
//  Created by ljw on 15/4/9.
//  Copyright (c) 2015年 Mark. All rights reserved.
//

#import "LJWTextChecker.h"

@implementation LJWTextChecker


/**
 *  正则验证
 *
 *  @param text      需验证文本
 *  @param regString 正则表达式
 *
 *  @return 是否匹配
 */
+ (BOOL)customRegularCheckWithText:(NSString *)text andRegString:(NSString *)regString
{
    NSRegularExpression *expression = [NSRegularExpression regularExpressionWithPattern:regString options:NSRegularExpressionCaseInsensitive error:nil];
    
    NSTextCheckingResult *result = [expression firstMatchInString:text options:0 range:NSMakeRange(0, text.length)];
    
    return !NSEqualRanges(result.range, NSMakeRange(0, 0));
    
}


/**
 *  检查某个东西的文本是否符合
 *  如果completionBlock为nil将使用默认的展示结果的方式。
 *
 *  @param someone         某个东西
 *  @param completionBlock 完成时的block
 *
 *  @return 检查结果枚举
 */
+ (LJWTextResultType)checkSomeoneTextIsCorrect:(id<LJWTextCheckProtocol>)someone completionBlock:(LJWTextCheckerCompetionBlock)completionBlock
{
        
    //判断是否为空
    if (![someone allowEmpty] && [self check_SomeoneTextIsEmpty:someone completionBlock:completionBlock])
    {
        return LJWTextResultTypeEmpty;
    }
    
    //判断格式是否正确
    if (![self check_SomeoneTextIsCorrect:someone completionBlock:completionBlock]) {
        return LJWTextResultTypeFormatError;
    }
    
    //展示结果
    LJWTextCheckerResultInfo *info = [[LJWTextCheckerResultInfo alloc] init];
    info.resultType = LJWTextResultTypeCorrect;
    info.someone = someone;
    
    if (!completionBlock) {
        [self showResultWithResultInfo:info];
    }
    else
    {
        completionBlock(someone);
    }
    
    return LJWTextResultTypeCorrect;
}

/**
 *  检查某个东西的文本是否符合，用于整组检查时
 *  如果completionBlock为nil将使用默认的展示结果的方式。(此方法不会展示结果为正确的结果)
 *
 *  @param someone         某个东西
 *  @param completionBlock 完成时的block回调
 *
 *  @return 结果枚举
 */
+ (LJWTextResultType)checkSomeoneTextIsCorrectInGroup:(id<LJWTextCheckProtocol>)someone completionBlock:(LJWTextCheckerCompetionBlock)completionBlock
{
    
    //判断是否为空
    if (![someone allowEmpty] && [self check_SomeoneTextIsEmpty:someone completionBlock:completionBlock])
    {
        return LJWTextResultTypeEmpty;
    }
    
    //判断格式是否正确
    if ([self check_SomeoneTextIsCorrect:someone completionBlock:completionBlock]) {
        return LJWTextResultTypeFormatError;
    }
    
    return LJWTextResultTypeCorrect;
}


/**
 *  检查某个东西的文本格式是否正确
 *
 *  @param someone         某个东西
 *  @param completionBlock 完成时的回调block
 *
 *  @return 结果枚举类型
 */
+ (LJWTextResultType)check_SomeoneTextIsCorrect:(id<LJWTextCheckProtocol>)someone completionBlock:(LJWTextCheckerCompetionBlock)completionBlock
{
    
    if (![LJWTextChecker customRegularCheckWithText:[someone checkedText] andRegString:[someone regString]]) {
        
        LJWTextCheckerResultInfo *info = [[LJWTextCheckerResultInfo alloc] init];
        info.resultType = LJWTextResultTypeFormatError;
        info.someone = someone;
        
        if (!completionBlock) {
            [self showResultWithResultInfo:info];
        }
        else
        {
            completionBlock(info);
        }
        
        return LJWTextResultTypeFormatError;

    }
    
    return LJWTextResultTypeCorrect;
}

/**
 *  检查某个东西的文本是否为空
 *
 *  @param someone         某个东西
 *  @param completionBlock 完成时的回调block
 *
 *  @return 返回结果枚举
 */
+ (LJWTextResultType)check_SomeoneTextIsEmpty:(id<LJWTextCheckProtocol>)someone completionBlock:(LJWTextCheckerCompetionBlock)completionBlock
{

    if ([[someone checkedText] isEqualToString:@""] || ![someone checkedText]) {
    
        LJWTextCheckerResultInfo *info = [[LJWTextCheckerResultInfo alloc] init];
        info.someone = someone;
        info.resultType = LJWTextResultTypeEmpty;
        
        if (!completionBlock) {
            [self showResultWithResultInfo:info];
        }
        else
        {
            completionBlock(info);
        }
        
        return LJWTextResultTypeEmpty;
        
    }
    
    return LJWTextResultTypeCorrect;
    
}

/**
 *  默认展示结果的方法
 *
 *  @param resultInfo 结果对象
 */
+ (void)showResultWithResultInfo:(LJWTextCheckerResultInfo *)resultInfo
{
    [resultInfo showResult];
}

/**
 *  按顺序检查控件数组里的所有控件
 *  如果completionBlock为nil将使用默认的展示结果的方式。
 *
 *  @param widgets         控件数组内容为, id<LJWLJWTextCheckProtocol>
 *  @param completionBlock 完成时调用的block
 *
 *  @return 检查结果对象
 */
+ (LJWTextCheckerResultInfo *)checkAllWidgets:(NSArray *)widgets completionBlock:(LJWTextCheckerCompetionBlock)completionBlock
{
    
    LJWTextCheckerResultInfo *info = [[LJWTextCheckerResultInfo alloc] init];
    
    for (id<LJWTextCheckProtocol> widget in widgets) {
        
        info.resultType = [widget checkTextIsCorrectInGroupWithCompletionBlock:completionBlock];
        info.someone = widget;
        if (info.resultType) {
            return info;
        }
        
    }
    
    info.resultType = LJWTextResultTypeEeverythingIsOK;
    info.someone = nil;
    
    if (completionBlock) {
        completionBlock(info);
    }
    else
    {
        [self showResultWithResultInfo:info];
    }
    
    return info;
    
}

/**
 *  检查控件数组里需要相等的控件是否相等，数组是比较配置数组.
 *
 *  @param configs         LJWTextCompareCofig数组
 *  @param completionBlock 完成时的回调block
 *
 *  @return 结果对象
 */
+ (LJWTextCompareResultInfo *)comepareObjectWidgetsByConfigs:(NSArray *)configs completionBlock:(LJWTextCheckerCompetionBlock)completionBlock
{
    
    LJWTextCompareResultInfo *info = [[LJWTextCompareResultInfo alloc] init];
    
    for (LJWTextCompareConfig *config in configs) {
        
        if ([config compare]) {
            
            info.resultType = LJWTextResutlTypeUnlike;
            info.config = config;
            
            if (completionBlock) {
                completionBlock(info);
            }
            else
            {
                [self showResultWithResultInfo:info];
            }
            
            return info;
            
        }
        
    }
    
    info.resultType = LJWTextResultTypeEeverythingIsOK;
    
    if (completionBlock) {
        completionBlock(info);
    }
    else
    {
        [self showResultWithResultInfo:info];
    }

    return info;
}

@end
