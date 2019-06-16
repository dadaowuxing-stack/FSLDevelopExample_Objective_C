//
//  FSLAccountLoginView.m
//  WeChat
//
//  Created by Fingal Liu on 2017/9/27.
//  Copyright © 2017年 Fingal Liu. All rights reserved.
//

#import "FSLAccountLoginView.h"

@implementation FSLAccountLoginView

+ (instancetype)accoutLoginView{
    return [self fsl_viewFromXib];
}

- (void)awakeFromNib{
    [super awakeFromNib];
    
    /// 限制密码位数 16
    [self.passwordTextField fsl_limitMaxLength:16];
    /// 限制QQ位数 11
    [self.accountTextField fsl_limitMaxLength:11];
}
@end
