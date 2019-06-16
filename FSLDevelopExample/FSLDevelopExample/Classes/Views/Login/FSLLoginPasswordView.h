//
//  FSLLoginPasswordView.h
//  WeChat
//
//  Created by Fingal Liu on 2017/9/25.
//  Copyright © 2017年 Fingal Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FSLLoginPasswordView : UIView
/// init
+ (instancetype)passwordView;

/// passwordTextField
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

/// left default is 65
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *passwordTextFieldLeftCons;

@end
