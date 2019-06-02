//
//  FSLMobileLoginView.m
//  WeChat
//
//  Created by senba on 2017/9/27.
//  Copyright © 2017年 CoderMikeHe. All rights reserved.
//

#import "FSLMobileLoginView.h"
#import "FSLLoginViewModel.h"

@interface FSLMobileLoginView ()
/// zoneNameBtn
@property (weak, nonatomic) IBOutlet UIButton *zoneNameBtn;
/// viewModel
@property (nonatomic, readwrite, strong) FSLLoginViewModel *viewModel;
@end

@implementation FSLMobileLoginView

+ (instancetype)mobileLoginView{
    return [self fsl_viewFromXib];
}

- (void)awakeFromNib{
    [super awakeFromNib];
    
    /// 限制电话号码位数 13 （两个空格）
    [self.phoneTextField fsl_limitMaxLength:13];
    /// 限制区域编码 4
    [self.zoneCodeTextField fsl_limitMaxLength:4];
    
    /// 添加左侧 leftView
    UILabel *leftView = [UILabel fsl_labelWithText:@"+" font:FSLMediumFont(17.0f) textColor:[UIColor blackColor]];
    [leftView sizeToFit];
    self.zoneCodeTextField.leftView = leftView;
    self.zoneCodeTextField.leftViewMode = UITextFieldViewModeAlways;
    self.zoneCodeTextField.text = @"86";
    /// 事件处理
    @weakify(self);
    [[self.zoneNameBtn rac_signalForControlEvents:UIControlEventTouchUpInside]
     subscribeNext:^(UIButton *sender) {
         @strongify(self);
         [self.viewModel.selelctZoneComand execute:nil];
     }];
}

#pragma mark - Public Method
- (void)bindViewModel:(FSLLoginViewModel *)viewModel{
    self.viewModel = viewModel;
    
    
}
@end
