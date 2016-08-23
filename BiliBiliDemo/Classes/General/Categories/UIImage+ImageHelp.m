//
//  UIImage+ImageHelp.m
//  BiliBiliDemo
//
//  Created by liangbing on 16/8/12.
//  Copyright © 2016年 liangxianhua. All rights reserved.
//

#import "UIImage+ImageHelp.h"

@implementation UIImage (ImageHelp)

- (UIImage *)imageWithColor:(UIColor *)color

{
    //获取上下文 中间参数表示不透明度
    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    //平移
    CGContextTranslateCTM(context, 0, self.size.height);
    //缩放 (水平方向 垂直方向) 在缩放后的坐标系统上绘制图形时，所有点的 X 坐标都相当于乘以 sx 因子，所有点的 Y 坐标都相当于乘以 sy 因子
    CGContextScaleCTM(context, 1.0, -1.0);
    //混合颜色http://sipdar.github.io/2014/03/18/Blend_Models/
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    
    CGContextClipToMask(context, rect, self.CGImage);
    
    [color setFill];
    
    CGContextFillRect(context, rect);
    
    UIImage*newImage = UIGraphicsGetImageFromCurrentImageContext();
    //关闭上下文
    UIGraphicsEndImageContext();
    
    return newImage;
    
}

@end
