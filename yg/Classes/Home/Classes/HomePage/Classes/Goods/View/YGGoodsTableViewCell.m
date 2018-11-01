//
//  YGGoodsTableViewCell.m
//  yg
//
//  Created by 李俊宇 on 2018/10/21.
//  Copyright © 2018年 李俊宇. All rights reserved.
//

#import "YGGoodsTableViewCell.h"
#import "YGGood.h"
#import "YGImage.h"
#import "UIImageView+WebCache.h"

@interface YGGoodsTableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *imageview;
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;



@end


@implementation YGGoodsTableViewCell


+ (instancetype)goodsCellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"GOODCELL";
    YGGoodsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
    cell = [[[NSBundle mainBundle] loadNibNamed:@"YGGoodsTableViewCell" owner:nil options:nil] firstObject];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}


-(void)setGoods:(YGGood *)goods
{
    _goods = goods;
//    self.imageview.image = [UIImage imageNamed:goods.icon];
    
    self.label1.text = goods.name;
    self.label2.text = [NSString stringWithFormat:@"￥ %d",goods.price];
    self.label3.text = [NSString stringWithFormat:@"%d 人付款",goods.sale_count];
    
}

-(void)setImageIcon:(YGImage *)imageIcon
{
    _imageIcon = imageIcon;
        [self.imageView sd_setImageWithURL:[NSURL URLWithString:imageIcon.img_url]];
    
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//- (void)prepareForReuse
//{
//    [super prepareForReuse];
//    [self.imageview.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        [obj removeFromSuperview];
//    }];
//}

@end
