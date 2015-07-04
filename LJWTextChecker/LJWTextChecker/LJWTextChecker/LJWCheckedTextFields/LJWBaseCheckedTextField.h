//
//  LJWBaseCheckedTextField.h
//  Parking
//
//  Created by ljw on 15/4/11.
//  Copyright (c) 2015年 Mark. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LJWTextCheckerConfig.h"

IB_DESIGNABLE
@interface LJWBaseCheckedTextField : UITextField <LJWTextCheckProtocol>

#pragma mark ProtocolProperty
@property (nonatomic, strong) NSString *errorDescription;

@property (nonatomic, assign) BOOL allowEmpty;

@property (nonatomic, strong, readonly) NSString *checkedText;

@property (nonatomic, strong) NSString *emptyDescription;

@property (nonatomic, strong) NSString *regString;

@property (nonatomic, assign) IBInspectable NSUInteger maxTextLength;

/**
 *  检查textField的text是否符合规则
 *
 *  @param completionBlock 完成检查时的回调block
 *
 *  @return 检查的结果枚举
 */
- (LJWTextCheckingResultType)checkTextIsCorrectWithCompletionBlock:(LJWTextCheckerCompetionBlock)completionBlock;

@end
