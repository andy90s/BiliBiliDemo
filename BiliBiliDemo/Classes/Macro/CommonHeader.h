//
//  CommonHeader.h
//  BiliBiliDemo
//
//  Created by liangbing on 16/8/12.
//  Copyright © 2016年 liangxianhua. All rights reserved.
//

#ifndef CommonHeader_h
#define CommonHeader_h

/** 系统风格背景颜色*/
#define SkinBackgroundColor [SkinTool skinToolBackgroudColor]
/** 系统风格文字颜色*/
#define SkinTextColor [SkinTool skinToolTextColor]



#define WHITE [UIColor whiteColor]
#define BLUE [UIColor blueColor]
#define kBgColor [UIColor colorWithRed:0.94 green:0.94 blue:0.94 alpha:1]
#define kStyleColor [UIColor colorWithRed:0.86 green:0.40 blue:0.54 alpha:1]
/** 固定樱花粉颜色*/
#define NavTintColor [UIColor colorWithRed:0.97 green:0.45 blue:0.60 alpha:1.00]
/** 屏幕尺寸和比例*/
#define APPW [UIScreen mainScreen].bounds.size.width
#define APPH [UIScreen mainScreen].bounds.size.height
#define APPP (APPW/320.f)
/** 判断空字符串*/
#define NULLString(string) ((![string isKindOfClass:[NSString class]])||[string isEqualToString:@""] || (string == nil) || [string isEqualToString:@""] || [string isKindOfClass:[NSNull class]]||[[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0)
/** 打印*/
#ifdef DEBUG
#define XLog(fmt, ...) NSLog((@"\n[文件名:%@]\n" "[函数名:%s]\n" "[代码行:%d] \n" fmt), [[[NSString stringWithUTF8String:__FILE__] componentsSeparatedByString:@"/"] lastObject], __FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
# define XLog(...) {}
#endif
/** 快捷系统单例*/
#define XHNotificationCenter [NSNotificationCenter defaultCenter]
#define XHUserDefaults [NSUserDefaults standardUserDefaults]
#define XHApplication [UIApplication sharedApplication]
#define XHFileManager [NSFileManager defaultManager]
#define XHDevice [UIDevice currentDevice]
/** weakSelf*/
#define WEAK_SELF(bself) __weak typeof(self)bself = self


#endif /* CommonHeader_h */
