//
//  FSContantTableViewCell.h
//  私人通讯录(FS)
//
//  Created by 樊樊帅 on 15/4/27.
//  Copyright (c) 2015年 樊樊帅. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FSContant.h"

@class FSContantTableViewCell;

@protocol FSContantTableViewCellDelegate <NSObject>

- (void)contantTableViewCell:(FSContantTableViewCell *)contantTableViewCell clickWithContant:(FSContant *)contant;

@end

@interface FSContantTableViewCell : UITableViewCell

@property (strong, nonatomic) FSContant *contant;

@property (strong, nonatomic) id<FSContantTableViewCellDelegate> delegate;

+ (instancetype)contantTableViewCellWithContant:(FSContant *)contant;

- (void)refresh;

@end
