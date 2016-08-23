//
//  MineHomePageViewModel.m
//  BiliBiliDemo
//
//  Created by liangbing on 16/8/16.
//  Copyright © 2016年 liangxianhua. All rights reserved.
//

#import "MineHomePageViewModel.h"

@implementation MineHomePageViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self loadData];
    }
    return self;
}

- (void)loadData
{
    _requestCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
        RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            [XHHttp requestWithType:HttpRequestTypeGet withUrlString:BL_MYINFO_URL withParaments:nil withSuccessBlock:^(NSDictionary *object) {
                self.account = [[AccountModel alloc]initWithDictionary:object error:nil];
                if (self.account) {
                    switch (self.account.sex) {
                        case 0:
                        {
                            self.account.sexFlag = @"space_sex_female";
                        }
                            break;
                        case 1:
                        {
                            self.account.sexFlag = @"space_sex_male";
                        }
                            break;
                        case 2:
                        {
                            self.account.sexFlag = @"space_sex_sox";
                        }
                            break;
                            
                        default:
                            break;
                    }
                }
                
                
                [subscriber sendNext:self.account];
                [subscriber sendCompleted];
            } withFailureBlock:^(NSError *error) {
                [subscriber sendError:error];
            } progress:^(float progress) {
                
            }];
            return nil;
        }];
        return signal;
    }];
}
@end
