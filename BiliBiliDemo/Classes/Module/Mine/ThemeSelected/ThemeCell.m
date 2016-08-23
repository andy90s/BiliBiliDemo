//
//  ThemeCell.m
//  BiliBiliDemo
//
//  Created by liangbing on 16/8/18.
//  Copyright © 2016年 liangxianhua. All rights reserved.
//

#import "ThemeCell.h"

@interface ThemeCell()


@end


@implementation ThemeCell

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self initViews];
        [self setMasonry];
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initViews];
        [self setMasonry];
    }
    return self;
}

- (void)initViews
{
    [self.contentView addSubview:self.checkMarkImgView];
    [self.contentView addSubview:self.descriptionLab];
    [self.contentView addSubview:self.statusLab];
    
}

#pragma mark -
#pragma mark - masonry

- (void)setMasonry
{
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges = UIEdgeInsetsMake(<#CGFloat top#>, <#CGFloat left#>, <#CGFloat bottom#>, <#CGFloat right#>)
    }];
    
    [self.checkMarkImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.left.equalTo(self.contentView.mas_left).offset(15*APPP);
        make.width.height.offset(20 * APPP);
    }];
    [self.descriptionLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.height.offset(20*APPP);
        make.left.equalTo(self.checkMarkImgView.mas_right).offset(20*APPP);
    }];
    [self.statusLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.height.offset(25 * APPP);
        make.width.offset(45 * APPP);
    }];
}

#pragma mark -
#pragma mark - lazy

- (UIImageView *)checkMarkImgView
{
    if (!_checkMarkImgView) {
        _checkMarkImgView = [[UIImageView alloc]initWithFrame:CGRectZero];
        _checkMarkImgView.image = [UIImage imageNamed:@"circle_completed_ico"];
    }
    return _checkMarkImgView;
}

- (UILabel *)descriptionLab
{
    if (!_descriptionLab) {
        _descriptionLab = [[UILabel alloc]initWithFrame:CGRectZero];
    }
    return _descriptionLab;
}

- (UILabel *)statusLab
{
    if (!_statusLab) {
        _statusLab = [UILabel new];
    }
    return _statusLab;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
