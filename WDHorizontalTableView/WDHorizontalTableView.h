//
//  WDHorizontalTableView.h
//  WDHorizontalTableView
//
//  Created by 何伟东 Emal:xingfumanong@sina.cn QQ:654500619 on 15/12/18.
//  Copyright © 2015年 何伟东.  All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WDHorizontalTableViewCell.h"
#import "WDHorizontalTableViewCellPool.h"
#import "WDHorizontalTableViewDelegate.h"

@interface WDHorizontalTableView : UIScrollView{
    id <WDHorizontalTableViewDelegate> _delegate;
    NSInteger columnCount;
}

@property(nullable,nonatomic,weak) id <WDHorizontalTableViewDelegate> delegate;
//取复用池
-(WDHorizontalTableViewCell*)dequeueReusableCellWithIdentifier:(NSString*)identifier;
@property(nonatomic,assign) CGFloat columnWidth;
@end
