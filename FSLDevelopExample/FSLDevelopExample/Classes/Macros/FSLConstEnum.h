//
//  FSLConstEnum.h
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/6/1.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#ifndef FSLConstEnum_h
#define FSLConstEnum_h

/// tababr item tag
typedef NS_ENUM(NSUInteger, FSLTabBarItemTagType) {
    FSLTabBarItemTagTypeMainFrame = 0,    /// 消息回话
    FSLTabBarItemTagTypeContacts,         /// 通讯录
    FSLTabBarItemTagTypeDiscover,         /// 发现
    FSLTabBarItemTagTypeProfile,          /// 我的
};


/// 切换根控制器类型
typedef NS_ENUM(NSUInteger, FSLSwitchRootViewControllerFromType) {
    FSLSwitchRootViewControllerFromTypeNewFeature = 0,  /// 新特性
    FSLSwitchRootViewControllerFromTypeLogin,           /// 登录
    FSLSwitchRootViewControllerFromTypeLogout,          /// 登出
};

/// 用户登录的渠道
typedef NS_ENUM(NSUInteger, FSLUserLoginChannelType) {
    FSLUserLoginChannelTypeQQ = 0,           /// qq登录
    FSLUserLoginChannelTypeEmail,            /// 邮箱登录
    FSLUserLoginChannelTypeWeChatId,         /// 微信号登录
    FSLUserLoginChannelTypePhone,            /// 手机号登录
};

/// 用户性别
typedef NS_ENUM(NSUInteger, FSLUserGenderType) {
    FSLUserGenderTypeMale =0,            /// 男
    FSLUserGenderTypeFemale,             /// nv
};

/// 插件详情说明
typedef NS_ENUM(NSUInteger, FSLPlugDetailType) {
    FSLPlugDetailTypeLook = 0,     /// 看一看
    FSLPlugDetailTypeSearch,       /// 搜一搜
};


/// 微信朋友圈类型 （0 配图  1 video 2 share）
typedef NS_ENUM(NSUInteger, FSLMomentExtendType) {
    FSLMomentExtendTypePicture = 0, /// 配图
    FSLMomentExtendTypeVideo,       /// 视频
    FSLMomentExtendTypeShare,       /// 分享
};


/// 微信朋友圈分享内容的类型
typedef NS_ENUM(NSUInteger, FSLMomentShareInfoType) {
    FSLMomentShareInfoTypeWebPage = 0, /// 网页
    FSLMomentShareInfoTypeMusic,       /// 音乐
};

#endif /* FSLConstEnum_h */
