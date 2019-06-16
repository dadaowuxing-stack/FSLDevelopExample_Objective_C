//
//  FSLAccountLoginView.h
//  WeChat
//
//  Created by Fingal Liu on 2017/9/27.
//  Copyright © 2017年 Fingal Liu. All rights reserved.
//  微信号、QQ号、邮箱登录

#import <UIKit/UIKit.h>

@interface FSLAccountLoginView : UIView

/// 账号
@property (weak, nonatomic) IBOutlet UITextField *accountTextField;

/// 密码
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;


+ (instancetype)accoutLoginView;
@end
