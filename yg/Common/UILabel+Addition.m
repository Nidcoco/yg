//
//  UILabel+Addition.m
//  支付宝
//
//  Created by chao on 16/7/29.
//  Copyright © 2016年 chao. All rights reserved.
//

#import "UILabel+Addition.h"


@implementation UILabel (Addition)
+ (instancetype)labelWithText:(NSString *)text andTextColor:(UIColor *)textColor andFontSize:(CGFloat)fontSize {
    UILabel *label = [[UILabel alloc]  init];
    label.text = text;
    label.textColor = textColor;
    label.font = [UIFont systemFontOfSize:fontSize];
    return label;
}
@end
