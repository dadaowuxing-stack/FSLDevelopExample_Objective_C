//
//  FSLPreferenceSettingHelper.m
//  WeChat
//
//  Created by senba on 2017/10/14.
//  Copyright © 2017年 Fingal Liu. All rights reserved.
//  项目的偏好设置工具类

#import "FSLPreferenceSettingHelper.h"
/// 偏好设置
#define FSLUserDefaults [NSUserDefaults standardUserDefaults]

/// 存储language
NSString * const FSLPreferenceSettingLanguage = @"FSLPreferenceSettingLanguage";

/// 存储看一看
NSString * const FSLPreferenceSettingLook = @"FSLPreferenceSettingLook";
/// 存储看一看（全新）
NSString * const FSLPreferenceSettingLookArtboard = @"FSLPreferenceSettingLookArtboard";

/// 存储搜一搜
NSString * const FSLPreferenceSettingSearch = @"FSLPreferenceSettingSearch" ;
/// 存储搜一搜（全新）
NSString * const FSLPreferenceSettingSearchArtboard = @"FSLPreferenceSettingSearchArtboard" ;


/// ---- 新消息通知
/// 接收新消息通知
NSString * const FSLPreferenceSettingReceiveNewMessageNotification = @"FSLPreferenceSettingReceiveNewMessageNotification";
/// 接收语音和视频聊天邀请通知
NSString * const FSLPreferenceSettingReceiveVoiceOrVideoNotification = @"FSLPreferenceSettingReceiveVoiceOrVideoNotification";
/// 视频聊天、语音聊天铃声
NSString * const FSLPreferenceSettingVoiceOrVideoChatRing = @"FSLPreferenceSettingVoiceOrVideoChatRing" ;
/// 通知显示消息详情
NSString * const FSLPreferenceSettingNotificationShowDetailMessage = @"FSLPreferenceSettingNotificationShowDetailMessage" ;
/// 消息提醒铃声
NSString * const FSLPreferenceSettingMessageAlertVolume = @"FSLPreferenceSettingMessageAlertVolume";
/// 消息提醒震动
NSString * const FSLPreferenceSettingMessageAlertVibration = @"FSLPreferenceSettingMessageAlertVibration";


/// ---- 设置消息免打扰
NSString * const FSLPreferenceSettingMessageFreeInterruption = @"FSLPreferenceSettingMessageFreeInterruption" ;

/// ---- 隐私
/// 加我为朋友时需要验证
NSString * const FSLPreferenceSettingAddFriendNeedVerify = @"FSLPreferenceSettingAddFriendNeedVerify";
/// 向我推荐通讯录朋友
NSString * const FSLPreferenceSettingRecommendFriendFromContactsList = @"FSLPreferenceSettingRecommendFriendFromContactsList";
/// 允许陌生人查看十条朋友圈
NSString * const FSLPreferenceSettingAllowStrongerWatchTenMoments = @"FSLPreferenceSettingAllowStrongerWatchTenMoments";
/// 开启朋友圈入口
NSString * const FSLPreferenceSettingOpenFriendMomentsEntrance = @"FSLPreferenceSettingOpenFriendMomentsEntrance";
/// 朋友圈更新提醒
NSString * const FSLPreferenceSettingFriendMomentsUpdateAlert = @"FSLPreferenceSettingFriendMomentsUpdateAlert";

/// ---- 通用
/// 听筒模式
NSString * const FSLPreferenceSettingReceiverMode = @"FSLPreferenceSettingReceiverMode";


@implementation FSLPreferenceSettingHelper

+ (id)objectForKey:(NSString *)defaultName{
    return [FSLUserDefaults objectForKey:defaultName];
}

+ (void)setObject:(id)value forKey:(NSString *)defaultName
{
    [FSLUserDefaults setObject:value forKey:defaultName];
    [FSLUserDefaults synchronize];
}

+ (BOOL)boolForKey:(NSString *)defaultName
{
    return [FSLUserDefaults boolForKey:defaultName];
}

+ (void)setBool:(BOOL)value forKey:(NSString *)defaultName
{
    [FSLUserDefaults setBool:value forKey:defaultName];
    [FSLUserDefaults synchronize];
}
@end
