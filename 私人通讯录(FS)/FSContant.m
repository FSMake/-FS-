//
//  FSContant.m
//  私人通讯录(FS)
//
//  Created by 樊樊帅 on 15/4/27.
//  Copyright (c) 2015年 樊樊帅. All rights reserved.
//

#import "FSContant.h"

#define FSNameKey @"name"
#define FSPhoneKey @"phone"


@implementation FSContant

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_name forKey:FSNameKey];
    [aCoder encodeObject:_phone forKey:FSPhoneKey];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.name = [aDecoder decodeObjectForKey:FSNameKey];
        self.phone = [aDecoder decodeObjectForKey:FSPhoneKey];
    }
    return self;
}

+ (instancetype)contantWithName:(NSString *)name phone:(NSString *)phone {
    FSContant *contant = [[FSContant alloc] init];
    contant.name = name;
    contant.phone = phone;
    return contant;
}

@end
