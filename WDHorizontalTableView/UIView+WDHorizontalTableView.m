//
//  UIView+WDHorizontalTableView.m
//  WDHorizontalTableView
//
//  Created by 何伟东 Emal:xingfumanong@sina.cn QQ:654500619 on 15/12/18.
//  Copyright © 2015年 何伟东.  All rights reserved.
//

#import "UIView+WDHorizontalTableView.h"

@implementation UIView (WDHorizontalTableView)


- (CGSize) size{
    return self.frame.size;
}
- (void) setSize: (CGSize) aSize
{
    CGRect newframe = self.frame;
    newframe.size = aSize;
    self.frame = newframe;
}

- (CGPoint) origin{
    return self.frame.origin;
}
- (void) setOrigin: (CGPoint) aPoint{
    CGRect newframe = self.frame;
    newframe.origin = aPoint;
    self.frame = newframe;
}

- (CGFloat) height{
    return self.frame.size.height;
}
- (void) setHeight: (CGFloat) newheight{
    CGRect newframe = self.frame;
    newframe.size.height = newheight;
    self.frame = newframe;
}

- (CGFloat) width{
    return self.frame.size.width;
}
- (void) setWidth: (CGFloat) newwidth{
    CGRect newframe = self.frame;
    newframe.size.width = newwidth;
    self.frame = newframe;
}

- (CGFloat) right{
    return self.frame.origin.x + self.frame.size.width;
}
- (void) setRight: (CGFloat) newright{
    CGRect newframe = self.frame;
    newframe.origin.x = (newright - newframe.size.width);
    self.frame = newframe;
}

- (CGFloat) top{
    return self.frame.origin.y;
}
- (void) setTop: (CGFloat) newtop{
    CGRect newframe = self.frame;
    newframe.origin.y = newtop;
    self.frame = newframe;
}

- (CGFloat) bottom{
    return self.frame.origin.y+self.frame.size.height;
}
- (void) setBottom: (CGFloat) newbottom{
    CGRect newframe = self.frame;
    newframe.origin.y = newbottom-newframe.size.height;
    self.frame = newframe;
}

- (CGFloat) left{
    return self.frame.origin.x;
}

- (void) setLeft: (CGFloat) newleft{
    CGRect newframe = self.frame;
    newframe.origin.x = newleft;
    self.frame = newframe;
}

- (void) moveToPoint:(CGPoint) point animation:(BOOL)animation{
    if (animation) {
        [UIView animateWithDuration:0.25 animations:^{
            self.left = point.x;
            self.top = point.y;
        }];
    }else{
        self.left = point.x;
        self.top = point.y;
    }
}

- (void) moveToDistance:(CGFloat) lift right:(CGFloat)right animation:(BOOL)animation{
    if (animation) {
        [UIView animateWithDuration:0.25 animations:^{
            if (animation) {
                [UIView animateWithDuration:0.25 animations:^{
                    self.left += lift;
                    self.top += right;
                }];
            }else{
                self.left += lift;
                self.top += right;
            }
        }];
    }
}

-(UIViewController *)viewController{
    UIResponder *next = self.nextResponder;
    while (next != nil) {
        if ([next isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)next;
        }
        next = next.nextResponder;
    }
    return nil;
}

@end
