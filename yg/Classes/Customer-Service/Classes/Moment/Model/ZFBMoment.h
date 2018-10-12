//
//  ZFBMoment.h
//  支付宝
//
//  Created by chao on 16/7/29.
//  Copyright © 2016年 chao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZFBMoment : NSObject
@property (nonatomic, assign) BOOL isMine;
@property (nonatomic, copy) NSString * time;
@property (nonatomic, copy) NSString *picture;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *icon;

@end
