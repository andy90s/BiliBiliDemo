//
//  AccountModel.h
//  BiliBiliDemo
//
//  Created by liangbing on 16/8/16.
//  Copyright © 2016年 liangxianhua. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AccountPendant,AccountNameplate,AccountLevel_Info;

@interface AccountModel : JSONModel

@property (nonatomic, assign) NSInteger rank;

@property (nonatomic, strong) AccountPendant *pendant;

@property (nonatomic, copy  ) NSString  *birthday;

@property (nonatomic, assign) NSInteger mid;

@property (nonatomic, copy  ) NSString  *telephone;

@property (nonatomic, copy  ) NSString  *uname;

@property (nonatomic, assign) NSInteger sex;
/** 自己添加字段判断图片名字*/
@property (nonatomic, copy) NSString <Optional>*sexFlag;

@property (nonatomic, assign) NSInteger scores;

@property (nonatomic, assign) NSInteger mobile_verified;

@property (nonatomic, strong) AccountNameplate  *nameplate;

@property (nonatomic, copy  ) NSString  *sign;

@property (nonatomic, assign) NSInteger security_level;

@property (nonatomic, strong) AccountLevel_Info *level_info;

@property (nonatomic, copy  ) NSString  *s_face;

@property (nonatomic, copy  ) NSString  *jointime;

@property (nonatomic, assign) NSInteger spacesta;

@property (nonatomic, copy  ) NSString  *face;

@property (nonatomic, assign) NSInteger coins;

@property (nonatomic, assign) NSInteger maxstow;

@property (nonatomic, assign) NSInteger identification;

@property (nonatomic, strong) NSArray<NSNumber*> *attentions;

@end

@interface AccountPendant : JSONModel

@property (nonatomic, assign) NSInteger expire;

@property (nonatomic, copy  ) NSString  *name;

@property (nonatomic, assign) NSInteger pid;

@property (nonatomic, copy  ) NSString  *image;

@end

@interface AccountNameplate : JSONModel

@property (nonatomic, copy  ) NSString  <Optional>*level;

@property (nonatomic, copy  ) NSString  <Optional>*condition;

@property (nonatomic, assign) NSInteger nid;

@property (nonatomic, copy  ) NSString  *name;

@property (nonatomic, copy  ) NSString  *image;

@property (nonatomic, copy  ) NSString  *image_small;

@end

@interface AccountLevel_Info : JSONModel

@property (nonatomic, assign) NSInteger current_level;

@property (nonatomic, assign) NSInteger current_min;

@property (nonatomic, assign) NSInteger current_exp;

@property (nonatomic, assign) NSInteger next_exp;

@end

