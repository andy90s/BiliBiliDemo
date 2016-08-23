//
//  MineHomePageViewModel.h
//  BiliBiliDemo
//
//  Created by liangbing on 16/8/16.
//  Copyright © 2016年 liangxianhua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AccountModel.h"

@interface MineHomePageViewModel : NSObject

/** 用户信息*/
@property (nonatomic,strong) AccountModel *account;
/** 请求命令*/
@property (nonatomic,strong,readonly) RACCommand *requestCommand;
///** 请求数据*/
//- (void)loadData;


@end
