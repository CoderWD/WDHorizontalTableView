//
//  WDHorizontalTableViewCellPool.h
//  WDHorizontalTableView
//
//  Created by 何伟东 Emal:xingfumanong@sina.cn QQ:654500619 on 15/12/18.
//  Copyright © 2015年 何伟东.  All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WDHorizontalTableViewCellPool : NSObject
@property(nonatomic,strong) NSMutableDictionary *reuseCellsDictionary;

+(WDHorizontalTableViewCellPool*)shareInstance;
-(NSMutableArray*)cellsWithIdentifier:(NSString*)identifier;
@end
