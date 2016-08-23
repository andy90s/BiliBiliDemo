//
//  MineHeadView.h
//  BiliBiliDemo
//
//  Created by liangbing on 16/8/15.
//  Copyright © 2016年 liangxianhua. All rights reserved.
//

#import <UIKit/UIKit.h>
#define MineHeadViewH 150.f *APPP

@interface MineHeadView : UIView

+ (MineHeadView *)initViewFrame:(CGRect)frame;

/** 头像*/
@property (nonatomic,strong) UIImageView *iconImgView;
/** 昵称*/
@property (nonatomic,strong) UILabel     *nickNameLab;
/** 等级图标*/
@property (nonatomic,strong) UIImageView *vipLevelImgView;
/** 性别图标*/
@property (nonatomic,strong) UIImageView *sexImgView;
/** 等级描述*/
@property (nonatomic,strong) UILabel     *vipLab;
/** 硬币描述*/
@property (nonatomic,strong) UILabel     *coinLab;
/** 设置按钮*/
@property (nonatomic,strong) UIButton    *settingBtn;
/** 向右图标*/
@property (nonatomic,strong) UIImageView *rightArrowImgView;
/** 根据风格改变UI*/
- (void)changeUI;
@end
