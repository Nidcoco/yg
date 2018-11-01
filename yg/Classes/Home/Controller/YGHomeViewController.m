//
//  YGHomeViewController.m
//  YGMall
//
//  Created by 李俊宇 on 2018/9/10.
//  Copyright © 2018年 李俊宇. All rights reserved.
//

#import "YGHomeViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ZWMSegmentController.h"
#import "YGPageController.h"

@interface YGHomeViewController ()

@property (nonatomic, strong) ZWMSegmentController *segmentVC;


@end

@implementation YGHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self test];
    // Do any additional setup after loading the view.
}

- (void)test{
    self.navigationController.navigationBar.translucent = NO;
    UIStoryboard *homePage = [UIStoryboard storyboardWithName:@"Chance" bundle:nil];
    FirstViewController *f = [homePage instantiateInitialViewController];
    SecondViewController *s = [[SecondViewController alloc] init];
    FirstViewController *f1 = [[FirstViewController alloc] init];
    SecondViewController *s1 = [[SecondViewController alloc] init];
    FirstViewController *f2 = [[FirstViewController alloc] init];
    SecondViewController *s2 = [[SecondViewController alloc] init];
    FirstViewController *f3 = [[FirstViewController alloc] init];
    SecondViewController *s3 = [[SecondViewController alloc] init];
    YGPageController *t = [[YGPageController alloc] init];
    NSArray *array = @[f,s,f1,s1,f2,s2,f3,s3,t];
    
    self.segmentVC = [[ZWMSegmentController alloc] initWithFrame:self.view.bounds titles:@[@"精选",@"耐克",@"马利",@"青竹",@"米娅",@"青年",@"得力",@"毕加索",@"马良"]];
    self.segmentVC.segmentView.showSeparateLine = YES;
    self.segmentVC.segmentView.segmentTintColor = [UIColor blackColor];
    self.segmentVC.viewControllers = [array copy];
    if (array.count==1) {
        self.segmentVC.segmentView.style=ZWMSegmentStyleDefault;
    } else {
        self.segmentVC.segmentView.style=ZWMSegmentStyleFlush;
    }
    //    右上角小图标
    //    [self.segmentVC  enumerateBadges:@[@(1),@10]];
    [self addSegmentController:self.segmentVC];
    [self.segmentVC  setSelectedAtIndex:0];
}

@end
