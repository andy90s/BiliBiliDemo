//
//  BaseViewController.h
//  BiliBiliDemo
//
//  Created by liangbing on 16/8/10.
//  Copyright © 2016年 liangxianhua. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HMSegmentedControl.h"

@interface BaseViewController : UIViewController

/** 带滚动菜单导航*/
@property (nonatomic,strong) UIView *navigationView;
/** 分段控制器*/
@property (nonatomic,strong) HMSegmentedControl *hmSegmentControl;
/** 页码标记横向滚动*/
@property (nonatomic,assign) NSInteger pageIndex;
/** 普通导航*/
@property (nonatomic,strong) UIView *normalNavigationView;
/** 普通导航标题*/
@property (nonatomic,copy) NSString *navTitle;
/** 普通导航返回键*/
@property (nonatomic,strong) UIButton *navBackButton;
/** 标题*/
@property (nonatomic,strong) UILabel *titleLab;
/** 控件设置接口 用来根据模式改变UI*/
- (void)loadCurrentSkinView;

@end
