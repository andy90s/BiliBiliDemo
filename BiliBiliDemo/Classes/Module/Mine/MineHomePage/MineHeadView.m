//
//  MineHeadView.m
//  BiliBiliDemo
//
//  Created by liangbing on 16/8/15.
//  Copyright © 2016年 liangxianhua. All rights reserved.
//

#import "MineHeadView.h"

@interface MineHeadView()



@end

@implementation MineHeadView

+ (MineHeadView *)initViewFrame:(CGRect)frame
{
    MineHeadView *headView = [[MineHeadView alloc]initWithFrame:frame];
    [headView prepareViews];
    [headView setMasonry];
    [headView changeUI];
    return headView;
}

- (void)prepareViews
{
    
    [self addSubview:self.iconImgView];
    [self addSubview:self.nickNameLab];
    [self addSubview:self.vipLab];
    [self addSubview:self.sexImgView];
    [self addSubview:self.vipLevelImgView];
    [self addSubview:self.coinLab];
    [self addSubview:self.rightArrowImgView];
    [self addSubview:self.settingBtn];
}

- (void)setMasonry
{
    [self.iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.offset(60 * APPP);
        make.top.equalTo(self.mas_top).offset(50 * APPP);
        make.left.equalTo(self.mas_left).offset(APPP * 30);
    }];
    [self.vipLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.iconImgView.mas_centerY);
        make.height.offset(15*APPP);
        make.left.equalTo(self.iconImgView.mas_right).offset(20);
    }];
    [self.coinLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.offset(15*APPP);
        make.left.equalTo(self.iconImgView.mas_right).offset(20);
        make.top.equalTo(self.vipLab.mas_bottom).offset(5*APPP);
    }];
    [self.nickNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImgView.mas_right).offset(20);
        make.height.offset(20 * APPP);
        make.bottom.equalTo(self.vipLab.mas_top).offset(-5*APPP);
        make.right.equalTo(self.vipLevelImgView.mas_left).offset(-5*APPP);
    }];
    [self.vipLevelImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nickNameLab.mas_right).offset(5*APPP);
        make.width.offset(20 * APPP);
        make.height.offset(10 * APPP);
        make.centerY.equalTo(self.nickNameLab.mas_centerY);
    }];
    [self.nickNameLab setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [self.nickNameLab setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [self.sexImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.offset(15 * APPP);
        make.centerY.equalTo(self.vipLevelImgView.mas_centerY);
        make.left.equalTo(self.vipLevelImgView.mas_right).offset(5 * APPP);
    }];
    [self.settingBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.offset(35 * APPP);
        make.top.equalTo(self.mas_top).offset(35 * APPP);
        make.right.equalTo(self.mas_right).offset(- 30 * APPP);
    }];
    [self.rightArrowImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.offset(25 * APPP);
        make.centerY.equalTo(self.vipLab.mas_centerY);
        make.right.equalTo(self.mas_right).offset(-20 * APPP);
    }];
}

- (void)changeUI
{
    self.backgroundColor = SkinBackgroundColor;
    _nickNameLab.textColor = SkinTextColor;
    _vipLab.textColor = SkinTextColor;
    _coinLab.textColor = SkinTextColor;
}

#pragma mark - 
#pragma mark - lazy

- (UIImageView *)iconImgView
{
    if (!_iconImgView) {
        _iconImgView = [[UIImageView alloc]initWithFrame:CGRectZero];
    }
    return _iconImgView;
}

- (UILabel *)nickNameLab
{
    if (!_nickNameLab) {
        _nickNameLab = [[UILabel alloc]initWithFrame:CGRectZero];
        
    }
    return _nickNameLab;
}

- (UILabel *)vipLab
{
    if (!_vipLab) {
        _vipLab = [[UILabel alloc]initWithFrame:CGRectZero];
        
        _vipLab.font = [UIFont systemFontOfSize:12];
    }
    return _vipLab;
}

- (UIImageView *)sexImgView
{
    if (!_sexImgView) {
        _sexImgView = [[UIImageView alloc]initWithFrame:CGRectZero];
    }
    return _sexImgView;
}

- (UIImageView *)vipLevelImgView
{
    if (!_vipLevelImgView) {
        _vipLevelImgView = [[UIImageView alloc]initWithFrame:CGRectZero];
    }
    return _vipLevelImgView;
}

- (UILabel *)coinLab
{
    if (!_coinLab) {
        _coinLab = [[UILabel alloc]initWithFrame:CGRectZero];
        
        _coinLab.font = [UIFont systemFontOfSize:13];
    }
    return _coinLab;
}

- (UIImageView *)rightArrowImgView
{
    if (!_rightArrowImgView) {
        _rightArrowImgView = [[UIImageView alloc]initWithFrame:CGRectZero];
    }
    return _rightArrowImgView;
}

- (UIButton *)settingBtn
{
    if (!_settingBtn) {
        _settingBtn = [[UIButton alloc]initWithFrame:CGRectZero];
    }
    return _settingBtn;
}
@end
