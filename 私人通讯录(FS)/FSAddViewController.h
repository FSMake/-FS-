//
//  FSAddViewController.h
//  私人通讯录(FS)
//
//  Created by 樊樊帅 on 15/4/27.
//  Copyright (c) 2015年 樊樊帅. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FSContant.h"

@class FSAddViewController;

@protocol FSAddViewControllerDeldgate <NSObject>

@optional
- (void)addViewController:(FSAddViewController *)addViewController addContant:(FSContant *)contant;

@end

@interface FSAddViewController : UIViewController

@property (strong, nonatomic) id<FSAddViewControllerDeldgate> delegate;

@end
