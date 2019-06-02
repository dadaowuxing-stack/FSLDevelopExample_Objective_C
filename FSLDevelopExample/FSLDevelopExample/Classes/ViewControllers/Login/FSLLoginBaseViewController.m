//
//  FSLLoginBaseViewController.m
//  WeChat
//
//  Created by senba on 2017/9/26.
//  Copyright © 2017年 CoderMikeHe. All rights reserved.
//

#import "FSLLoginBaseViewController.h"

@interface FSLLoginBaseViewController ()

@end

@implementation FSLLoginBaseViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    /// 设置颜色
    [self.navigationController.navigationBar setBarTintColor:FSL_MAIN_NAVIGATIONBAR_BACKGROUNDCOLOR_3];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    /// 设置颜色
    [self.navigationController.navigationBar setBarTintColor:FSL_MAIN_NAVIGATIONBAR_BACKGROUNDCOLOR_1];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = FSLColorFromHexString(@"#F3F3F3");
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleDefault;
}

@end
