//
//  FSContantTableViewCell.m
//  私人通讯录(FS)
//
//  Created by 樊樊帅 on 15/4/27.
//  Copyright (c) 2015年 樊樊帅. All rights reserved.
//

#import "FSContantTableViewCell.h"

@interface FSContantTableViewCell ()

@property (nonatomic, strong) UIView *separator;

@end

@implementation FSContantTableViewCell

- (UIView *)separator {
    if (_separator == nil) {
        _separator = [[UIView alloc] init];
        _separator.backgroundColor = [UIColor blackColor];
        _separator.alpha = 0.2;
        [self.contentView addSubview:_separator];
    }
    return _separator;
}

- (void)setContant:(FSContant *)contant {
    _contant = contant;
    self.textLabel.text = contant.name;
    self.detailTextLabel.text = contant.phone;
}

+ (instancetype)contantTableViewCellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"ContantCell";
    
    FSContantTableViewCell *contantTableViewCell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    return contantTableViewCell;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat separatorH = 1;
    CGFloat separatorW = self.bounds.size.width;
    CGFloat separatorX = 0;
    CGFloat separatorY = self.bounds.size.height - separatorH;
    self.separator.frame = CGRectMake(separatorX, separatorY, separatorW, separatorH);
}

@end
