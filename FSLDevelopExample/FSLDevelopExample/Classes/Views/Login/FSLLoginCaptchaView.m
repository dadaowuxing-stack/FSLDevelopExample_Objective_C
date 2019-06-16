//
//  FSLLoginCaptchaView.m
//  WeChat
//
//  Created by senba on 2017/9/25.
//  Copyright © 2017年 Fingal Liu. All rights reserved.
//

#import "FSLLoginCaptchaView.h"

@implementation FSLLoginCaptchaView

+ (instancetype)captchaView{
    return [self fsl_viewFromXib];
}

- (void)awakeFromNib{
    [super awakeFromNib];
    @weakify(self);
    /// 限制验证码位数 6
    [self.captchaTextField fsl_limitMaxLength:6];
    
    /// 监听获取按钮的enable属性
    [[RACObserve(self.captchaBtn, enabled) skip:1] subscribeNext:^(NSNumber * enabled) {
        @strongify(self);
        self.captchaBtn.layer.borderColor = enabled.boolValue?FSLColorFromHexString(@"#353535").CGColor:FSLColorFromHexString(@"#C8C8C8").CGColor;
    }];
    
}
@end
