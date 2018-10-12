//
//  LJYChatCell.m
//  微信聊天
//
//  Created by 李俊宇 on 2018/9/12.
//  Copyright © 2018年 李俊宇. All rights reserved.
//

#import "LJYChatCell.h"
#import "LJYChat.h"

@interface LJYChatCell()

//@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
//@property (weak, nonatomic) IBOutlet UILabel *messageLabel;

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (weak, nonatomic) IBOutlet UILabel *messageLabel;



@end

@implementation LJYChatCell

 -(void)setChat:(LJYChat *)chat
{
    _chat = chat;
    self.timeLabel.text = chat.time;
    self.messageLabel.text = chat.text; 
}

@end
