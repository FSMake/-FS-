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

@end

@implementation FSEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [_nameField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [_phoneField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    
    _nameField.text = _initialContant.name;
    _phoneField.text = _initialContant.phone;
    
    //先判断登陆按钮是否可点
    [self textChange];
    
    [_nameField becomeFirstResponder];
}

- (void)textChange {
    _doneBtn.enabled = _nameField.text.length && _phoneField.text.length;
}

- (IBAction)doneClick:(id)sender {
    if ([_delegate respondsToSelector:@selector(editViewController:contantEditWillDone:)]) {
//        FSContant *contant = [FSContant contantWithName:_nameField.text phone:_phoneField.text];
        _editingCell.contant.name = _nameField.text;
        _editingCell.contant.phone = _phoneField.text;
        
        [_delegate editViewController:self contantEditWillDone:_editingCell];
    }
    [self.navigationController popViewControllerAnimated:YES];
}


@end
