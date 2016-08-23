//
//  MineController.m
//  BiliBiliDemo
//
//  Created by liangbing on 16/8/11.
//  Copyright © 2016年 liangxianhua. All rights reserved.
//

#import "MineController.h"
#import "MineHeadView.h"
#import "MineHomePageViewModel.h"
#import "MineMenuView.h"
#import "XHFlowLayout.h"
#import "ThemeController.h"
@interface MineController ()

/** 我的界面顶部视图*/
@property (nonatomic,strong) MineHeadView *headView;
/** 用户信息viewModel*/
@property (nonatomic,strong) MineHomePageViewModel *mineHomeViewModel;
/** 菜单*/
@property (nonatomic,strong) MineMenuView *menuView;


@end

@implementation MineController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initViews];
    [self downloadData];
}

- (void)initViews
{
    self.view.backgroundColor = WHITE;
    [self.view addSubview:self.headView];
    [self.view addSubview:self.menuView];
    WEAK_SELF(weakSelf);
    self.menuView.didSelect = ^(NSIndexPath * indexPath){
        if (indexPath.section == 0) {
            switch (indexPath.row) {
                case 6:
                {
                    [weakSelf.navigationController pushViewController:[ThemeController new] animated:YES];
                }
                    break;
                    
                default:
                    break;
            }
        }
    };
}

- (void)changeAccount:(AccountModel *)model
{
    [self.headView.iconImgView sd_setImageWithURL:[NSURL URLWithString:model.face]];
    self.headView.nickNameLab.text = model.uname;
    self.headView.vipLevelImgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"misc_level_whiteLv%ld",model.level_info.current_level]];
    self.headView.sexImgView.image = [UIImage imageNamed:model.sexFlag];
    self.headView.vipLab.text = model.rank == 10000 ? @"正式会员" : @"注册会员";
    self.headView.coinLab.text = [NSString stringWithFormat:@"硬币:%ld",model.coins];
}

- (void)downloadData
{
    /** 执行请求*/
    RACSignal *requestDataSignal = [self.mineHomeViewModel.requestCommand execute:nil];
    /** 获取请求的数据*/
    [requestDataSignal subscribeNext:^(AccountModel * x) {
        AccountModel *model = x;
        [self changeAccount:model];
    }];
}


#pragma mark -
#pragma mark - lazy
- (MineHeadView *)headView
{
    if (!_headView) {
        _headView = [MineHeadView initViewFrame:CGRectMake(0, 0, APPW, MineHeadViewH)];
    }
    return _headView;
}

- (MineHomePageViewModel *)mineHomeViewModel
{
    if (!_mineHomeViewModel) {
        _mineHomeViewModel = [[MineHomePageViewModel alloc]init];
    }
    return _mineHomeViewModel;
}

- (MineMenuView *)menuView
{
    if (!_menuView) {
        /** 此处如果用系统flowlayout会出现中间有条缝隙的bug,故重写flowlayout*/
        XHFlowLayout *flowLayout = [XHFlowLayout new];
        flowLayout.sectionInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        flowLayout.columnCount = 4;
        _menuView = [[MineMenuView alloc]initWithFrame:CGRectMake(0,MineHeadViewH, APPW, APPH - MineHeadViewH - 49) collectionViewLayout:flowLayout];
    }
    return _menuView;
}

#pragma mark -
#pragma mark - skin style

- (void)loadCurrentSkinView
{
    [self.headView changeUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end

