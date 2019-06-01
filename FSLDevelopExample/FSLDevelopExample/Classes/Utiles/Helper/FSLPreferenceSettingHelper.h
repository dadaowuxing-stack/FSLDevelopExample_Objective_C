//
//  FSLPreferenceSettingHelper.h
//  WeChat
//
//  Created by senba on 2017/10/14.
//  Copyright © 2017年 CoderMikeHe. All rights reserved.
//

#import <Foundation/Foundation.h>

/// 存储language
FOUNDATION_EXTERN NSString * const FSLPreferenceSettingLanguage ;

/// 存储看一看
FOUNDATION_EXTERN NSString * const FSLPreferenceSettingLook ;
/// 存储看一看（全新）
FOUNDATION_EXTERN NSString * const FSLPreferenceSettingLookArtboard ;
/// 存储搜一搜
FOUNDATION_EXTERN NSString * const FSLPreferenceSettingSearch ;
/// 存储搜一搜（全新）
FOUNDATION_EXTERN NSString * const FSLPreferenceSettingSearchArtboard ;




/// ---- 新消息通知
/// 接收新消息通知
FOUNDATION_EXTERN NSString * const FSLPreferenceSettingReceiveNewMessageNotification ;
/// 接收语音和视频聊天邀请通知
FOUNDATION_EXTERN NSString * const FSLPreferenceSettingReceiveVoiceOrVideoNotification ;
/// 视频聊天、语音聊天铃声
FOUNDATION_EXTERN NSString * const FSLPreferenceSettingVoiceOrVideoChatRing ;
/// 通知显示消息详情
FOUNDATION_EXTERN NSString * const FSLPreferenceSettingNotificationShowDetailMessage ;
/// 消息提醒铃声
FOUNDATION_EXTERN NSString * const FSLPreferenceSettingMessageAlertVolume ;
/// 消息提醒震动
FOUNDATION_EXTERN NSString * const FSLPreferenceSettingMessageAlertVibration ;


/// ---- 设置消息免打扰
FOUNDATION_EXTERN NSString * const FSLPreferenceSettingMessageFreeInterruption ;


/// ---- 隐私
/// 加我为朋友时需要验证
FOUNDATION_EXTERN NSString * const FSLPreferenceSettingAddFriendNeedVerify ;
/// 向我推荐通讯录朋友
FOUNDATION_EXTERN NSString * const FSLPreferenceSettingRecommendFriendFromContactsList ;
/// 允许陌生人查看十条朋友圈
FOUNDATION_EXTERN NSString * const FSLPreferenceSettingAllowStrongerWatchTenMoments ;
/// 开启朋友圈入口
FOUNDATION_EXTERN NSString * const FSLPreferenceSettingOpenFriendMomentsEntrance ;
/// 朋友圈更新提醒
FOUNDATION_EXTERN NSString * const FSLPreferenceSettingFriendMomentsUpdateAlert ;


/// ---- 通用
/// 听筒模式
FOUNDATION_EXTERN NSString * const FSLPreferenceSettingReceiverMode ;


@interface FSLPreferenceSettingHelper : NSObject

+ (id)objectForKey:(NSString *)defaultName;
+ (void)setObject:(id)value forKey:(NSString *)defaultName;

+ (BOOL)boolForKey:(NSString *)defaultName;
+ (void)setBool:(BOOL)value forKey:(NSString *)defaultName;
@end
