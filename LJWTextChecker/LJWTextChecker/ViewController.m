//
//  ViewController.m
//  LJWTextChecker
//
//  Created by ljw on 15/5/23.
//  Copyright (c) 2015年 ljw. All rights reserved.
//

#import "ViewController.h"
#import "LJWTextChecker.h"
#import "LJWKeyboardHandlerHeaders.h"
#import "LJWHUDManager.h"
#import "UIView+LJWHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self registerLJWKeyboardHandler];
    
    [self.carNumberTextField addTarget:self action:@selector(test:) forControlEvents:UIControlEventEditingChanged];
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didClickCheckingButton:(UIButton *)sender {
    
    [self.view endEditing:YES];

    //check format
    if ([[LJWTextChecker checkAllWidgets:@[self.carNumberTextField, self.chineseTextField, self.messageCodeTextField, self.passwordTextField, self.phoneNumberTextField] completionBlock:^(LJWTextCheckerResultInfo *resultInfo){
        
        [[LJWHUDManager defaultManager] showMessageViewWithMessage:resultInfo.resultString inView:self.view completionBlock:nil];
        
        
        
    }] resultType] > 0) {
        return;
    };
    
    
    //compare
    LJWTextCompareConfig *config_1 = [[LJWTextCompareConfig alloc] init];
    config_1.object_1 = self.messageCodeTextField;
    config_1.object_2 = self.passwordTextField;
    config_1.unlikeDescription = @"验证码和密码不相等!";
    
    LJWTextCompareConfig *config_2 = [[LJWTextCompareConfig alloc] init];
    config_2.object_1 = self.passwordTextField;
    config_2.object_2 = self.phoneNumberTextField;
    config_2.unlikeDescription = @"密码和手机号不相等!";
    
    
    [LJWTextChecker comepareObjectWidgetsByConfigs:@[config_1] completionBlock:^(LJWTextCheckerResultInfo *resultInfo) {
        
        [[LJWHUDManager defaultManager] showMessageViewWithMessage:resultInfo.resultString inView:self.view completionBlock:nil];
        
    }];
    
}

- (void)test:(UITextField *)test
{
//    NSLog(@"%@, %s", test.text, __FUNCTION__);
}

@end
