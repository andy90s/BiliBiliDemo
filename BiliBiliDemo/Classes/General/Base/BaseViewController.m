//
//  BaseViewController.m
//  BiliBiliDemo
//
//  Created by liangbing on 16/8/10.
//  Copyright © 2016年 liangxianhua. All rights reserved.
//

#import "BaseViewController.h"



@interface BaseViewController ()






@end

@implementation BaseViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self loadCurrentSkinView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = WHITE;
}

/** 改变后填入值*/
- (void)loadCurrentSkinView
{
    
}

#pragma mark -
#pragma mark - action
- (void)backClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -
#pragma mark -  lazy
/** 带滚动菜单导航*/
- (UIView *)navigationView
{
    if (!_navigationView) {
        _navigationView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, APPW, 54)];
        [_navigationView addSubview:self.hmSegmentControl];
    }
    return _navigationView;
}
/** 普通导航*/
- (UIView *)normalNavigationView
{
    if (!_normalNavigationView) {
        _normalNavigationView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, APPW, 64)];
        //_normalNavigationView.backgroundColor = SkinBackgroundColor;
        [_normalNavigationView addSubview:self.titleLab];
        [_normalNavigationView addSubview:self.navBackButton];
    }
    return _normalNavigationView;
}

- (UILabel *)titleLab
{
    if (!_titleLab) {
        _titleLab = [[UILabel alloc]initWithFrame:CGRectMake(APPW/2 - 60, 25, APPW - 120, 30)];
        _titleLab.text = self.navTitle;
        //_titleLab.textColor = SkinTextColor;
        _titleLab.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLab;
}

- (UIButton *)navBackButton
{
    if (!_navBackButton) {
        _navBackButton = [[UIButton alloc]initWithFrame:CGRectMake(5, 25, 35, 35)];
        [_navBackButton setImage:[[UIImage imageNamed:@"common_back"] imageWithColor:SkinTextColor] forState:UIControlStateNormal];
        [_navBackButton addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _navBackButton;
}

- (HMSegmentedControl *)hmSegmentControl
{
    if (!_hmSegmentControl) {
        _hmSegmentControl = [[HMSegmentedControl alloc]initWithFrame:CGRectMake(APPW/4,20,APPW/2, 30)];
        NSArray *titles = @[@"直播",@"推荐",@"番剧"];
        _hmSegmentControl.sectionTitles = titles;
        _hmSegmentControl.selectionIndicatorHeight = 2.0f;
        _hmSegmentControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
        _hmSegmentControl.selectionStyle = HMSegmentedControlSelectionStyleTextWidthStripe;
        _hmSegmentControl.selectedSegmentIndex = 0;
        [_hmSegmentControl addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
    }
    return _hmSegmentControl;
}
- (void)segmentedControlChangedValue:(HMSegmentedControl *)segmentControl
{
    
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
}

@end
