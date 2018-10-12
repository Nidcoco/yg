//
//  LJYChatViewController.m
//  微信聊天
//
//  Created by 李俊宇 on 2018/9/11.
//  Copyright © 2018年 李俊宇. All rights reserved.
//

#import "LJYChatViewController.h"
#import "LJYChat.h"
#import "LJYChatCell.h"

@interface LJYChatViewController ()<UITableViewDataSource,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property(nonatomic,strong)NSMutableArray *chatArray;

@property(nonatomic,copy)NSString *previousTime;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *sendBarButtomConstraint;

//系统时间
@property(nonatomic,copy)NSString *dataStr;

@property(nonatomic,strong)NSDictionary *autoReplyData;



@end

@implementation LJYChatViewController





- (NSMutableArray *) chatArray{
    
    if(_chatArray == nil){
        
        NSString *path = [[NSBundle mainBundle]pathForResource:@"Chats.plist" ofType:nil];
        NSArray *arrayDict = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrayModels = [NSMutableArray array];
        
        for (NSDictionary *dict in arrayDict) {
            
            LJYChat *model = [LJYChat chatWithDict:dict];
            
            if ([model.time isEqualToString:self.previousTime]) {
                model.time = nil;
            }else{
                self.previousTime = model.time;
            }
            
            [arrayModels addObject:model];
            
        }
        _chatArray = arrayModels;
    }
    return _chatArray;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.chatArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    
    
//    static NSString *ID = @"cnm";
//    LJYChatCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
//    if (cell == nil) {
//        cell = [[LJYChatCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
//        cell.chat =  self.chatArray[indexPath.row];
//    }
//    return cell;
    LJYChat *chat = self.chatArray[indexPath.row];
    
    LJYChatCell *cell = [tableView dequeueReusableCellWithIdentifier:chat.type == LJYChatMessageTypeMe?@"rnm":@"cnm" forIndexPath:indexPath];
//    cell.chat = self.chatArray[indexPath.row];
    cell.chat = chat;
    
    return cell;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //加载数据
    self.autoReplyData = [self loadAutoReplyData];
    
    //设置预估行高
    self.tableView.estimatedRowHeight = 200;
    //自动计算行高
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    //监听键盘frame改变的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrameNotification:) name:UIKeyboardWillChangeFrameNotification object:nil];
}

- (void)keyboardWillChangeFrameNotification:(NSNotification *)note
{
    
    
    
    
    NSDictionary *dict = note.userInfo;
    CGRect keyboardFrame = [dict[UIKeyboardFrameEndUserInfoKey]CGRectValue];
    CGFloat moveValue = self.view.bounds.size.height - keyboardFrame.origin.y;
    
    
//    [UIView animateWithDuration:2.0 animations:^{
//        [self.view layoutIfNeeded];
//        self.sendBarButtomConstraint.constant = -moveValue;
//    }];
    self.sendBarButtomConstraint.constant = -moveValue;
    
    
    
    
    
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


//自动回复

-(NSString *)autoReplyWithText:(NSString *)text
{
    for (NSInteger i = 0; i < text.length; i++) {

        NSString *keyWord = [text substringWithRange:NSMakeRange(i, 1)];

        if (self.autoReplyData[keyWord])
        {
            return self.autoReplyData[keyWord];
        }
    }
    return @"你说什么吖，我都听不懂！";
    
    
}


-(void)sendMessageWithText:(NSString *)text andMessageType:(LJYChatMessageType)type
{
    LJYChat *chat = [[LJYChat alloc]init];
//
////     NSString *path = [[NSBundle mainBundle]pathForResource:@"Chats.plist" ofType:nil];
//    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
//    NSString *plistPath1 = [paths objectAtIndex:0];
    
    //得到完整的文件名
//    NSString *filename=[plistPath1 stringByAppendingPathComponent:@"Chats.plist"];
    
    
    chat.time = self.dataStr;
    chat.type = type;
    chat.text = text;
    
    
    
    
   
    
    
   
    
    if ([chat.time isEqualToString:self.previousTime]) {
        chat.time = nil;
    }else{
        self.previousTime = chat.time;
    }
    
    [self.chatArray addObject:chat];
    
    
//    [self.chatArray writeToFile:filename atomically:YES];
    
}



-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //获取系统时间
    NSDate *date=[NSDate date];
    NSDateFormatter *format1=[[NSDateFormatter alloc] init];
    //yyyy-MM-dd hh:mm:ss,hh表示12小时制，HH表示24小时
    [format1 setDateFormat:@"HH:mm"];
    self.dataStr = [format1 stringFromDate:date];
    
    
    [self sendMessageWithText:textField.text andMessageType:LJYChatMessageTypeMe];
    
    [self sendMessageWithText:[self autoReplyWithText:textField.text] andMessageType:LJYChatMessageTypeOther];
    
    
    
    
    [self.tableView reloadData];
    
    textField.text = nil;
    return  YES;
}


- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    NSIndexPath *index = [NSIndexPath indexPathForRow:self.chatArray.count - 1 inSection:0];
    
    [self.tableView scrollToRowAtIndexPath:index atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    
    
    
}


-(NSDictionary *)loadAutoReplyData{
    return [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"AutoReply.plist" ofType:nil]];
}


@end
