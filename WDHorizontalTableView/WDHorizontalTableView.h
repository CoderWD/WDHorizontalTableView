//
//  WDHorizontalTableViewItem.h
//  ZYGameCenter
//
//  Created by 何伟东 on 2017/12/28.
//  Copyright © 2017年 何伟东. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WDHorizontalTableViewItem.h"

@class WDHorizontalTableView;
@protocol WDHorizontalTableViewDataSource<NSObject>

@required
-(WDHorizontalTableViewItem *_Nonnull)contentView:(WDHorizontalTableView*_Nullable)orizontalTableView fromIndex:(NSInteger)index;
-(NSInteger)numberOfItemCount;
-(void)swithPageIndex:(NSInteger)idex;

@end

@protocol WDHorizontalTableViewDelegate<NSObject>
@optional
-(void)swithPageIndex:(NSInteger)idex;
@end

@interface WDHorizontalTableView : UIView

@property(nonatomic,assign) CGFloat itemWidth;

@property (nonatomic, weak, nullable) id<WDHorizontalTableViewDataSource> dataSource;
@property (nonatomic, weak, nullable) id<WDHorizontalTableViewDelegate> delegate;

@property (strong, nonatomic) UIScrollView * _Nullable scrollView;
@property (strong, nonatomic) UIView * _Nullable contentView;


/**
 刷新视图
 */
-(void)reloadData;

/**
 复用item

 @return <#return value description#>
 */
-(WDHorizontalTableViewItem*_Nullable)dequeueReusableItem;

@end
