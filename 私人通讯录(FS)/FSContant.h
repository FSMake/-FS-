//
//  FSContant.h
//  私人通讯录(FS)
//
//  Created by 樊樊帅 on 15/4/27.
//  Copyright (c) 2015年 樊樊帅. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FSContant : NSObject <NSCoding>

@property (copy, nonatomic) NSString *name;

@property (copy, nonatomic) NSString *phone;

+ (instancetype)contantWithName:(NSString *)name phone:(NSString *)phone;

@end
