//
//  UIImage+CompressIMG.h
//  BiliBiliDemo
//
//  Created by liangbing on 16/8/15.
//  Copyright © 2016年 liangxianhua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (CompressIMG)

/**
 *  图片的压缩方法
 *
 *  @param sourceImg   要被压缩的图片
 *  @param defineWidth 要被压缩的尺寸(宽)
 *
 *  @return 被压缩的图片
 */
+ (UIImage *)IMGCompressed:(UIImage *)sourceImg targetWidth:(CGFloat)defineWidth;

@end
