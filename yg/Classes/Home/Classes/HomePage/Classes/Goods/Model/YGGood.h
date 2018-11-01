//
//  YGGood.h
//  yg
//
//  Created by 李俊宇 on 2018/10/22.
//  Copyright © 2018年 李俊宇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YGGood : NSObject

@property(nonatomic,copy)NSString *id;
@property(nonatomic,copy)NSString *name;

@property(nonatomic,assign)int price;
@property(nonatomic,assign)int sale_count;




-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)goodWithDict:(NSDictionary *)dict;

@end
