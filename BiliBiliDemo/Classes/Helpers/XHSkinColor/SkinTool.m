//
//  SkinTool.m
//  BiliBiliDemo
//
//  Created by liangbing on 16/8/14.
//  Copyright © 2016年 liangxianhua. All rights reserved.
//

#import "SkinTool.h"
#import "UIColor+ColorHelp.h"

@implementation SkinTool

static NSString *_skinColor;
// 这个类第一次使用的时候调用,而且只会调用一次
+ (void)initialize
{
    NSString *value = [[NSUserDefaults standardUserDefaults] objectForKey:skinColorKey];
    if (value == nil) {
        value = @"sakura_pink";
    }
    _skinColor = value;
}

/** 调用此方法就表示模式已改变*/
+ (void)setSkincolor:(SystemStyle)systemMode
{
    //_skinColor = skinColor;
    // 保存用户选中的皮肤颜色
    switch (systemMode) {
            case SakuraPinkSystemStyle:
        {
            _skinColor = @"sakura_pink";
        }
            break;
            case ConcisenessWhiteSystemStyle:
        {
            _skinColor = @"conciseness";
        }
            break;
            case BrickRedSystemStyle:
        {
            _skinColor = @"brick_red";
        }
            break;
        default:
            break;
    }
    [[NSUserDefaults standardUserDefaults] setObject:_skinColor forKey:skinColorKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

// 返回一张图片
+ (UIImage *)skinToolWithImageName:(NSString *)imageName
{
    // 拼接图片路径
    NSString *imagePath = [NSString stringWithFormat:@"skin/%@/%@",_skinColor,imageName];
    return [UIImage imageNamed:imagePath];
}

// 返回textcolor
+ (UIColor *)skinToolTextColor
{
    // 1.获取对应plist文件路径
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"ColorMode" ofType:@"plist"];
    // 2.读取plist文件
    NSDictionary *colorDict = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    NSString *colorStr = colorDict[_skinColor][@"textColor"];
    return [UIColor getColorHex:colorStr];
}
//返回背景颜色
+ (UIColor *)skinToolBackgroudColor
{
    // 1.获取对应plist文件路径
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"ColorMode" ofType:@"plist"];
    // 2.读取plist文件
    NSDictionary *colorDict = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    NSString *colorStr = colorDict[_skinColor][@"backgroundColor"];
    return [UIColor getColorHex:colorStr];
}

+ (UIStatusBarStyle)skinToolStatusBarColor
{
    // 1.获取对应plist文件路径
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"ColorMode" ofType:@"plist"];
    // 2.读取plist文件
    NSDictionary *colorDict = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    NSString *colorStr = colorDict[_skinColor][@"textColor"];
    return [colorStr isEqualToString:@"FFFFFF"] ? UIStatusBarStyleLightContent : UIStatusBarStyleDefault;
}

@end
