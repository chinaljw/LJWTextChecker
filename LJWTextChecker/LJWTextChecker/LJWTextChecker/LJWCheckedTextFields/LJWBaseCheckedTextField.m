//
//  LJWBaseCheckedTextField.m
//  Parking
//
//  Created by ljw on 15/4/11.
//  Copyright (c) 2015年 Mark. All rights reserved.
//

#import "LJWBaseCheckedTextField.h"
#import "LJWTextChecker.h"

@implementation LJWBaseCheckedTextField

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.allowEmpty = NO;
        [self addTarget:self action:@selector(didTextChanged:) forControlEvents:UIControlEventEditingChanged];
    }
    return self;
}

- (void)awakeFromNib
{
    self.maxTextLength = self.maxTextLength ? self.maxTextLength : NSIntegerMax;
}

#pragma  mark - LJWTextCheckProtocol
- (LJWTextResultType)checkTextIsCorrectWithCompletionBlock:(LJWTextCheckerCompetionBlock)completionBlock
{
    
    return [LJWTextChecker checkSomeoneTextIsCorrect:self completionBlock:completionBlock];
    
}

- (LJWTextResultType)checkTextIsCorrectInGroupWithCompletionBlock:(LJWTextCheckerCompetionBlock)completionBlock
{
    return [LJWTextChecker checkSomeoneTextIsCorrectInGroup:self completionBlock:completionBlock];
}

#pragma mark - 
- (void)didTextChanged:(UITextField *)textField
{
    if (textField.text.length > self.maxTextLength) {
        textField.text = [textField.text substringToIndex:self.maxTextLength];
    }
}

@end
