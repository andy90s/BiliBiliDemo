//
//  SkinTool.h
//  BiliBiliDemo
//
//  Created by liangbing on 16/8/14.
//  Copyright © 2016年 liangxianhua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#define skinColorKey @"skinColor"

//参考:http://www.jianshu.com/p/10fc5823f5f1

typedef  NS_OPTIONS(NSUInteger, SystemStyle){
    /** 樱花粉*/
    SakuraPinkSystemStyle       = 0,
    /** 简洁白*/
    ConcisenessWhiteSystemStyle = 1,
    /** 砖红*/
    BrickRedSystemStyle         = 2
};

@interface SkinTool : NSObject
//设置style
+ (void)setSkincolor:(SystemStyle)systemMode;
//设置图片
+ (UIImage *)skinToolWithImageName:(NSString *)imageName;
// 返回textcolor
+ (UIColor *)skinToolTextColor;
//返回背景颜色
+ (UIColor *)skinToolBackgroudColor;
//返回状态条颜色风格
+ (UIStatusBarStyle)skinToolStatusBarColor;
@end
