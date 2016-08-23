//
//  MineMenuView.h
//  BiliBiliDemo
//
//  Created by liangbing on 16/8/17.
//  Copyright © 2016年 liangxianhua. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XHFlowLayout.h"

@class MineMenuView;

typedef void(^didSelected)(NSIndexPath *indexPath);

@interface MineMenuView : UICollectionView<UICollectionViewDelegate,UICollectionViewDataSource,XHCollectionViewFlowLayoutDelegate>

/** 菜单选中索引*/
@property (nonatomic,copy) didSelected didSelect;

@end
