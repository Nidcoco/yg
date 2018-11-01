//
//  YGGood.m
//  yg
//
//  Created by 李俊宇 on 2018/10/22.
//  Copyright © 2018年 李俊宇. All rights reserved.
//

#import "YGGood.h"

@implementation YGGood


-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.id = dict[@"id"];
        self.name = dict[@"name"];
        self.price = [dict[@"price"] intValue];
        self.sale_count = [dict[@"sale_count"] intValue];
    }
    return  self;
}
+(instancetype)goodWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}


@end
