//
//  ViewController.h
//  LJWTextChecker
//
//  Created by ljw on 15/5/23.
//  Copyright (c) 2015年 ljw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LJWCarNumberTextField.h"
#import "LJWChineseNameTextField.h"
#import "LJWMessageCodeTextField.h"
#import "LJWPassworldTextField.h"
#import "LJWPhoneNumberTextField.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet LJWCarNumberTextField *carNumberTextField;

@property (weak, nonatomic) IBOutlet LJWChineseNameTextField *chineseTextField;

@property (weak, nonatomic) IBOutlet LJWMessageCodeTextField *messageCodeTextField;

@property (weak, nonatomic) IBOutlet LJWPassworldTextField *passwordTextField;

@property (weak, nonatomic) IBOutlet LJWPhoneNumberTextField *phoneNumberTextField;

@end

