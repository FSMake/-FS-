//
//  FSContantTableViewCell.m
//  私人通讯录(FS)
//
//  Created by 樊樊帅 on 15/4/27.
//  Copyright (c) 2015年 樊樊帅. All rights reserved.
//

#import "FSContantTableViewCell.h"

@interface FSContantTableViewCell ()

@end

@implementation FSContantTableViewCell

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

@end
