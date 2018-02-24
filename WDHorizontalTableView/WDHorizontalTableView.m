//
//  WDHorizontalTableView.m
//  ZYGameCenter
//
//  Created by 何伟东 on 2017/12/28.
//  Copyright © 2017年 何伟东. All rights reserved.
//

#import "WDHorizontalTableView.h"
#import <Masonry/Masonry.h>
#import <WDKit/WDKit.h>

@interface WDHorizontalTableView ()<UIScrollViewDelegate>
@property(nonatomic,strong) NSMutableArray *itemRectArray;
@property(nonatomic,strong) NSMutableArray<WDHorizontalTableViewItem*> *reuseItemViews;
@end

@implementation WDHorizontalTableView

//@synthesize dataSource,delegate;
//@dynamic dataSource,delegate;

-(instancetype)init{
    self = [super init];
    if (self) {
        _scrollView = [[UIScrollView alloc] init];
        [self addSubview:self.scrollView];
        [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.mas_equalTo(0);
        }];
        //[_scrollView setScrollEnabled:NO];
        //[_scrollView setPagingEnabled:YES];
        [_scrollView setDelegate:self];
        
        _contentView = [[UIView alloc] init];
        [_scrollView addSubview:_contentView];
        [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.mas_equalTo(0);
            make.centerY.mas_equalTo(0);
            make.height.equalTo(_scrollView);
            make.width.mas_equalTo(0);
        }];
    }
    return self;
}

/**
 刷新视图
 */
-(void)reloadData{
    if ([_dataSource respondsToSelector:@selector(numberOfItemCount)]) {
        NSInteger count = [_dataSource numberOfItemCount];
        [_contentView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(_itemWidth*count);
        }];
        
        if (!_itemRectArray) {
            _itemRectArray = [[NSMutableArray alloc] init];
        }
        if ([_itemRectArray count]) {
            [_itemRectArray removeAllObjects];
        }
        for (int i = 0; i < count ; i++) {
            CGRect rect = CGRectMake(i*_itemWidth, 0, _itemWidth, _scrollView.height);
            [_itemRectArray addObject:NSStringFromCGRect(rect)];
        }
        //显示当前区域的itemView
        [self addIntersItemView:_scrollView];
    }
}


-(WDHorizontalTableViewItem*)dequeueReusableItem{
    if ([_reuseItemViews count]) {
        WDHorizontalTableViewItem *itemView = _reuseItemViews.firstObject;
        [_reuseItemViews removeObject:itemView];
        return itemView;
    }else{
        WDHorizontalTableViewItem *itemView = [[WDHorizontalTableViewItem alloc] init];
        return itemView;
    }
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //取出超出的
    __weak typeof(self)weakSelf = self;
    
    CGRect rect = CGRectMake(scrollView.contentOffset.x, 0, _itemWidth, _scrollView.height);
    [scrollView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[WDHorizontalTableViewItem class]]) {
            if (!CGRectIntersectsRect(rect, obj.frame)) {
                [obj removeFromSuperview];
                [weakSelf.reuseItemViews addObject:obj];
            }
        }
    }];
    //放入进来的
    [self addIntersItemView:scrollView];
}

/**
 加载要进来的

 @param scrollView <#scrollView description#>
 */
-(void)addIntersItemView:(UIScrollView *)scrollView{
    if ([_dataSource respondsToSelector:@selector(contentView:fromIndex:)]) {
        CGFloat x = scrollView.contentOffset.x;
        CGRect rect = CGRectMake(x, 0, _itemWidth, scrollView.height);
        NSMutableArray *inters = [NSMutableArray array];
        [_itemRectArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            CGRect itemRect = CGRectFromString(obj);
            if(CGRectIntersectsRect(rect, itemRect)){
                [inters addObject:obj];
            }
        }];
        NSInteger count = 0;
        if ([_dataSource respondsToSelector:@selector(numberOfItemCount)]) {
            count = [_dataSource numberOfItemCount];
        }
        __weak typeof(self)weakSelf = self;
        [inters enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            CGRect itemRect = CGRectFromString(obj);
            NSInteger idex = itemRect.origin.x/weakSelf.itemWidth;
            WDHorizontalTableViewItem *itemView = [weakSelf.dataSource contentView:weakSelf fromIndex:idex];
            [weakSelf.contentView addSubview:itemView];
            [itemView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(itemRect.origin.x);
                make.width.mas_equalTo(weakSelf.itemWidth);
                make.top.bottom.mas_equalTo(0);
            }];
        }];
    }
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger page = scrollView.contentOffset.x/_itemWidth;
    if ([_delegate respondsToSelector:@selector(swithPageIndex:)]) {
        [_delegate swithPageIndex:page];
    }
}

-(void)dealloc{
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
