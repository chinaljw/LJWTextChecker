//
//  ViewController.m
//  LJWTextChecker
//
//  Created by ljw on 15/5/23.
//  Copyright (c) 2015年 ljw. All rights reserved.
//

#import "ViewController.h"
#import "LJWTextChecker.h"
#import "UIViewController+LJWKeyboardHandlerHelper.h"
#import "LJWHUDManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.ljwKeyboardHandler = [[LJWKeyboardHandler alloc] init];
    
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
    
//    [LJWTextChecker checkAllWidgets:@[self.carNumberTextField, self.chineseTextField, self.messageCodeTextField, self.passwordTextField, self.phoneNumberTextField] completionBlock:^(LJWTextCheckerResultInfo *resultInfo) {
//        
//        switch (resultInfo.resultType) {
//            case LJWTextErrorTypeEmpty:
//            {
//                NSLog(@"%@", [resultInfo.someone emptyDescription]);
//            }
//                break;
//            case LJWTextErrorTypeFormetError:
//            {
//                NSLog(@"%@", [resultInfo.someone errorDescription]);
//
//            }
//                break;
//            case LJWTextResultTypeCorrect:
//            {
//                NSLog(@"all correct");
//            }
//                break;
//                
//            default:
//                break;
//        }
//        
//    }];
    
    if ([[LJWTextChecker checkAllWidgets:@[self.carNumberTextField, self.chineseTextField, self.messageCodeTextField, self.passwordTextField, self.phoneNumberTextField] completionBlock:^(LJWTextCheckerResultInfo *resultInfo){
        
        NSString *resultString = nil;
        
        switch (resultInfo.resultType) {
                
            case LJWTextResultTypeEmpty:
            {
                resultString = [resultInfo.someone emptyDescription];
            }
                break;
            case LJWTextResultTypeFormatError:
            {
                resultString = [resultInfo.someone errorDescription];
                
            }
                break;
            case LJWTextResultTypeCorrect:
            {
                resultString = [NSString stringWithFormat:@"%@ is ok!", resultInfo.someone];
            }
                break;
            case LJWTextResultTypeEeverythingIsOK:
            {
                resultString = @"everything is ok!";
            }
                
            default:
                break;
        }
        
        [[LJWHUDManager defaultManager] showMessageViewWithMessage:resultString inView:self.view completionBlock:nil];
        
    }] resultType] > 0) {
        return;
    };
    
    LJWTextCompareConfig *config_1 = [[LJWTextCompareConfig alloc] init];
    config_1.object_1 = self.messageCodeTextField;
    config_1.object_2 = self.passwordTextField;
    config_1.unlikeDescription = @"验证码和密码不相等!";
    
    LJWTextCompareConfig *config_2 = [[LJWTextCompareConfig alloc] init];
    config_2.object_1 = self.passwordTextField;
    config_2.object_2 = self.phoneNumberTextField;
    config_2.unlikeDescription = @"密码和手机号不相等!";
    
    
    [LJWTextChecker comepareObjectWidgetsByConfigs:@[config_1, config_2] completionBlock:^(LJWTextCheckerResultInfo *resultInfo) {
       
        NSString *description = [(LJWTextCompareResultInfo *)resultInfo config].unlikeDescription;
        
        [[LJWHUDManager defaultManager] showMessageViewWithMessage:description inView:self.view completionBlock:nil];
        
    }];
    
}

- (void)test:(UITextField *)test
{
//    NSLog(@"%@, %s", test.text, __FUNCTION__);
}

@end
