//
//  FSEditViewController.h
//  私人通讯录(FS)
//
//  Created by 樊樊帅 on 15/4/27.
//  Copyright (c) 2015年 樊樊帅. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FSContant.h"
#import "FSContantTableViewCell.h"

@class FSEditViewController;

@protocol FSEditViewControllerDelegate <NSObject>

- (void)editViewController:(FSEditViewController *)editViewController didEditContant:(FSContant *)contant;

@end

@interface FSEditViewController : UIViewController

@property (strong, nonatomic) FSContant *contant;

@property (strong, nonatomic) id<FSEditViewControllerDelegate> delegate;

@end
