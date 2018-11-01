//
//  YGImage.h
//  yg
//
//  Created by 李俊宇 on 2018/10/31.
//  Copyright © 2018年 李俊宇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YGImage : NSObject

@property(nonatomic,copy)NSString *goods_id;
@property(nonatomic,assign)int img_order;
@property(nonatomic,copy)NSString *img_url;


-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)imageWithDict:(NSDictionary *)dict;



@end
