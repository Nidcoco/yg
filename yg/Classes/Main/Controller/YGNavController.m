//
//  YGNavController.m
//  yg
//
//  Created by 李俊宇 on 2018/9/26.
//  Copyright © 2018年 李俊宇. All rights reserved.
//

#import "YGNavController.h"

@interface YGNavController ()

@end

@implementation YGNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationBar setTintColor:[UIColor whiteColor]];
    // Do any additional setup after loading the view.
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
}

@end
