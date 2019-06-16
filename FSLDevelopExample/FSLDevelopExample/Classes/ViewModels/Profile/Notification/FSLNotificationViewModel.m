//
//  FSLNotificationViewModel.m
//  WeChat
//
//  Created by senba on 2017/12/11.
//  Copyright © 2017年 Fingal Liu. All rights reserved.
//

#import "FSLNotificationViewModel.h"
#import "FSLCommonSwitchItemViewModel.h"
#import "FSLCommonArrowItemViewModel.h"
#import "FSLFreeInterruptionViewModel.h"
@implementation FSLNotificationViewModel
- (void)initialize{
    [super initialize];
    @weakify(self);
    self.title = @"新消息通知";
    
    /// 第一组
    FSLCommonGroupViewModel *group0 = [FSLCommonGroupViewModel groupViewModel];
    /// 接收新消息通知
    FSLCommonSwitchItemViewModel *notification = [FSLCommonSwitchItemViewModel itemViewModelWithTitle:@"接收新消息通知"];
    notification.key = FSLPreferenceSettingReceiveNewMessageNotification;
    notification.selectionStyle = UITableViewCellSelectionStyleNone;
    /// 接收语音和视频聊天通知
    FSLCommonSwitchItemViewModel * voiceOrVideo= [FSLCommonSwitchItemViewModel itemViewModelWithTitle:@"接收语音和视频聊天邀请通知"];
    voiceOrVideo.key = FSLPreferenceSettingReceiveVoiceOrVideoNotification;
    voiceOrVideo.selectionStyle = UITableViewCellSelectionStyleNone;
    /// 视频聊天、语音聊天铃声
    FSLCommonSwitchItemViewModel * voiceOrVideoChat= [FSLCommonSwitchItemViewModel itemViewModelWithTitle:@"视频聊天、语音聊天铃声"];
    voiceOrVideoChat.key = FSLPreferenceSettingVoiceOrVideoChatRing;
    voiceOrVideoChat.selectionStyle = UITableViewCellSelectionStyleNone;
    group0.itemViewModels = @[notification , voiceOrVideo , voiceOrVideoChat];
    
    /// 第二组
    FSLCommonGroupViewModel *group1 = [FSLCommonGroupViewModel groupViewModel];
    /// 通知显示消息详情
    FSLCommonSwitchItemViewModel * messageDetail= [FSLCommonSwitchItemViewModel itemViewModelWithTitle:@"通知显示消息详情"];
    messageDetail.key = FSLPreferenceSettingNotificationShowDetailMessage;
    messageDetail.selectionStyle = UITableViewCellSelectionStyleNone;
    
    group1.footer = @"关闭后，当收到消息时，通知提示将不再显示发信人和内容摘要。";
    CGFloat limitWidth = FSL_SCREEN_WIDTH - 2 * 20;
    CGFloat footerHeight1 = [group1.footer fsl_sizeWithFont:FSLRegularFont_14 limitWidth:limitWidth].height + 5 *2;
    group1.footerHeight = footerHeight1;
    group1.itemViewModels = @[messageDetail];
    
    /// 第三组
    FSLCommonGroupViewModel *group2 = [FSLCommonGroupViewModel groupViewModel];
    /// 功能消息免打扰
    FSLCommonArrowItemViewModel * freeInterruption = [FSLCommonArrowItemViewModel itemViewModelWithTitle:@"功能消息免打扰"];
    freeInterruption.operation = ^{
        @strongify(self);
        FSLFreeInterruptionViewModel *viewModel = [[FSLFreeInterruptionViewModel alloc] initWithServices:self.services params:nil];
        [self.services presentViewModel:viewModel animated:YES completion:NULL];
    };
    group2.footer = @"设置系统功能消息提示声音和震动的时段。";
    CGFloat footerHeight2 = [group2.footer fsl_sizeWithFont:FSLRegularFont_14 limitWidth:limitWidth].height + 5 *2;
    group2.footerHeight = footerHeight2;
    group2.headerHeight = 21;
    group2.itemViewModels = @[freeInterruption];
 
    /// 第四组
    FSLCommonGroupViewModel *group3 = [FSLCommonGroupViewModel groupViewModel];
    
    /// 声音
    FSLCommonSwitchItemViewModel * volume= [FSLCommonSwitchItemViewModel itemViewModelWithTitle:@"声音"];
    volume.key = FSLPreferenceSettingMessageAlertVolume;
    volume.selectionStyle = UITableViewCellSelectionStyleNone;
    /// 震动
    FSLCommonSwitchItemViewModel * vibration= [FSLCommonSwitchItemViewModel itemViewModelWithTitle:@"震动"];
    vibration.key = FSLPreferenceSettingMessageAlertVibration;
    vibration.selectionStyle = UITableViewCellSelectionStyleNone;
    
    group3.itemViewModels = @[volume , vibration];
    group3.footer = @"当微信在运行时，你可以设置是否需要声音或者震动。";
    group3.headerHeight = 21;
    /// 计算 20
    CGFloat footerHeight3 = [group3.footer fsl_sizeWithFont:FSLRegularFont_14 limitWidth:limitWidth].height + 5 *2;
    group3.footerHeight = footerHeight3;
    group3.itemViewModels = @[volume , vibration];
    
    self.dataSource = @[group0 , group1 , group2 , group3];
    
    
}
@end
