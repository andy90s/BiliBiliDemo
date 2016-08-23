//
//  NormalBaseController.m
//  BiliBiliDemo
//
//  Created by liangbing on 16/8/18.
//  Copyright © 2016年 liangxianhua. All rights reserved.
//

#import "NormalBaseController.h"

@interface NormalBaseController ()

@end

@implementation NormalBaseController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.normalNavigationView];
}

- (void)loadCurrentSkinView
{
    [super loadCurrentSkinView];
    self.normalNavigationView.backgroundColor = SkinBackgroundColor;
    [self.navBackButton setImage:[[UIImage imageNamed:@"common_back"] imageWithColor:SkinTextColor] forState:UIControlStateNormal];
    self.titleLab.textColor = SkinTextColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
