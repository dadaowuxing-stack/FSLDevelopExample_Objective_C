//
//  FSLConstant.m
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/6/1.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#import "FSLConstant.h"
#import <UIKit/UIKit.h>

#pragma mark - 应用相关的
/// 切换根控制器的通知 新特性
NSString * const FSLSwitchRootViewControllerNotification = @"FSLSwitchRootViewControllerNotification";
/// 切换根控制器的通知 UserInfo key
NSString * const FSLSwitchRootViewControllerUserInfoKey = @"FSLSwitchRootViewControllerUserInfoKey";
/// 插件Switch按钮值改变
NSString * const FSLPlugSwitchValueDidChangedNotification = @"FSLPlugSwitchValueDidChangedNotification";


/// 全局分割线高度 .5
CGFloat const FSLGlobalBottomLineHeight = 0.5f;

/// 个性签名的最大字数为30
NSUInteger const FSLFeatureSignatureMaxWords = 30;

/// 用户昵称的最大字数为20
NSUInteger const FSLNicknameMaxWords = 20;


/// 简书首页地址
NSString * const FSLMyBlogHomepageUrl = @"http://www.jianshu.com/u/126498da7523";

/// 国家区号
NSString * const FSLMobileLoginZoneCodeKey = @"FSLMobileLoginZoneCodeKey";
/// 手机号码
NSString * const FSLMobileLoginPhoneKey = @"FSLMobileLoginPhoneKey";

/// 验证码时间
NSUInteger const FSLCaptchaFetchMaxWords = 60;


/// 朋友圈 ---
/// 分割线高度
CGFloat const WXGlobalBottomLineHeight = .5f;


/// 以下是 微信朋友圈常量定义区

/// profileView
/// 头像宽高 15
CGFloat const FSLMomentProfileViewAvatarViewWH = 75.0f;
/// 消息tips宽高 40
CGFloat const FSLMomentProfileViewTipsViewHeight = 40.0f;
/// 消息tips宽高 181
CGFloat const FSLMomentProfileViewTipsViewWidth = 181.0f;
/// 消息tipsView内部的头像宽高 30
CGFloat const FSLMomentProfileViewTipsViewAvatarWH = 30.0f;
/// 消息tipsView内部的头像距离tipsView边距 5
CGFloat const FSLMomentProfileViewTipsViewInnerInset = 5.0f;
/// 消息tipsView内部的右箭头距离tipsView边距 11
CGFloat const FSLMomentProfileViewTipsViewRightInset = 11.0f;
/// 消息tipsView内部的右箭头宽高 15
CGFloat const FSLMomentProfileViewTipsViewRightArrowWH = 15.0f;

/// 说说内容距离顶部的间距 16
CGFloat const FSLMomentContentTopInset = 16.0f;
/// 说说内容距离左右屏幕的间距 20
CGFloat const FSLMomentContentLeftOrRightInset = 20.0f;
/// 内容（控件）之间的的间距 10
CGFloat const FSLMomentContentInnerMargin = 10.0f;
/// 用户头像的大小 44x44
CGFloat const FSLMomentAvatarWH = 44.0f;

/// 向上箭头W 45
CGFloat const FSLMomentUpArrowViewWidth = 45.0f;
/// 向上箭头H 6
CGFloat const FSLMomentUpArrowViewHeight = 6.0f;

/// 全文、收起W
CGFloat const FSLMomentExpandButtonWidth = 35.0f;
/// 全文、收起H
CGFloat const FSLMomentExpandButtonHeight = 25.0f;

/// pictureView中图片之间的的间距 6
CGFloat const FSLMomentPhotosViewItemInnerMargin = 6.0f;
/// pictureView中图片的大小 86x86 (屏幕尺寸>320)
CGFloat const FSLMomentPhotosViewItemWH1 = 86.0f;
/// pictureView中图片的大小 70x70 (屏幕尺寸<=320)
CGFloat const FSLMomentPhotosViewItemWH2 = 70.0f;

/// 分享内容高度
CGFloat const FSLMomentShareInfoViewHeight = 50.0f;

/// videoView高度
CGFloat const FSLMomentVideoViewHeight = 181.0f;
/// videoView宽度
CGFloat const FSLMomentVideoViewWidth = 103.0f;


/// 微信正文内容的显示最大行数（PS：如果超过最大值，那么正文内容就单行显示，可以点击正文内容查看全部内容）
NSUInteger const FSLMomentContentTextMaxCriticalRow = 12000;
/// 微信正文内容显示（全文/收起）的临界行
NSUInteger const FSLMomentContentTextExpandCriticalRow = 6;
/// pictureView最多显示的图片数
NSUInteger const FSLMomentPhotosMaxCount = 9;


/// 单张图片的最大高度（等比例）180 (ps：别问我为什么，我量出来的)
CGFloat const FSLMomentPhotosViewSingleItemMaxHeight = 180;


/// 更多按钮宽高 (实际：25x25)
CGFloat const FSLMomentOperationMoreBtnWH = 25;

/// footerViewHeight
CGFloat const FSLMomentFooterViewHeight = 15;





//// 评论和点赞view 常量
/// 评论内容距离顶部的间距 5
CGFloat const FSLMomentCommentViewContentTopOrBottomInset = 5;
/// 评论内容距离评论View左右屏幕的间距 9
CGFloat const FSLMomentCommentViewContentLeftOrRightInset = 9;

/// 点赞内容距离顶部的间距 7
CGFloat const FSLMomentCommentViewAttitudesTopOrBottomInset = 7;


/// 更多操作View的Size 181x39
CGFloat const FSLMomentOperationMoreViewWidth = 181.0f;
CGFloat const FSLMomentOperationMoreViewHeight = 39.0f;

/// 微信动画时间 .25f
NSTimeInterval const FSLMommentAnimatedDuration = .2f;


/// 链接key
NSString * const FSLMomentLinkUrlKey = @"FSLMomentLinkUrlKey";
/// 电话号码key
NSString * const FSLMomentPhoneNumberKey = @"FSLMomentPhoneNumberKey";
/// 位置key
NSString * const FSLMomentLocationNameKey = @"FSLMomentLocationNameKey";

/// 用户信息key
NSString * const FSLMomentUserInfoKey = @"FSLMomentUserInfoKey";


/// 评论View
/** 弹出评论框View最小高度 */
CGFloat const FSLMomentCommentToolViewMinHeight = 60;
/** 弹出评论框View最大高度 */
CGFloat const FSLMomentCommentToolViewMaxHeight = 130;
/** 弹出评论框View的除了编辑框的高度 */
CGFloat const FSLMomentCommentToolViewWithNoTextViewHeight = 20;
