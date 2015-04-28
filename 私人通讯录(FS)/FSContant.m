//
//  FSContant.m
//  私人通讯录(FS)
//
//  Created by 樊樊帅 on 15/4/27.
//  Copyright (c) 2015年 樊樊帅. All rights reserved.
//

#import "FSContant.h"

@implementation FSContant

+ (instancetype)contantWithName:(NSString *)name phone:(NSString *)phone {
    FSContant *contant = [[FSContant alloc] init];
    contant.name = name;
    contant.phone = phone;
    return contant;
}

@end
