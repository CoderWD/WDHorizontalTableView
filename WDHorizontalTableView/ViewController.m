//
//  ViewController.m
//  WDHorizontalTableView
//
//  Created by 何伟东 on 2018/2/23.
//  Copyright © 2018年 何伟东. All rights reserved.
//

#import "ViewController.h"
#import <Masonry/Masonry.h>
#import <WDKit/WDKit.h>
#import "WDHorizontalTableView.h"

@interface ViewController ()<WDHorizontalTableViewDataSource,WDHorizontalTableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    WDHorizontalTableView *horizontalTableView = [[WDHorizontalTableView alloc] init];
    [horizontalTableView.scrollView setPagingEnabled:YES];
    [horizontalTableView setItemWidth:SCREEN_WIDTH];
    [horizontalTableView setDataSource:self];
    [horizontalTableView setDelegate:self];
    [self.view addSubview:horizontalTableView];
    [horizontalTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(0);
    }];
    [horizontalTableView reloadData];
    
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma WDHorizontalTableViewDataSource
-(WDHorizontalTableViewItem *_Nonnull)contentView:(WDHorizontalTableView*_Nullable)horizontalTableView fromIndex:(NSInteger)index{
    WDHorizontalTableViewItem *item = [horizontalTableView dequeueReusableItem];
    if (index%2 == 0) {
        [item setBackgroundColor:[UIColor blueColor]];
    }else{
        [item setBackgroundColor:[UIColor greenColor]];
    }
    return item;
}

-(NSInteger)numberOfItemCount{
    return 10;
}

#pragma WDHorizontalTableViewDelegate
-(void)swithPageIndex:(NSInteger)idex{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
