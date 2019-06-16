//
//  FSLFeatureSignatureViewModel.m
//  WeChat
//
//  Created by senba on 2017/9/21.
//  Copyright © 2017年 Fingal Liu. All rights reserved.
//

#import "FSLFeatureSignatureViewModel.h"

@interface FSLFeatureSignatureViewModel ()
/// 取消的命令
@property (nonatomic, readwrite, strong) RACCommand *cancelCommand;
/// completeCommand
@property (nonatomic, readwrite, strong) RACCommand *completeCommand;
/// 完成按钮有效性
@property (nonatomic, readwrite, strong) RACSignal *validCompleteSignal;
@end

@implementation FSLFeatureSignatureViewModel
- (instancetype)initWithServices:(id<FSLViewModelServices>)services params:(NSDictionary *)params{
    if (self = [super initWithServices:services params:params]) {
        /// 获取
        self.text = params[FSLViewModelUtilKey];
    }
    return self;
}
- (void)initialize{
    [super initialize];
    
    self.title = @"设置个性签名";
    
    /// 去掉键盘管理
    self.keyboardEnable = NO;
    self.shouldResignOnTouchOutside = NO;
    
    self.validCompleteSignal = [RACObserve(self, text) map:^id(NSString *text) {
        return @(text.length>0 && ![text isEqualToString:self.params[FSLViewModelUtilKey]]);
    }];
    
    @weakify(self);
    self.cancelCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self);
        [self.services dismissViewModelAnimated:YES completion:NULL];
        return [RACSignal empty];
    }];
    
    self.completeCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self);
        /// 回调数据
        !self.callback?:self.callback(self.text);
        [self.services dismissViewModelAnimated:YES completion:NULL];
        return [RACSignal empty];
    }];
}
@end
