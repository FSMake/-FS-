//
//  FSAddViewController.m
//  私人通讯录(FS)
//
//  Created by 樊樊帅 on 15/4/27.
//  Copyright (c) 2015年 樊樊帅. All rights reserved.
//

#import "FSAddViewController.h"

@interface FSAddViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;

@end

@implementation FSAddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [_nameField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [_phoneField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    //先判断添加按钮是否可点
    [self textChange];
    [_nameField becomeFirstResponder];
}

- (void)textChange {
    _addBtn.enabled = _nameField.text.length && _phoneField.text.length;
}

- (IBAction)addClick:(id)sender {
    if ([_delegate respondsToSelector:@selector(addViewController:addContant:)]) {
        FSContant *contant = [FSContant contantWithName:_nameField.text phone:_phoneField.text];
        [_delegate addViewController:self addContant:contant];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

@end
