//
//  ThemeController.m
//  BiliBiliDemo
//
//  Created by liangbing on 16/8/17.
//  Copyright © 2016年 liangxianhua. All rights reserved.
//

#import "ThemeController.h"
#import "ThemeCell.h"

@interface ThemeController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *myTableView;

@end

@implementation ThemeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleLab.text = @"主题选择";
    [self.view addSubview:self.myTableView];
}

#pragma mark -
#pragma mark - tableView Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ThemeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ThemeCell" forIndexPath:indexPath];
    cell.descriptionLab.text = [self titles][indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return ThemeCellH;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        [SkinTool setSkincolor:SakuraPinkSystemStyle];
        [self loadCurrentSkinView];
    }
    if (indexPath.row == 1) {
        [SkinTool setSkincolor:ConcisenessWhiteSystemStyle];
        [self loadCurrentSkinView];
    }
}


#pragma mark -
#pragma mark - lazy

- (UITableView *)myTableView
{
    if (!_myTableView) {
        _myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, APPW, APPH - 64) style:UITableViewStylePlain];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
        _myTableView.tableFooterView = [UIView new];
        [_myTableView registerClass:[ThemeCell class] forCellReuseIdentifier:@"ThemeCell"];
    }
    return _myTableView;
}

- (NSArray *)titles
{
    return @[@"樱花粉",@"简洁白"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
