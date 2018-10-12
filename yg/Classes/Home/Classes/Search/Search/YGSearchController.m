//
//  YGSearchController.m
//  yg
//
//  Created by 李俊宇 on 2018/9/27.
//  Copyright © 2018年 李俊宇. All rights reserved.
//

#import "YGSearchController.h"

@interface YGSearchController ()


- (IBAction)cancelBtnClick:(id)sender;

@end

@implementation YGSearchController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


//隐藏导航栏
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    
}



- (IBAction)cancelBtnClick:(id)sender {
     [self.navigationController popViewControllerAnimated:YES];
}

//- (void)buttonClick:(NSString *)senderTitle
//{
//    self.searchBar.text = senderTitle;
//    [self searchBarSearchButtonClicked:self.searchBar];
//}
//
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    [self.view endEditing:YES];
//}


@end
