//
//  FSLAccountSecurityViewModel.m
//  WeChat
//
//  Created by Fingal Liu on 2017/12/7.
//  Copyright © 2017年 Fingal Liu. All rights reserved.
//

#import "FSLAccountSecurityViewModel.h"
#import "FSLCommonLabelItemViewModel.h"
#import "FSLCommonArrowItemViewModel.h"

@implementation FSLAccountSecurityViewModel
- (void)initialize{
    [super initialize];
    @weakify(self);
    self.title = @"账号与安全";
    
    FSLUser *user = self.services.client.currentUser;
    
    /// 第一组
    FSLCommonGroupViewModel *group0 = [FSLCommonGroupViewModel groupViewModel];
    /// 微信号
    FSLCommonItemViewModel *wechatId = [FSLCommonItemViewModel itemViewModelWithTitle:@"微信号"];
    wechatId.selectionStyle = UITableViewCellSelectionStyleNone;
    wechatId.subtitle = user.wechatId;
    /// 手机号
    FSLCommonArrowItemViewModel *phoneNum = [FSLCommonArrowItemViewModel itemViewModelWithTitle:@"手机号"];
    phoneNum.centerRightViewName = @"ProfileLockOn_17x17";
    phoneNum.subtitle = user.phone;
    group0.itemViewModels = @[ wechatId , phoneNum];
    
    /// 第二组
    FSLCommonGroupViewModel *group1 = [FSLCommonGroupViewModel groupViewModel];
    /// 微信密码
    FSLCommonArrowItemViewModel *password = [FSLCommonArrowItemViewModel itemViewModelWithTitle:@"微信密码"];
    password.subtitle = @"已设置";
    /// 声音锁
    FSLCommonArrowItemViewModel *voiceLock = [FSLCommonArrowItemViewModel itemViewModelWithTitle:@"声音锁"];
    voiceLock.subtitle = @"未设置";
    /// 通用
    group1.itemViewModels = @[ password , voiceLock];
    
    /// 第三组
    FSLCommonGroupViewModel *group2 = [FSLCommonGroupViewModel groupViewModel];
    /// 应急联系人
    FSLCommonArrowItemViewModel *emergencyContact = [FSLCommonArrowItemViewModel itemViewModelWithTitle:@"应急联系人"];
    /// 登录设备管理
    FSLCommonArrowItemViewModel *deviceManager = [FSLCommonArrowItemViewModel itemViewModelWithTitle:@"登录设备管理"];
    /// 更多安全设置
    FSLCommonArrowItemViewModel *moreSecuritySetting = [FSLCommonArrowItemViewModel itemViewModelWithTitle:@"更多安全设置"];
    group2.itemViewModels = @[ emergencyContact , deviceManager, moreSecuritySetting];
    
    
    /// 第三组
    FSLCommonGroupViewModel *group3 = [FSLCommonGroupViewModel groupViewModel];
    /// 微信安全中心
    FSLCommonArrowItemViewModel *securityCenter = [FSLCommonArrowItemViewModel itemViewModelWithTitle:@"微信安全中心"];
    group3.itemViewModels = @[securityCenter];
    group3.footer = @"如果遇到账号信息泄露、忘记密码、诈骗等账号安全问题，可前往微信安全中心。";
    
    /// 计算 20
    CGFloat limitWidth = FSL_SCREEN_WIDTH - 2 * 20;
    CGFloat footerHeight = [group3.footer fsl_sizeWithFont:FSLRegularFont_14 limitWidth:limitWidth].height + 5 *2;
    group3.footerHeight = footerHeight;
    
    self.dataSource = @[group0 , group1 , group2 , group3];
    
}
@end
