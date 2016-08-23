//
//  MineMenuView.m
//  BiliBiliDemo
//
//  Created by liangbing on 16/8/17.
//  Copyright © 2016年 liangxianhua. All rights reserved.
//

#import "MineMenuView.h"
#import "MineMenuCell.h"

@implementation MineMenuView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        self.showsVerticalScrollIndicator = NO;
        self.delegate = self;
        self.dataSource = self;
        self.alwaysBounceVertical = YES;
        self.backgroundColor = NavTintColor;
        [self registerClass:[MineMenuCell class] forCellWithReuseIdentifier:@"MineMenuCell"];
        [self registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:XHCollectionElementKindSectionHeader withReuseIdentifier:@"UICollectionReusableView"];
        [self registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:XHCollectionElementKindSectionFooter withReuseIdentifier:@"UICollectionReusableView1"];
    }
    return self;
}

#pragma mark -
#pragma mark - XHCollectionViewFlowLayoutDelegate
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout heightForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return APPW/4;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(APPW, 30*APPP);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake(APPW, 10*APPP);
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:XHCollectionElementKindSectionHeader]) {
        UICollectionReusableView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:XHCollectionElementKindSectionHeader withReuseIdentifier:@"UICollectionReusableView" forIndexPath:indexPath];
        headView.backgroundColor = WHITE;
        UILabel *lab = [[UILabel alloc]initWithFrame:CGRectZero];
        lab.font = [UIFont systemFontOfSize:14];
        [headView addSubview:lab];
        [lab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(headView.mas_left).offset(20);
            make.centerY.equalTo(headView.mas_centerY);
        }];
        if (indexPath.section == 0) {
            headView.layer.cornerRadius = 5.f;
            lab.text = @"个人中心";
            return headView;
        }
        if (indexPath.section == 1) {
            lab.text = @"我的消息";
            return headView;
        }
    }
    if ([kind isEqualToString:XHCollectionElementKindSectionFooter]) {
        UICollectionReusableView *footView = [collectionView dequeueReusableSupplementaryViewOfKind:XHCollectionElementKindSectionFooter withReuseIdentifier:@"UICollectionReusableView1" forIndexPath:indexPath];
        footView.backgroundColor = [UIColor getColorHex:@"F4F4F4"];
        return footView;
    }
    return nil;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 8;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MineMenuCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MineMenuCell" forIndexPath:indexPath];
    
    if (indexPath.section == 0 && indexPath.item < 7) {
        cell.menuLab.text = [self firstTitles][indexPath.item];
        cell.iconImgView.image = [UIImage imageNamed:[self firstIcons][indexPath.item]];
        return cell;
    }
    else if (indexPath.section == 1 && indexPath.item < 5) {
        cell.menuLab.text = [self secTitles][indexPath.item];
        cell.iconImgView.image = [UIImage imageNamed:[self secIcons][indexPath.item]];
        return cell;
    }
    else {
        cell.menuLab.text = nil;
        cell.iconImgView.image = nil;
        return cell;
    }
    
}

//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
//{
//    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
//        UICollectionReusableView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"UICollectionReusableView" forIndexPath:indexPath];
//        headView.backgroundColor = WHITE;
//        UILabel *lab = [[UILabel alloc]initWithFrame:CGRectZero];
//        lab.font = [UIFont systemFontOfSize:14];
//        [headView addSubview:lab];
//        [lab mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(headView.mas_left).offset(20);
//            make.centerY.equalTo(headView.mas_centerY);
//        }];
//        if (indexPath.section == 0) {
//            headView.layer.cornerRadius = 5.f;
//            lab.text = @"个人中心";
//            return headView;
//        }
//        if (indexPath.section == 1) {
//            lab.text = @"我的消息";
//            return headView;
//        }
//    }
//    if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
//        UICollectionReusableView *footView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"UICollectionReusableView1" forIndexPath:indexPath];
//        footView.backgroundColor = [UIColor getColorHex:@"F4F4F4"];
//        return footView;
//    }
//    
//    
//    return nil;
//}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (_didSelect) {
        _didSelect(indexPath);
    }
}


#pragma mark -
#pragma mark - lazy

- (NSArray *)firstIcons
{
    return @[@"mine_download",@"mine_history",@"community_collection_ic",@"mine_follow",@"mine_bill",@"mine_game",@"弹幕"];
}
- (NSArray *)secIcons
{
    return @[@"message_reply",@"message_at",@"misc_like_s_ico",@"mine_message",@"message_system"];
}
- (NSArray *)firstTitles
{
    return @[@"离线缓存",@"历史记录",@"我的收藏",@"我的关注",@"我的钱包",@"游戏中心",@"主题选择"];
}

- (NSArray *)secTitles
{
    return @[@"回复我的",@"@我",@"收到的赞",@"私信",@"系统通知"];
}
@end













