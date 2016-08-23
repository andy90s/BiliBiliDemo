//
//  MyTabbarController.m
//  BiliBiliDemo
//
//  Created by liangbing on 16/8/11.
//  Copyright © 2016年 liangxianhua. All rights reserved.
//

#import "MyTabbarController.h"

#import "HomeController.h"
#import "FindController.h"
#import "FocusViewController.h"
#import "MineController.h"
#import "PartitionController.h"

@interface MyTabbarController ()

@property (nonatomic,copy) NSMutableArray *tabViewControllers;

@end

@implementation MyTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initViewControllers];
}

-(void)initViewControllers
{
    [self addViewControllersWithController:[HomeController new] title:@"首页" nomalIamge:[UIImage imageNamed:@"home_home_tab"] selectedImage:[UIImage imageNamed:@"home_home_tab_s"]];
    [self addViewControllersWithController:[PartitionController new] title:@"分区" nomalIamge:[UIImage imageNamed:@"home_category_tab"] selectedImage:[UIImage imageNamed:@"home_category_tab_s"]];
    [self addViewControllersWithController:[FocusViewController new] title:@"关注" nomalIamge:[UIImage imageNamed:@"home_attention_tab"] selectedImage:[UIImage imageNamed:@"home_attention_tab_s"]];
    [self addViewControllersWithController:[FindController new] title:@"发现" nomalIamge:[UIImage imageNamed:@"home_discovery_tab"] selectedImage:[UIImage imageNamed:@"home_discovery_tab_s"]];
    [self addViewControllersWithController:[MineController new] title:@"我的" nomalIamge:[UIImage imageNamed:@"home_mine_tab"] selectedImage:[UIImage imageNamed:@"home_mine_tab_s"]];
    self.viewControllers = self.tabViewControllers;
}


-(void)addViewControllersWithController:(UIViewController *)controller title:(NSString *)title nomalIamge:(UIImage *)nomalImage selectedImage:(UIImage *)selectedImage
{
    XHNavgationController * nav = [[XHNavgationController alloc] initWithRootViewController:controller];
    nav.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    nav.tabBarItem.image = [nomalImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav.tabBarItem.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self.tabViewControllers addObject:nav];
}


#pragma mark - 
#pragma mark - lazy

-(NSMutableArray *)tabViewControllers
{
    if (!_tabViewControllers) {
        _tabViewControllers = [NSMutableArray new];
    }
    return _tabViewControllers;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
