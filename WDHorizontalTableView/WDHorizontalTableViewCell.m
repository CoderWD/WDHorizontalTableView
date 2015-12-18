//
//  WDHorizontalTableCell.m
//  WDHorizontalTableView
//
//  Created by 何伟东 Emal:xingfumanong@sina.cn QQ:654500619 on 15/12/18.
//  Copyright © 2015年 何伟东.  All rights reserved.
//

#import "WDHorizontalTableViewCell.h"

@implementation WDHorizontalTableViewCell

-(instancetype)initWithReuseIdentifier:(NSString*)identifier{
    self = [super init];
    if (self) {
        _contentView = [[UIView alloc] init];
        [self addSubview:_contentView];
        _identifier = identifier;
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [_contentView setFrame:self.bounds];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
