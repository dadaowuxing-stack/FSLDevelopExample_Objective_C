//
//  FSLBootLoginViewController.m
//  WeChat
//
//  Created by Fingal Liu on 2017/9/26.
//  Copyright © 2017年 Fingal Liu. All rights reserved.
//

#import "FSLBootLoginViewController.h"

@interface FSLBootLoginViewController ()
/// 登录按钮
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
/// 注册按钮
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;
/// viewModel
@property (nonatomic, readonly, strong) FSLBootLoginViewModel *viewModel;
/// languageBtn
@property (weak, nonatomic) IBOutlet UIButton *languageBtn;

@end

@implementation FSLBootLoginViewController

@dynamic viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    /// 设置子控件
    [self _setupSubViews];
}

#pragma mark - 事件处理
- (IBAction)_languageBtnDidClicked:(UIButton *)sender {
    [self.viewModel.languageCommand execute:nil];
}

- (IBAction)_loginBtnDidClicked:(UIButton *)sender {
    [self.viewModel.loginCommand execute:nil];
}

- (IBAction)_registerBtnDidClicked:(UIButton *)sender {
    [self.viewModel.registerCommand execute:nil];
}


#pragma mark - Override
- (void)bindViewModel{
    [super bindViewModel];
    @weakify(self);
    [RACObserve(self.viewModel, language) subscribeNext:^(NSString * language) {
        @strongify(self);
        [self.languageBtn setTitle:language forState:UIControlStateNormal];
    }];
}

- (BOOL)prefersStatusBarHidden{
    return YES;
}
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleDefault;
}

#pragma mark - 设置子控件
- (void)_setupSubViews{
    [self.loginBtn setBackgroundImage:[UIImage yy_imageWithColor:FSLColorFromHexString(@"#F8F8F8")] forState:UIControlStateNormal];
    [self.loginBtn setBackgroundImage:[UIImage yy_imageWithColor:FSLColorFromHexString(@"#E3E3E3")] forState:UIControlStateHighlighted];
    [self.registerBtn setBackgroundImage:[UIImage yy_imageWithColor:FSLColorFromHexString(@"#52AA35")] forState:UIControlStateNormal];
    [self.registerBtn setBackgroundImage:[UIImage yy_imageWithColor:FSLColorFromHexString(@"#0F961A")] forState:UIControlStateHighlighted];
}
@end
