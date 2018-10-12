//
//  YGMineViewController.m
//  YGMall
//
//  Created by 李俊宇 on 2018/9/10.
//  Copyright © 2018年 李俊宇. All rights reserved.
//

#import "YGMineViewController.h"
#import "LZHPersonalCenterView.h"
#import "MMZCViewController.h"

@interface YGMineViewController ()<LZHPersonalCenterViewDelegate>

@end

@implementation YGMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor] ;
    
    NSArray * centerArr = @[@[@"保障",@"卡包"],@[@"美容",@"商城",@"天气"],@[@"问诊"]] ;
    LZHPersonalCenterView * pcv = [[LZHPersonalCenterView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) CenterArr:centerArr isShowHeader:YES];
    pcv.delegate = self ;
    //按需求定是否需要
    pcv.extendCenterRightArr = @[@[@"",@"余额不足"],@[@"看你美的",@"",@"玛丽亚台风"],@[@""]] ;
    [self.view addSubview:pcv];
}

-(void)tapHeader
{
     MMZCViewController *login=[[MMZCViewController alloc]init];
    [self.navigationController pushViewController:login animated:YES];
}


@end
