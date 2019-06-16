//
//  FSLPrivacyViewModel.m
//  WeChat
//
//  Created by senba on 2017/12/18.
//  Copyright © 2017年 Fingal Liu. All rights reserved.
//

#import "FSLPrivacyViewModel.h"
#import "FSLCommonSwitchItemViewModel.h"
#import "FSLCommonArrowItemViewModel.h"
#import "FSLWebViewModel.h"
@interface FSLPrivacyViewModel ()
/// 软件许可
@property (nonatomic, readwrite, strong) RACCommand *softLicenseCommand;
/// 隐私保护
@property (nonatomic, readwrite, strong) RACCommand *privateGuardCommand;
@end


@implementation FSLPrivacyViewModel
- (void)initialize{
    [super initialize];
    @weakify(self);
    self.title = @"隐私";
    
    self.style = UITableViewStyleGrouped;
    
    CGFloat limitWidth = FSL_SCREEN_WIDTH - 2 * 20;
    
    /// 第一组
    FSLCommonGroupViewModel *group0 = [FSLCommonGroupViewModel groupViewModel];
    /// 加我为朋友时需要验证
    FSLCommonSwitchItemViewModel *verification = [FSLCommonSwitchItemViewModel itemViewModelWithTitle:@"加我为朋友时需要验证"];
    verification.key = FSLPreferenceSettingAddFriendNeedVerify;
    verification.selectionStyle = UITableViewCellSelectionStyleNone;
    group0.itemViewModels = @[verification];
    
    /// 第二组
    FSLCommonGroupViewModel *group1 = [FSLCommonGroupViewModel groupViewModel];
    /// 添加我的方式
    FSLCommonArrowItemViewModel * addWay = [FSLCommonArrowItemViewModel itemViewModelWithTitle:@"添加我的方式"];
    addWay.operation = ^{
        @strongify(self);

    };
    
    /// 向我推荐通讯录朋友
    FSLCommonSwitchItemViewModel *recommend = [FSLCommonSwitchItemViewModel itemViewModelWithTitle:@"向我推荐通讯录朋友"];
    recommend.key = FSLPreferenceSettingRecommendFriendFromContactsList;
    recommend.selectionStyle = UITableViewCellSelectionStyleNone;
    group1.footer = @"开启后，为你推荐已经开通微信的手机联系人。";
    CGFloat footerHeight1 = [group1.footer fsl_sizeWithFont:FSLRegularFont_14 limitWidth:limitWidth].height + 5 *2;
    group1.footerHeight = footerHeight1;
    group1.itemViewModels = @[addWay , recommend];
    
    
    /// 第三组
    FSLCommonGroupViewModel *group2 = [FSLCommonGroupViewModel groupViewModel];
    /// 通讯录黑名单
    FSLCommonArrowItemViewModel * blacklist = [FSLCommonArrowItemViewModel itemViewModelWithTitle:@"通讯录黑名单"];
    group2.headerHeight = 15;
    group2.footerHeight = 15;
    group2.itemViewModels = @[blacklist];
    
    
    /// 第四组
    FSLCommonGroupViewModel *group3 = [FSLCommonGroupViewModel groupViewModel];
    /// 不让他(她)看我的朋友圈
    FSLCommonArrowItemViewModel * notAllow = [FSLCommonArrowItemViewModel itemViewModelWithTitle:@"不让他(她)看我的朋友圈"];
    /// 不看他(她)的朋友圈
    FSLCommonArrowItemViewModel * notWatch = [FSLCommonArrowItemViewModel itemViewModelWithTitle:@"不看他(她)的朋友圈"];
    /// 允许朋友查看朋友圈的范围
    FSLCommonArrowItemViewModel * watchSize = [FSLCommonArrowItemViewModel itemViewModelWithTitle:@"允许朋友查看朋友圈的范围"];
    /// 允许陌生人查看十条朋友圈
    FSLCommonSwitchItemViewModel *stranger= [FSLCommonSwitchItemViewModel itemViewModelWithTitle:@"允许陌生人查看十条朋友圈"];
    stranger.key = FSLPreferenceSettingAllowStrongerWatchTenMoments;
    stranger.selectionStyle = UITableViewCellSelectionStyleNone;
    
    group3.header = @"朋友圈";
    CGFloat headerHeight3 = [group3.header fsl_sizeWithFont:FSLRegularFont_14 limitWidth:limitWidth].height + 5 *2;
    group3.headerHeight = headerHeight3;
    group3.itemViewModels = @[notAllow , notWatch , watchSize , stranger];
    
    
    /// 第五组
    FSLCommonGroupViewModel *group4 = [FSLCommonGroupViewModel groupViewModel];
    /// 开启朋友圈入口
    FSLCommonSwitchItemViewModel *entrance = [FSLCommonSwitchItemViewModel itemViewModelWithTitle:@"开启朋友圈入口"];
    entrance.key = FSLPreferenceSettingOpenFriendMomentsEntrance;
    entrance.selectionStyle = UITableViewCellSelectionStyleNone;
    group4.footer = @"关闭后，将隐藏”发现“中的朋友圈入口，你发过来的朋友圈不会清空，朋友仍可以看到";
    CGFloat footerHeight4 = [group4.footer fsl_sizeWithFont:FSLRegularFont_14 limitWidth:limitWidth].height + 5 *2;
    group4.footerHeight = footerHeight4;
    group4.itemViewModels = @[entrance];
    
    
    /// 第六组
    FSLCommonGroupViewModel *group5 = [FSLCommonGroupViewModel groupViewModel];
    /// 开启朋友圈入口
    FSLCommonSwitchItemViewModel *updateAlert = [FSLCommonSwitchItemViewModel itemViewModelWithTitle:@"朋友圈更新提醒"];
    updateAlert.key = FSLPreferenceSettingFriendMomentsUpdateAlert;
    updateAlert.selectionStyle = UITableViewCellSelectionStyleNone;
    group5.footer = @"关闭后，有朋友发表朋友圈时，界面下方的”发现“切换按钮上不在出现红点提示";
    CGFloat footerHeight5 = [group4.footer fsl_sizeWithFont:FSLRegularFont_14 limitWidth:limitWidth].height + 5 *2;
    group5.footerHeight = footerHeight5;
    group5.headerHeight = 15;
    group5.itemViewModels = @[updateAlert];
    
    
    /// 第七组
    FSLCommonGroupViewModel *group6 = [FSLCommonGroupViewModel groupViewModel];
    /// 授权管理
    FSLCommonArrowItemViewModel * kinguser = [FSLCommonArrowItemViewModel itemViewModelWithTitle:@"授权管理"];
    group6.headerHeight = 15;
    group6.itemViewModels = @[kinguser];
    
    
    /// 数据源
    self.dataSource = @[group0 , group1 , group2 , group3 , group4 , group5 , group6];
    
    
    /// 初始化一些命令
    self.softLicenseCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self);
        NSURL *url = [NSURL URLWithString:FSLMyBlogHomepageUrl];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        FSLWebViewModel * viewModel = [[FSLWebViewModel alloc] initWithServices:self.services params:@{FSLViewModelRequestKey:request}];
        /// 去掉关闭按钮
        viewModel.shouldDisableWebViewClose = YES;
        [self.services pushViewModel:viewModel animated:YES];
        
        return [RACSignal empty];
    }];
    
    self.privateGuardCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self);
        NSURL *url = [NSURL URLWithString:FSLMyBlogHomepageUrl];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        FSLWebViewModel * viewModel = [[FSLWebViewModel alloc] initWithServices:self.services params:@{FSLViewModelRequestKey:request}];
        /// 去掉关闭按钮
        viewModel.shouldDisableWebViewClose = YES;
        [self.services pushViewModel:viewModel animated:YES];
        return [RACSignal empty];
    }];
}
@end
