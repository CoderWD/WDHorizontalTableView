//
//  UIView+WDHorizontalTableView.h
//  WDHorizontalTableView
//
//  Created by 何伟东 Emal:xingfumanong@sina.cn QQ:654500619 on 15/12/18.
//  Copyright © 2015年 何伟东.  All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (WDHorizontalTableView)
@property CGPoint origin;
@property CGSize size;

@property CGFloat width;
@property CGFloat height;
@property CGFloat left;
@property CGFloat right;
@property CGFloat top;
@property CGFloat bottom;

- (void) moveToPoint:(CGPoint) point animation:(BOOL)animation;
- (void) moveToDistance:(CGFloat) lift right:(CGFloat)right animation:(BOOL)animation;
-(UIViewController *)viewController;

@end
