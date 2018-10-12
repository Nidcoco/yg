//
//  LJYChat.m
//  微信聊天
//
//  Created by 李俊宇 on 2018/9/11.
//  Copyright © 2018年 李俊宇. All rights reserved.
//

#import "LJYChat.h"

@implementation LJYChat

-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return  self;
}
+(instancetype)chatWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}

@end
