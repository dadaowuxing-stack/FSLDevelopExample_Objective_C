//
//  FSLCommitViewModel.h
//  WeChat
//
//  Created by Fingal Liu on 2017/10/12.
//  Copyright © 2017年 Fingal Liu. All rights reserved.
//

#import "FSLLoginBaseViewModel.h"

@interface FSLCommitViewModel : FSLLoginBaseViewModel
/// closeCommand
@property (nonatomic, readonly, strong) RACCommand *closeCommand;
/// 提交命令
@property (nonatomic, readonly, strong) RACCommand *commitCommand;
/// 提交按钮有效性
@property (nonatomic, readonly, strong) RACSignal *validCommitSignal;
/// phone
@property (nonatomic, readonly, copy) NSString *phone;
/// zoneCode
@property (nonatomic, readonly, copy) NSString *zoneCode;
/// captcha
@property (nonatomic, readwrite, copy) NSString *captcha;
/// 验证码命令
@property (nonatomic, readonly, strong) RACCommand *captchaCommand;
/// 验证码显示
@property (nonatomic, readonly, copy) NSString *captchaTitle;
/// error （PS；这个记录请求过程中的发生的错误，请求之前必须置nil）
@property (nonatomic, readonly, strong) NSError *error;
@end
