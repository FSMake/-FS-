//
//  FSContantTableViewCell.m
//  私人通讯录(FS)
//
//  Created by 樊樊帅 on 15/4/27.
//  Copyright (c) 2015年 樊樊帅. All rights reserved.
//

#import "FSContantTableViewCell.h"

@interface FSContantTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *nameLable;

@property (weak, nonatomic) IBOutlet UILabel *phoneLable;

@end

@implementation FSContantTableViewCell

+ (instancetype)contantTableViewCellWithContant:(FSContant *)contant {
    FSContantTableViewCell *contantTableViewCell = [[[NSBundle mainBundle] loadNibNamed:@"FSContantTableViewCell" owner:nil options:nil] lastObject];

    contantTableViewCell.contant = contant;
    contantTableViewCell.nameLable.text = contant.name;
    contantTableViewCell.phoneLable.text = contant.name;
    return contantTableViewCell;
}

- (IBAction)Click:(id)sender {
    NSLog(@"name:%@", _nameLable.text);
    if ([_delegate respondsToSelector:@selector(contantTableViewCell:clickWithContant:)]) {
        [_delegate contantTableViewCell:self clickWithContant:_contant];
    }
}

- (void)refresh {
    self.nameLable.text = self.contant.name;
    self.phoneLable.text = self.contant.phone;
}

@end
