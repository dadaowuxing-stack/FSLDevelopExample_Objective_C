//
//  FSLUser.h
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/6/1.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FSLUser : FSLObject
/// 昵称
@property (nonatomic, readwrite, copy) NSString *screenName;
/// id
@property (nonatomic, readwrite, copy) NSString *idstr;
/// avatar 头像 50x50
@property (nonatomic, readwrite, strong) NSURL *profileImageUrl;
/// avatar large 180 x 180
@property (nonatomic, readwrite, strong) NSURL *avatarLarge;
/// 封面URL
@property (nonatomic, readwrite, strong) NSURL *coverImageUrl;
/// UIImage (PS:这里就假设我们已经通过coverImageUrl将图片下载到本地了)
@property (nonatomic, readwrite, strong) UIImage *coverImage;

/// 个性签名
@property (nonatomic, readwrite, copy) NSString *featureSignature;

/// 用户性别 0 - 男 1 - 女
@property (nonatomic, readwrite, assign) FSLUserGenderType gender;

/// ----- 登录相关 -----
/// qq
@property (nonatomic, readwrite, copy) NSString *qq;
/// 邮箱
@property (nonatomic, readwrite, copy) NSString *email;
/// 微信号
@property (nonatomic, readwrite, copy) NSString *wechatId;
/// 手机号码
@property (nonatomic, readwrite, copy) NSString *phone;

/// 登录渠道
@property (nonatomic, readwrite, assign) FSLUserLoginChannelType channel;
@end
