//
//  ZFBMomentHeaderView.m
//  支付宝
//
//  Created by chao on 16/7/29.
//  Copyright © 2016年 chao. All rights reserved.
//

#import "ZFBMomentHeaderView.h"
#import "UILabel+Addition.h"
#import "Masonry.h"

@implementation ZFBMomentHeaderView

+ (instancetype)momentHeaderView {
    CGFloat viewH = 185;
    return [[self alloc] initWithFrame:CGRectMake(0, 0, 0, viewH)];
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    UILabel *sceneLabel = [UILabel labelWithText:@"现场" andTextColor:[UIColor darkGrayColor] andFontSize:14];
    [self addSubview:sceneLabel];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"default_nearby_scene"];
    [self addSubview:imageView];
    
    UILabel *friendLabel = [UILabel labelWithText:@"买家秀" andTextColor:[UIColor darkGrayColor] andFontSize:14];
    [self addSubview:friendLabel];
    
    
    CGFloat margin = 8;
    
    [sceneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.offset(margin);
    }];
    
    CGFloat imageviewH = imageView.image.size.height * ([UIScreen mainScreen].bounds.size.width - 2 * margin) / imageView.image.size.width;
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(sceneLabel.mas_bottom).offset(margin);
        make.left.equalTo(sceneLabel);
        make.right.offset(-margin);
        make.height.offset(imageviewH);
    }];
    
    [friendLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageView.mas_bottom).offset(margin);
        make.left.equalTo(imageView);
    }];
}
@end
