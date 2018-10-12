//
//  YGFriendCell.m
//  yg
//
//  Created by 李俊宇 on 2018/10/3.
//  Copyright © 2018年 李俊宇. All rights reserved.
//

#import "YGFriendCell.h"
#import "YGFriend.h"


@interface YGFriendCell()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleView;

@property (weak, nonatomic) IBOutlet UILabel *subTitleView;

@property (weak, nonatomic) IBOutlet UILabel *timeView;

@end




@implementation YGFriendCell


- (void)setFriendData:(YGFriend *)friendData {
    _friendData = friendData;
    
    self.iconView.image = [UIImage imageNamed:friendData.icon];
    self.titleView.text = friendData.title;
    self.subTitleView.text = friendData.subTitle;
    self.timeView.text = friendData.time;
    
}



@end
