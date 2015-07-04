//
//  LJWTextFieldChecker.h
//  Parking
//
//  Created by ljw on 15/4/9.
//  Copyright (c) 2015年 Mark. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LJWTextCheckerResultInfo.h"
#import "LJWTextCompareResultInfo.h"

typedef void (^CheckCompleteBlock)();

@interface LJWTextChecker : NSObject

/**
 *  检查某个东西的文本是否符合
 *  如果completionBlock为nil将使用默认的展示结果的方式。
 *
 *  @param someone         某个东西
 *  @param completionBlock 完成时的block
 *
 *  @return 检查结果枚举
 */
+ (LJWTextCheckingResultType)checkSomeoneTextIsCorrect:(id<LJWTextCheckProtocol>)someone completionBlock:(LJWTextCheckerCompetionBlock)completionBlock;

/**
 *  检查某个东西的文本是否符合，用于整组检查时
 *  如果completionBlock为nil将使用默认的展示结果的方式。(此方法不会展示结果为正确的结果)
 *
 *  @param someone         某个东西
 *  @param completionBlock 完成时的block回调
 *
 *  @return 结果枚举
 */
+ (LJWTextCheckingResultType)checkSomeoneTextIsCorrectInGroup:(id<LJWTextCheckProtocol>)someone completionBlock:(LJWTextCheckerCompetionBlock)completionBlock;

/**
 *  按顺序检查控件数组里的所有控件
 *  如果completionBlock为nil将使用默认的展示结果的方式。
 *
 *  @param widgets         控件数组内容为, id<LJWLJWTextCheckProtocol>
 *  @param completionBlock 完成时调用的block
 *
 *  @return 检查结果对象
 */
+ (LJWTextCheckerResultInfo *)checkAllWidgets:(NSArray *)widgets completionBlock:(LJWTextCheckerCompetionBlock)completionBlock;

/**
 *  检查控件数组里需要相等的控件是否相等，数组是比较配置数组.
 *
 *  @param configs         LJWTextCompareCofig数组
 *  @param completionBlock 完成时的回调block
 *
 *  @return 结果对象
 */
+ (LJWTextCompareResultInfo *)comepareObjectWidgetsByConfigs:(NSArray *)configs completionBlock:(LJWTextCheckerCompetionBlock)completionBlock;

@end
