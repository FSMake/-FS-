//
//  FSLoginViewController.m
//  私人通讯录(FS)
//
//  Created by 樊樊帅 on 15/4/27.
//  Copyright (c) 2015年 樊樊帅. All rights reserved.
//

#import "FSLoginViewController.h"
#import "MBProgressHUD+MJ.h"
#import "FSContantsTableViewController.h"

@interface FSLoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *accountField;
@property (weak, nonatomic) IBOutlet UITextField *pwdField;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UISwitch *rememberPwdSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *autoLoginSwitch;

@end

@implementation FSLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [_accountField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [_pwdField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    //先判断登陆按钮是否可点
    [self textChange];
}

- (void)textChange {
    _loginBtn.enabled = _accountField.text.length && _pwdField.text.length;
}

//记住密码开关点击
- (IBAction)rememberPwdClick:(UISwitch *)sender {
    if (sender.isOn == NO) {
        [_autoLoginSwitch setOn:NO animated:YES];
    }
}

//自动登录开关点击
- (IBAction)autoLoginClick:(UISwitch *)sender {
    if (sender.isOn == YES) {
        [_rememberPwdSwitch setOn:YES animated:YES];
    }
}

- (IBAction)loginClick {
    [MBProgressHUD showMessage:@"正在登录中" toView:self.view];
    if ([_accountField.text isEqualToString:@"FS"] && [_pwdField.text isEqualToString:@"fs"]) {
        //密码正确
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:self.view];
            [MBProgressHUD showSuccess:@"登录成功"];
            [self performSegueWithIdentifier:@"jumpToContants" sender:nil];
        });
    } else {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:self.view];
            [MBProgressHUD showError:@"账号或密码错误"];
        });
    }
}

//准备跳转
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    FSContantsTableViewController *contantsVc = segue.destinationViewController;
    contantsVc.title = [NSString stringWithFormat:@"%@的联系人列表", _accountField.text];
}

@end
