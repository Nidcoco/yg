//
//  ZFBMomentController.m
//  支付宝
//
//  Created by chao on 16/7/29.
//  Copyright © 2016年 chao. All rights reserved.
//

#import "ZFBMomentController.h"
#import "ZFBMoment.h"
#import "ZFBMomentCell.h"
#import "ZFBMomentHeaderView.h"
#import "NSArray+Addition.h"

static NSString *momentCellID = @"moment_cell";
@interface ZFBMomentController ()
@property (nonatomic, strong) NSArray *momentData;
@end

@implementation ZFBMomentController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.momentData = [NSArray objectListWithPlistName:@"moment.plist" clsName:@"ZFBMoment"];
    
    [self setupUI];
}

- (void)setupUI {
    self.tableView.estimatedRowHeight = 300;
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    self.tableView.tableHeaderView = [ZFBMomentHeaderView momentHeaderView];
    
//    self.tableView.separatorInset = UIEdgeInsetsZero;
//    self.tableView.layoutMargins = UIEdgeInsetsZero;
    
    [self.tableView registerClass:[ZFBMomentCell class] forCellReuseIdentifier:momentCellID];
    
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.tableView.separatorInset = UIEdgeInsetsZero;
    self.tableView.layoutMargins = UIEdgeInsetsZero;


}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
//    cell.separatorInset = UIEdgeInsetsZero;
    cell.layoutMargins = UIEdgeInsetsZero;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.momentData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZFBMomentCell *cell = [tableView dequeueReusableCellWithIdentifier:momentCellID forIndexPath:indexPath];
    cell.moment = self.momentData[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
