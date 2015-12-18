//
//  WDHorizontalTableViewDelegate.h
//  WDHorizontalTableView
//
//  Created by 何伟东 Emal:xingfumanong@sina.cn QQ:654500619 on 15/12/18.
//  Copyright © 2015年 何伟东.  All rights reserved.
//

#import <Foundation/Foundation.h>

@class WDHorizontalTableView,WDHorizontalTableViewCell;
@protocol WDHorizontalTableViewDelegate <NSObject, UIScrollViewDelegate>

@required
- (NSInteger)horizontalTableViewNumberOfColumn:(WDHorizontalTableView *)horizontalTableView;
- (WDHorizontalTableViewCell *)horizontalTableView:(WDHorizontalTableView *)horizontalTableView cellForColumnIndex:(NSInteger)columnIndex;
@optional
- (void)tableView:(WDHorizontalTableView *)horizontalTableView didSelectColumnAtIndex:(NSInteger)columnIndex;

@end
