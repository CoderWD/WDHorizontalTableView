//
//  ViewController.m
//  WDHorizontalTableView
//
//  Created by 何伟东 Emal:xingfumanong@sina.cn QQ:654500619 on 15/12/18.
//  Copyright © 2015年 何伟东.  All rights reserved.
//

#import "ViewController.h"
#import "WDHorizontalTableView.h"

@interface ViewController ()<WDHorizontalTableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    WDHorizontalTableView *horizontalTableView = [[WDHorizontalTableView alloc] initWithFrame:self.view.bounds];
    [horizontalTableView setColumnWidth:70];
    [horizontalTableView setDelegate:self];
    [self.view addSubview:horizontalTableView];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma WDHorizontalTableViewDelegate
//列数
- (NSInteger)horizontalTableViewNumberOfColumn:(WDHorizontalTableView *)horizontalTableView{
    return 50;
}
- (WDHorizontalTableViewCell *)horizontalTableView:(WDHorizontalTableView *)horizontalTableView cellForColumnIndex:(NSInteger)columnIndex{
    static NSString *identifier = @"WDHorizontalTableViewCell";
    WDHorizontalTableViewCell *cell = [horizontalTableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[WDHorizontalTableViewCell alloc] initWithReuseIdentifier:identifier];
    }
    if (columnIndex%2 == 0) {
        [cell.contentView setBackgroundColor:[UIColor redColor]];
    }else if(columnIndex%3 == 0){
        [cell.contentView setBackgroundColor:[UIColor orangeColor]];
    }else if(columnIndex%5 == 0){
        [cell.contentView setBackgroundColor:[UIColor blackColor]];
    }else if(columnIndex%7 == 0){
        [cell.contentView setBackgroundColor:[UIColor grayColor]];
    }else{
        [cell.contentView setBackgroundColor:[UIColor purpleColor]];
    }
    return cell;
    
}
- (void)tableView:(WDHorizontalTableView *)horizontalTableView didSelectColumnAtIndex:(NSInteger)columnIndex{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
