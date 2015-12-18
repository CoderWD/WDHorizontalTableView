//
//  WDHorizontalTableCell.h
//  WDHorizontalTableView
//
//  Created by 何伟东 Emal:xingfumanong@sina.cn QQ:654500619 on 15/12/18.
//  Copyright © 2015年 何伟东.  All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WDHorizontalTableViewCell : UIView

@property(nonatomic,strong) UIView *contentView;
@property(nonatomic,strong) NSString *identifier;
-(instancetype)initWithReuseIdentifier:(NSString*)identifier;

@end
