//
//  MineMenuCell.m
//  BiliBiliDemo
//
//  Created by liangbing on 16/8/16.
//  Copyright © 2016年 liangxianhua. All rights reserved.
//

#import "MineMenuCell.h"

@interface MineMenuCell()

@property (nonatomic,strong) UIView *containerView;

@end

@implementation MineMenuCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initViews];
        [self setMasonry];
    }
    return self;
}
- (void)initViews
{
    self.contentView.backgroundColor = [UIColor getColorHex:@"F4F4F4"];
    [self.contentView addSubview:self.containerView];
    [self.containerView addSubview:self.iconImgView];
    [self.containerView addSubview:self.menuLab];
}

- (void)setMasonry
{
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView).insets(UIEdgeInsetsMake(1, 0, 0, 1));
    }];
    [self.iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.offset(25 * APPP);
        make.centerX.equalTo(self.contentView.mas_centerX);
        make.top.equalTo(self.contentView.mas_top).offset(20);
    }];
    [self.menuLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.offset(15 * APPP);
        make.centerX.equalTo(self.iconImgView.mas_centerX);
        make.top.equalTo(self.iconImgView.mas_bottom).offset(5*APPP);
    }];
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

- (UILabel *)menuLab
{
    if (!_menuLab) {
        _menuLab = [[UILabel alloc]initWithFrame:CGRectZero];
        _menuLab.font = [UIFont systemFontOfSize:13];
    }
    return _menuLab;
}

- (UIView *)containerView
{
    if (!_containerView) {
        _containerView = [UIView new];
        _containerView.backgroundColor = WHITE;
    }
    return _containerView;
}

@end
