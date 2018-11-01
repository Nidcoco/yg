//
//  YGGoodsTableViewCell.h
//  yg
//
//  Created by 李俊宇 on 2018/10/21.
//  Copyright © 2018年 李俊宇. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YGGood,YGImage;
@interface YGGoodsTableViewCell : UITableViewCell


@property(nonatomic,strong)YGGood *goods;
@property(nonatomic,strong)YGImage *imageIcon;



+(instancetype)goodsCellWithTableView:(UITableView *)tableView;

@end
