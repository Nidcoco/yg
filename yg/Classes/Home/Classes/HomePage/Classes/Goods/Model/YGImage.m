//
//  YGImage.m
//  yg
//
//  Created by 李俊宇 on 2018/10/31.
//  Copyright © 2018年 李俊宇. All rights reserved.
//

#import "YGImage.h"

@implementation YGImage


-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
            self.goods_id = dict[@"goods_id"];
            self.img_url = dict[@"img_url"];
            self.img_order = [dict[@"img_order"] intValue];
    }
    return  self;
}
+(instancetype)imageWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}




@end
