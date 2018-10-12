//
//  ZFBMomentCell.m
//  支付宝
//
//  Created by chao on 16/7/29.
//  Copyright © 2016年 chao. All rights reserved.
//

#import "ZFBMomentCell.h"
#import "ZFBMoment.h"
#import "Masonry.h"
#import "UILabel+Addition.h"
#import "UIColor+Addition.h"

@interface ZFBMomentCell ()
@property (nonatomic, weak) UIImageView *iconView;
@property (nonatomic, weak) UILabel *nameLabel;
@property (nonatomic, weak) UILabel *contentLabel;
@property (nonatomic, weak) UIImageView *pictureView;
@property (nonatomic, weak) UILabel *timeLabel;
@property (nonatomic, weak) UIButton *deleteButton;




@end
@implementation ZFBMomentCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    CGFloat margin = 8;
    CGFloat imageViewWH = 45;
    
    UIImageView *iconView = [[UIImageView alloc] init];
    iconView.image = [UIImage imageNamed:@"user01_icon"];
    [self.contentView addSubview:iconView];
    
    [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.offset(margin);
        make.width.height.offset(imageViewWH);
    }];
    
    UILabel *nameLabel = [UILabel labelWithText:@"" andTextColor:[UIColor colorWithHex:0x7686a8] andFontSize:14];
    [self.contentView addSubview:nameLabel];
    
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(iconView);
        make.left.equalTo(iconView.mas_right).offset(margin);
    }];
    
    UILabel *contentLabel = [UILabel labelWithText:@"" andTextColor:[UIColor darkGrayColor] andFontSize:14];
    contentLabel.numberOfLines = 0;
    [self.contentView addSubview:contentLabel];
    
    [contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(nameLabel.mas_bottom).offset(margin);
        make.left.equalTo(nameLabel);
        make.right.offset(-margin);
    }];
    
    UIImageView *pictureView = [[UIImageView alloc] init];
    [self.contentView addSubview:pictureView];
    
    [pictureView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(contentLabel.mas_bottom).offset(margin);
        make.left.equalTo(contentLabel);
        make.width.height.offset(0);
    }];
    
    UILabel *timeLabel = [UILabel labelWithText:@"" andTextColor:[UIColor darkGrayColor] andFontSize:12];
    [self.contentView addSubview:timeLabel];
    
    [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(pictureView.mas_bottom).offset(margin);
        make.left.equalTo(pictureView);
    }];
    
    UIButton *deleteButton = [[UIButton alloc] init];
    deleteButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [deleteButton setTitle:@"删除" forState:UIControlStateNormal];
    [deleteButton setTitleColor:[UIColor colorWithHex:0x6c7ea2] forState:UIControlStateNormal];
    [deleteButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [self.contentView addSubview:deleteButton];
    
    [deleteButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(timeLabel.mas_right).offset(margin);
        make.centerY.equalTo(timeLabel);
    }];
    
    UIButton *commentButton = [[UIButton alloc] init];
    [commentButton setImage:[UIImage imageNamed:@"more"] forState:UIControlStateNormal];
    [self.contentView addSubview:commentButton];
    
    [commentButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(deleteButton);
        make.right.offset(-margin);
        make.bottom.offset(-margin);
    }];
    
    self.iconView = iconView;
    self.nameLabel = nameLabel;
    self.contentLabel = contentLabel;
    self.pictureView = pictureView;
    self.timeLabel = timeLabel;
    self.deleteButton = deleteButton;
    
}

- (void)setMoment:(ZFBMoment *)moment {
    _moment = moment;
    
    self.iconView.image = [UIImage imageNamed:moment.icon];
    self.nameLabel.text = moment.name;
    self.contentLabel.text = moment.content;
    
    if (moment.picture) {
        self.pictureView.image = [UIImage imageNamed:moment.picture];
        
        [self.pictureView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.offset(150);
            CGFloat pictureViewW = 150 * self.pictureView.image.size.width / self.pictureView.image.size.height;
            make.width.offset(pictureViewW);
        }];
    } else {
        [self.pictureView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.width.offset(0);
        }];
    }
    
    self.timeLabel.text = moment.time;
    
    self.deleteButton.hidden = !moment.isMine;
    
    
}

@end
