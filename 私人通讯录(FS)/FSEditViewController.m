//
//  FSEditViewController.m
//  私人通讯录(FS)
//
//  Created by 樊樊帅 on 15/4/27.
//  Copyright (c) 2015年 樊樊帅. All rights reserved.
//

#import "FSEditViewController.h"

@interface FSEditViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UIButton *doneBtn;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *editBarBtn;

@end

@implementation FSEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [_nameField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [_phoneField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    
    _nameField.text = _contant.name;
    _phoneField.text = _contant.phone;
    
    //先判断登陆按钮是否可点
    [self textChange];
    
//    [_nameField becomeFirstResponder];
}

- (void)textChange {
    _doneBtn.enabled = _nameField.text.length && _phoneField.text.length;
}
- (IBAction)editDone:(UIBarButtonItem *)sender {
    if ([sender.title isEqualToString:@"编辑"]) {
        sender.title = @"取消";
        _nameField.enabled = YES;
        _phoneField.enabled = YES;
        _doneBtn.hidden = NO;
        [_phoneField becomeFirstResponder];
    } else {
        sender.title = @"编辑";
        _nameField.text = _contant.name;
        _phoneField.text = _contant.phone;
        [self.view endEditing:YES];
        _nameField.enabled = NO;
        _phoneField.enabled = NO;
        _doneBtn.hidden = YES;
    }
}

- (IBAction)doneClick:(id)sender {
    if ([_delegate respondsToSelector:@selector(editViewController:didEditContant:)]) {
//        FSContant *contant = [FSContant contantWithName:_nameField.text phone:_phoneField.text];
        _contant.name = _nameField.text;
        _contant.phone = _phoneField.text;
        
        [_delegate editViewController:self didEditContant:_contant];
    }
    [self.navigationController popViewControllerAnimated:YES];
}


@end
