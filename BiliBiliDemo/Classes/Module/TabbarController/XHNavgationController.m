//
//  XHNavgationController.m
//  BiliBiliDemo
//
//  Created by liangbing on 16/8/14.
//  Copyright © 2016年 liangxianhua. All rights reserved.
//

#import "XHNavgationController.h"

@interface XHNavgationController ()

@end


@implementation XHNavgationController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return [SkinTool skinToolStatusBarColor];
}

- (void)setNeedsStatusBarAppearanceUpdate
{
    [super setNeedsStatusBarAppearanceUpdate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end


