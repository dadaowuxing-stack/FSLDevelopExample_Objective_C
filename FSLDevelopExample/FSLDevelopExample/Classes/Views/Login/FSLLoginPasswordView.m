//
//  FSLLoginPasswordView.m
//  WeChat
//
//  Created by senba on 2017/9/25.
//  Copyright © 2017年 CoderMikeHe. All rights reserved.
//

#import "FSLLoginPasswordView.h"

@implementation FSLLoginPasswordView

+ (instancetype)passwordView{
    return [self fsl_viewFromXib];
}

- (void)awakeFromNib{
    [super awakeFromNib];
    
    /// 限制密码位数 16
    [self.passwordTextField fsl_limitMaxLength:16];
}
@end
