//
//  FSLSettingViewModel.m
//  WeChat
//
//  Created by Fingal Liu on 2017/10/11.
//  Copyright © 2017年 Fingal Liu. All rights reserved.
//

#import "FSLSettingViewModel.h"
#import "FSLCommonArrowItemViewModel.h"
#import "FSLPlugViewModel.h"
#import "FSLAccountSecurityViewModel.h"
#import "FSLNotificationViewModel.h"
#import "FSLWebViewModel.h"
#import "FSLAboutUsViewModel.h"
#import "FSLPrivacyViewModel.h"
#import "FSLGeneralViewModel.h"
@interface FSLSettingViewModel ()
/// 登出的命令
@property (nonatomic, readwrite, strong) RACCommand *logoutCommand;
@end

@implementation FSLSettingViewModel
- (void)initialize{
    [super initialize];
    @weakify(self);
    self.title = @"设置";
    /// 第一组
    FSLCommonGroupViewModel *group0 = [FSLCommonGroupViewModel groupViewModel];
    ///账号与安全
    FSLCommonArrowItemViewModel *accountSecurity = [FSLCommonArrowItemViewModel itemViewModelWithTitle:@"账号与安全"];
    accountSecurity.destViewModelClass = [FSLAccountSecurityViewModel class];
    group0.itemViewModels = @[ accountSecurity ];
    
    /// 第二组
    FSLCommonGroupViewModel *group1 = [FSLCommonGroupViewModel groupViewModel];
    /// 新消息通知
    FSLCommonArrowItemViewModel *messageNote = [FSLCommonArrowItemViewModel itemViewModelWithTitle:@"新消息通知"];
    messageNote.destViewModelClass = [FSLNotificationViewModel class];
    /// 隐私
    FSLCommonArrowItemViewModel *private = [FSLCommonArrowItemViewModel itemViewModelWithTitle:@"隐私"];
    private.destViewModelClass = [FSLPrivacyViewModel class];
    
    /// 通用
    FSLCommonArrowItemViewModel *general = [FSLCommonArrowItemViewModel itemViewModelWithTitle:@"通用"];
    general.destViewModelClass = [FSLGeneralViewModel class];
    group1.itemViewModels = @[ messageNote , private , general];
    
    /// 第三组
    FSLCommonGroupViewModel *group2 = [FSLCommonGroupViewModel groupViewModel];
    /// 帮助与反馈
    FSLCommonArrowItemViewModel *help = [FSLCommonArrowItemViewModel itemViewModelWithTitle:@"帮助与反馈"];
    help.operation = ^{
        @strongify(self);
        NSURL *url = [NSURL URLWithString:FSLMyBlogHomepageUrl];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        FSLWebViewModel * viewModel = [[FSLWebViewModel alloc] initWithServices:self.services params:@{FSLViewModelRequestKey:request}];
        /// 去掉关闭按钮
        viewModel.shouldDisableWebViewClose = YES;
        [self.services pushViewModel:viewModel animated:YES];
    };
    
    /// 关于微信
    FSLCommonArrowItemViewModel *aboutUs = [FSLCommonArrowItemViewModel itemViewModelWithTitle:@"关于微信"];
    aboutUs.destViewModelClass = [FSLAboutUsViewModel class];
    group2.itemViewModels = @[ help , aboutUs];
    
    /// 第四组
    FSLCommonGroupViewModel *group3 = [FSLCommonGroupViewModel groupViewModel];
    /// 插件
    FSLCommonArrowItemViewModel *plug = [FSLCommonArrowItemViewModel itemViewModelWithTitle:@"插件"];
    plug.centerLeftViewName = @"WeChat_Lab_Logo_small_15x17";
    plug.destViewModelClass = [FSLPlugViewModel class];
    group3.itemViewModels = @[ plug ];
    
    self.dataSource = @[group0 , group1 , group2 , group3];
    
    /// 退出登录的命令
    self.logoutCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self);
        /// 删除账号
        [SAMKeychain deleteRawLogin];
        /// 先退出用户
        [[self.services client] logoutUser];
        
        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            /// 延迟一段时间
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                /// 这里切换 到账号登录的界面
                [FSLNotificationCenter postNotificationName:FSLSwitchRootViewControllerNotification object:nil userInfo:@{FSLSwitchRootViewControllerUserInfoKey:@(FSLSwitchRootViewControllerFromTypeLogout)}];
                [subscriber sendNext:nil];
                [subscriber sendCompleted]; 
            });
            return [RACDisposable disposableWithBlock:^{
                
            }];
        }];
    }];
    
    
}
@end
