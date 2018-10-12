//
//  LJYChat.h
//  微信聊天
//
//  Created by 李俊宇 on 2018/9/11.
//  Copyright © 2018年 李俊宇. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef enum : NSUInteger {
    LJYChatMessageTypeOther,
    LJYChatMessageTypeMe,
} LJYChatMessageType;


@interface LJYChat : NSObject



@property(nonatomic,copy)NSString *text;
@property(nonatomic,copy)NSString *time;


@property(nonatomic,assign) LJYChatMessageType type;


-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)chatWithDict:(NSDictionary *)dict;

@end
