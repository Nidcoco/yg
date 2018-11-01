//
//  FirstViewController.m
//  ZWMSegmentController
//
//  Created by 伟明 on 2017/11/23.
//  Copyright © 2017年 伟明. All rights reserved.
//

#import "FirstViewController.h"
#import "NSArray+Addition.h"
#import "YGGood.h"
#import "YGImage.h"
#import "YGGoodsTableViewCell.h"

#import <OHMySQL/OHMySQL.h>

#import "MJRefresh.h"


@interface FirstViewController ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pagecontrol;
@property(weak,nonatomic)NSTimer *timer;
@property (weak, nonatomic) IBOutlet UITableView *goodsTableView;

@property (nonatomic, strong) NSMutableArray *goodsData;
@property (nonatomic, strong) NSMutableArray *imageIcon;

@end

@implementation FirstViewController



- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offset = self.scrollView.contentOffset.x;
    int page = offset/self.scrollView.frame.size.width;
    self.pagecontrol.currentPage = page;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.timer invalidate];
    self.timer = nil;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(imagechange) userInfo:nil repeats:YES];
    NSRunLoop *currentRunLoop = [NSRunLoop currentRunLoop];
    [currentRunLoop addTimer:self.timer forMode: NSRunLoopCommonModes];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat width = self.scrollView.frame.size.width;
    for (int i = 0; i < 5; i ++) {
        UIImageView *imageView = [[UIImageView alloc]init];
        CGFloat x = width * i;
        imageView.frame = CGRectMake(x, 0 , width , 130);
        NSString *name = [NSString stringWithFormat:@"img_%02d",i+1];
        imageView.image = [UIImage imageNamed:name];
        [self.scrollView addSubview:imageView];
        
    }
    CGFloat maxX = self.scrollView.frame.size.width * 5;
    self.scrollView.contentSize = CGSizeMake(maxX, 0);
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    
    
    self.pagecontrol.numberOfPages = 5;
    self.pagecontrol.currentPage = 0;
    //    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onTapped:)];
    //    [self addGestureRecognizer:tap];
    //    [self.pagecontrol addTarget:self action:@selector(clickPageController:event:) forControlEvents:UIControlEventValueChanged];
    
    //循环播放
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(imagechange) userInfo:nil repeats:YES];
    NSRunLoop *currentRunLoop = [NSRunLoop currentRunLoop];
    [currentRunLoop addTimer:self.timer forMode: NSRunLoopCommonModes];
    
    UILabel *labelHeader = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 375, 15)];
    
    labelHeader.textAlignment = NSTextAlignmentCenter;
    labelHeader.font = [UIFont systemFontOfSize:12];
    labelHeader.textColor = [UIColor grayColor];
    labelHeader.text = @"-------------------个人推荐-------------------";
    labelHeader.backgroundColor = [UIColor whiteColor];
    
    self.goodsTableView.tableHeaderView = labelHeader;
    self.goodsTableView.backgroundColor = [UIColor grayColor];
    
    
    
//数据库
    
    //初始化数据库连接用户
    OHMySQLUser *usr = [[OHMySQLUser alloc]initWithUserName:@"ygmall_admin" password:@"ygmall_admin" serverName:@"120.79.206.190" dbName:@"ygmall" port:3306 socket:nil];
    //初始化连接器
    OHMySQLStoreCoordinator *coordinator = [[OHMySQLStoreCoordinator alloc]initWithUser:usr];
    
    //连接到数据库
    [coordinator connect];
    //初始化设备上下文
    OHMySQLQueryContext *queryContext = [OHMySQLQueryContext new];
    //设置连接器
    queryContext.storeCoordinator = coordinator;
    
    //获取test表中的数据
    OHMySQLQueryRequest *query = [OHMySQLQueryRequestFactory SELECT:@"goods" condition:nil orderBy:@[@"id"] ascending:YES];
    OHMySQLQueryRequest *query1 = [OHMySQLQueryRequestFactory SELECT:@"goods_img" condition:nil orderBy:@[@"goods_id"] ascending:YES];
    NSError *error = nil;
    
    //task用于存放数据库返回的数据
    
    NSArray *tasks = [queryContext executeQueryRequestAndFetchResult:query error:&error];
     NSArray *tasks1 = [queryContext executeQueryRequestAndFetchResult:query1 error:&error];
    
    NSMutableArray *arrayModels = [NSMutableArray array];
    if (tasks != nil) {
        for (NSDictionary *dict in tasks) {
            
            YGGood *model = [YGGood goodWithDict:dict];
            [arrayModels addObject:model];
        }
        _goodsData = arrayModels;
    }
    
    NSMutableArray *arrayModels1 = [NSMutableArray array];
    if (tasks1 != nil) {
        for (NSDictionary *dict in tasks1) {
            if ([dict[@"img_order"] intValue] == 0) {
                YGImage *model = [YGImage imageWithDict:dict];
                [arrayModels1 addObject:model];
            }
        }
        _imageIcon = arrayModels1;
    }
    
    
    [coordinator disconnect];
    
    
    [self addMJRefresh];

}

//- (void)clickPageController:(UIPageControl *)pageController event:(UIEvent *)touchs{
//
//    UITouch *touch = [[touchs allTouches] anyObject];
//    CGPoint p = [touch locationInView:self.pagecontrol];
//    if (p.x>self.scrollView.frame.size.width) {
//        self.pagecontrol.currentPage ++;
//    }
//}
//
//-(NSMutableArray *)goodsData
//{
//    if (_goodsData == nil) {
//
//    }
//
//    return _goodsData;
//    
//}





-(void)imagechange{
    NSInteger page = self.pagecontrol.currentPage;
    if(page == self.pagecontrol.numberOfPages - 1)
    {
        page = 0;
    }
    else{
        page++;
    }
    CGFloat offset = page * self.scrollView.frame.size.width;
    [self.scrollView setContentOffset:CGPointMake(offset, 0) animated:YES];
}



#pragma mark - tableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.goodsData.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    YGGood *model = self.goodsData[indexPath.row];
    YGImage *imageModel = self.imageIcon[indexPath.row];
    
    YGGoodsTableViewCell *cell = [YGGoodsTableViewCell goodsCellWithTableView:tableView];
    
    cell.goods = model;
    cell.imageIcon = imageModel;
    
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
     [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark - 上拉加载下拉刷新方法

- (void) addMJRefresh {
    //添加上拉与下拉的效果
    //下拉 触发加载刷新界面
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        //下拉结束回调，一般写请求网络数据
        sleep(1);
        //停止刷新
        [self.goodsTableView.mj_header endRefreshing];
    }];
    
    [header setTitle:@"下拉刷新" forState:MJRefreshStateIdle];
    [header setTitle: @"释放立即刷新" forState: MJRefreshStatePulling];
    [header setTitle: @"正在刷新" forState: MJRefreshStateRefreshing];
    header.stateLabel.textColor = [UIColor whiteColor];
    
    self.goodsTableView.mj_header = header;
    //上拉 触发加载更多
    MJRefreshBackNormalFooter *footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        //上拉结束回调，一般写请求网络数据
        sleep(1);
        //停止刷新
        [self.goodsTableView.mj_footer endRefreshing];
    }];
    
    [footer setTitle:@"上拉加载" forState:MJRefreshStateIdle];
    [footer setTitle: @"释放立即加载" forState: MJRefreshStatePulling];
    [footer setTitle: @"加载中" forState:MJRefreshStateRefreshing];
    footer.stateLabel.textColor = [UIColor whiteColor];
    _goodsTableView.mj_footer = footer;
}






//
//- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear: animated];
//    [self reloadData];
//}
@end
