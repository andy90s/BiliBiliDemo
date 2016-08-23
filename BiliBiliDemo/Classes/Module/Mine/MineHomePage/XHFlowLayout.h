//
//  XHFlowLayout.h
//  BiliBiliDemo
//
//  Created by liangbing on 16/8/17.
//  Copyright © 2016年 liangxianhua. All rights reserved.
//

#import <UIKit/UIKit.h>

FOUNDATION_EXTERN NSString * const XHCollectionElementKindSectionHeader;
FOUNDATION_EXTERN NSString * const XHCollectionElementKindSectionFooter;

@protocol XHCollectionViewFlowLayoutDelegate <UICollectionViewDelegate>

@required

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout heightForItemAtIndexPath:(NSIndexPath *)indexPath;

@optional

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section;

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section;

@end


@interface XHFlowLayout : UICollectionViewFlowLayout

@property (assign, nonatomic, readonly) CGSize itemSize;

/** default  4 */
@property (assign, nonatomic) NSUInteger columnCount;

/** default  0 */
@property (assign, nonatomic) CGFloat minimumLineSpacing;
//
/** default  0 */
@property (assign, nonatomic) CGFloat minimumInteritemSpacing;

/** default  UIEdgeInsetZero */
@property (assign, nonatomic) UIEdgeInsets sectionInsets;

@end
