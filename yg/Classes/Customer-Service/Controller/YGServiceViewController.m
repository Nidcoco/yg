//
//  YGServiceViewController.m
//  yg
//
//  Created by 李俊宇 on 2018/10/3.
//  Copyright © 2018年 李俊宇. All rights reserved.
//

#import "YGServiceViewController.h"
#import "NSArray+Addition.h"
#import "YGFriendCell.h"


static NSString *cellID = @"frined_cell";
static NSString *friendCircleCellID = @"friendCircle_cell";

@interface YGServiceViewController ()

@property (nonatomic, strong) NSArray *friendDatas;

@end
@implementation YGServiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.friendDatas = [NSArray objectListWithPlistName:@"Friends.plist" clsName:@"YGFriend"];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:friendCircleCellID];
    UINib *nib = [UINib nibWithNibName:@"YGFriendCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:cellID];
    
    self.tableView.rowHeight = [[[nib instantiateWithOwner:nib options:nil] firstObject] bounds].size.height;
    
    
}
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.tableView.separatorInset = UIEdgeInsetsZero;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return section ? self.friendDatas.count : 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:friendCircleCellID];
        cell.imageView.image = [UIImage imageNamed:@"APC_timeLineIcon"];
        cell.textLabel.text = @"买家秀";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }
    
    YGFriendCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.friendData = self
    .friendDatas[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return section ? 0 : 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.1;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0) {
        UIStoryboard *moment = [UIStoryboard storyboardWithName:@"ZFBMoment" bundle:nil];
        UIViewController *vc = [moment instantiateInitialViewController];
        vc.navigationItem.title = @"买家秀";
        [self.navigationController pushViewController:vc animated:YES];
        return;
    }

    if (indexPath.section == 1 && indexPath.row == 2) {
        UIStoryboard *chat = [UIStoryboard storyboardWithName:@"LJYChat" bundle:nil];
        UIViewController *vc = [chat instantiateInitialViewController];
        vc.navigationItem.title = @"客服小姐姐";
        [self.navigationController pushViewController:vc animated:YES];
        return;
    }
}
@end
