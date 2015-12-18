//
//  WDHorizontalTableViewCellPool.m
//  WDHorizontalTableView
//
//  Created by 何伟东 Emal:xingfumanong@sina.cn QQ:654500619 on 15/12/18.
//  Copyright © 2015年 何伟东.  All rights reserved.
//

#import "WDHorizontalTableViewCellPool.h"

static WDHorizontalTableViewCellPool *horizontalTableViewCellPool = nil;
@implementation WDHorizontalTableViewCellPool

+(WDHorizontalTableViewCellPool*)shareInstance{
    // 一次性执行：
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        horizontalTableViewCellPool = [[WDHorizontalTableViewCellPool alloc] init];
    });
    return horizontalTableViewCellPool;
}
-(instancetype)init{
    self = [super init];
    if (self) {
        _reuseCellsDictionary = [[NSMutableDictionary alloc] init];
    }
    return self;
}

-(NSMutableArray*)cellsWithIdentifier:(NSString*)identifier{
    NSMutableArray *cells= [_reuseCellsDictionary objectForKey:identifier];
    if (cells == nil) {
        cells = [NSMutableArray array];
        [_reuseCellsDictionary setObject:[NSMutableArray array] forKey:identifier];
    }
    return cells;
}

@end
