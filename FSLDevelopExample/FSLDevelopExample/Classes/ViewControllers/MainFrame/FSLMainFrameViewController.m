//
//  FSLMainFrameViewController.m
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/6/2.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#import "FSLMainFrameViewController.h"

@interface FSLMainFrameViewController ()

@end

@implementation FSLMainFrameViewController

- (void)viewDidLoad {

    ///①：子类调用父类的viewDidLoad方法，而父类主要是创建tableView以及强行布局子控件，
    ///从而导致tableView刷新，这样就会去走tableView的数据源方法
    [super viewDidLoad];
    /// 设置
    [self _setup];
    
    /// 设置导航栏
    [self _setupNavigationItem];
}

#pragma mark - 事件处理
- (void)_addMore{
    
    
}

#pragma mark - 初始化
- (void)_setup{
    /// set up ...
}
#pragma mark - 设置导航栏
- (void)_setupNavigationItem{
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem fsl_systemItemWithTitle:nil titleColor:nil imageName:@"barbuttonicon_add_30x30" target:self selector:@selector(_addMore) textType:NO];
}

@end
