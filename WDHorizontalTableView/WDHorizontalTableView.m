//
//  WDHorizontalTableView.m
//  WDHorizontalTableView
//
//  Created by 何伟东 Emal:xingfumanong@sina.cn QQ:654500619 on 15/12/18.
//  Copyright © 2015年 何伟东.  All rights reserved.
//

#import "WDHorizontalTableView.h"
#import "UIView+WDHorizontalTableView.h"

@implementation WDHorizontalTableView
@dynamic delegate;

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setColumnWidth:45];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [self reloadData];
}

-(void)setDelegate:(id<WDHorizontalTableViewDelegate>)delegate{
    _delegate = delegate;
}
-(id<WDHorizontalTableViewDelegate>)delegate{
    return _delegate;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self layoutItemView];
}

-(void)layoutItemView{
    //当前显示所在的contentOffset
    CGRect currentRect = CGRectMake(self.contentOffset.x, 0, self.width, self.height);
    CGRect itemRect = CGRectZero;
    for (NSInteger i = 0; i < columnCount; i++) {
        //每个itemView的Rect
        itemRect = CGRectMake(i*_columnWidth, 0, _columnWidth, self.height);
        //如果Rect有交集
        if (CGRectIntersectsRect(currentRect, itemRect)) {
            BOOL isExsit = NO;
            for (WDHorizontalTableViewCell *cell in [self subviews]) {
                if ([cell isKindOfClass:[WDHorizontalTableViewCell class]]) {
                    if (CGRectEqualToRect(cell.frame, itemRect)) {
                        isExsit = YES;
                    }
                }
            }
            //如果可见区域没有对应的itemView
            if (!isExsit) {
                //获取cell
                if ([self.delegate respondsToSelector:@selector(horizontalTableView:cellForColumnIndex:)]) {
                    WDHorizontalTableViewCell *cell = [self.delegate horizontalTableView:self cellForColumnIndex:i];
                    [cell setFrame:itemRect];
                    [self addSubview:cell];
                }
            }
            
        }
    }
    //回收不可见的itemView
    for (WDHorizontalTableViewCell *cell in [self subviews]) {
        if ([cell isKindOfClass:[WDHorizontalTableViewCell class]]) {
            if (!CGRectIntersectsRect(currentRect, cell.frame)) {
                NSMutableArray *reuseCellsViewArray = [[WDHorizontalTableViewCellPool shareInstance].reuseCellsDictionary objectForKey:cell.identifier];
                [reuseCellsViewArray addObject:cell];
                [cell removeFromSuperview];
            }
        }
    }
}

-(void)reloadData{
    if ([self.delegate respondsToSelector:@selector(horizontalTableViewNumberOfColumn:)]) {
        columnCount = [self.delegate horizontalTableViewNumberOfColumn:self];
        [self setContentSize:CGSizeMake(columnCount*_columnWidth < self.width ? self.width+0.5 : columnCount*_columnWidth, self.height)];
        //回收itemView
        for (WDHorizontalTableViewCell *cell in [self subviews]) {
            if ([cell isKindOfClass:[WDHorizontalTableViewCell class]]) {
                NSMutableArray *reuseCellsViewArray = [[WDHorizontalTableViewCellPool shareInstance].reuseCellsDictionary objectForKey:cell.identifier];
                [reuseCellsViewArray addObject:cell];
                [cell removeFromSuperview];
            }
        }
        [self layoutItemView];
    }
}

-(WDHorizontalTableViewCell*)dequeueReusableCellWithIdentifier:(NSString*)identifier{
    NSMutableArray *reuseCellArray = [[WDHorizontalTableViewCellPool shareInstance] cellsWithIdentifier:identifier];
    if ([reuseCellArray count]) {
        WDHorizontalTableViewCell *cell = [reuseCellArray lastObject];
        [reuseCellArray removeLastObject];
        return cell;
    }
    return nil;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
