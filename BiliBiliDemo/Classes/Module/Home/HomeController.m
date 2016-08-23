//
//  HomeController.m
//  BiliBiliDemo
//
//  Created by liangbing on 16/8/11.
//  Copyright © 2016年 liangxianhua. All rights reserved.
//

#import "HomeController.h"
#import "LiveViewController.h"
#import "RencommendController.h"
#import "BangumiController.h"
@interface HomeController ()<UIPageViewControllerDelegate,UIPageViewControllerDataSource>
/** 分页控制器*/
@property (nonatomic,strong) UIPageViewController *pageViewControl;
/** 存储容器视图*/
@property (nonatomic,strong) NSMutableArray *dataArr;

@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [YYFPSLabel show];
    [self addChildViewController:self.pageViewControl];
    [self.view addSubview:self.pageViewControl.view];
    [self.view addSubview:self.navigationView];
    
}

- (void)loadCurrentSkinView
{   [super loadCurrentSkinView];
    self.navigationView.backgroundColor = SkinBackgroundColor;
    self.hmSegmentControl.backgroundColor = SkinBackgroundColor;
    self.hmSegmentControl.titleTextAttributes = @{NSForegroundColorAttributeName : SkinTextColor, NSFontAttributeName : [UIFont systemFontOfSize:17]};
    self.hmSegmentControl.selectedTitleTextAttributes = @{NSForegroundColorAttributeName :SkinTextColor};
    self.hmSegmentControl.selectionIndicatorColor = SkinTextColor;
}

- (void)segmentedControlChangedValue:(HMSegmentedControl *)segmentControl
{
    NSLog(@"%ld",segmentControl.selectedSegmentIndex);
}

#pragma mark -
#pragma mark - page delegate
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    NSUInteger index = [self indexOfViewController:viewController];
    if (index == 0 || index == NSNotFound) {
        return nil;
    }
    index--;
    return self.dataArr[index];
}
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    NSUInteger index = [self indexOfViewController:viewController];
    if (index == NSNotFound) {
        return nil;
    }
    index++;
    if (index == [self.dataArr count]) {
        return nil;
    }
    return self.dataArr[index];
    
}
-(NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return  self.dataArr.count;
}
- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}
// 根据数组元素，得到下标值
- (NSUInteger)indexOfViewController:(UIViewController *)viewControlller {
    return [self.dataArr indexOfObject:viewControlller];
}

#pragma mark -
#pragma mark - lazy

-(UIPageViewController *)pageViewControl
{
    if (!_pageViewControl) {
        //http://www.jianshu.com/p/46c8c585d50b
        _pageViewControl = [[UIPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:@{UIPageViewControllerOptionInterPageSpacingKey:@0}];
        _pageViewControl.view.bounds = self.view.bounds;
        _pageViewControl.delegate = self;
        _pageViewControl.dataSource = self;
        NSArray *pages = [NSArray arrayWithObject:self.dataArr[0]];
        [_pageViewControl setViewControllers:pages direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:nil];
        _pageViewControl.doubleSided = NO;
    }
    return _pageViewControl;
}

-(NSMutableArray *)dataArr
{
    if (!_dataArr) {
        _dataArr = [NSMutableArray new];
        [_dataArr addObject:[LiveViewController new]];
        [_dataArr addObject:[RencommendController new]];
        [_dataArr addObject:[BangumiController new]];
    }
    return _dataArr;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}




@end
