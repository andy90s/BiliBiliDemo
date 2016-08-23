//
//  ThemeCell.h
//  BiliBiliDemo
//
//  Created by liangbing on 16/8/18.
//  Copyright © 2016年 liangxianhua. All rights reserved.
//

#import <UIKit/UIKit.h>
#define ThemeCellH 50 * APPP

@interface ThemeCell : UITableViewCell

/** 对号图标*/
@property (nonatomic,strong) UIImageView *checkMarkImgView;
/** 描述*/
@property (nonatomic,strong) UILabel *descriptionLab;
/** 状态*/
@property (nonatomic,strong) UILabel *statusLab;

@end
