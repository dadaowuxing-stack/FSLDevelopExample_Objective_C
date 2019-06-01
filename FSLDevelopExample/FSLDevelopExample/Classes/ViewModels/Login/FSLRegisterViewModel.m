//
//  FSLRegisterViewModel.m
//  WeChat
//
//  Created by senba on 2017/10/12.
//  Copyright © 2017年 CoderMikeHe. All rights reserved.
//

#import "FSLRegisterViewModel.h"
#import "FSLZoneCodeViewModel.h"
#import "FSLCommitViewModel.h"
@interface FSLRegisterViewModel ()
/// closeCommand
@property (nonatomic, readwrite, strong) RACCommand *closeCommand;
/// registerCommand
@property (nonatomic, readwrite, strong) RACCommand *registerCommand;
/// selelctZoneComand
@property (nonatomic, readwrite, strong) RACCommand *selelctZoneComand;
/// 验证码命令
@property (nonatomic, readwrite, strong) RACCommand *captchaCommand;
/// 注册按钮有效性
@property (nonatomic, readwrite, strong) RACSignal *validRegisterSignal;
/// error （PS；这个记录请求过程中的发生的错误，请求之前必须置nil）
@property (nonatomic, readwrite, strong) NSError *error;
@end


@implementation FSLRegisterViewModel
- (void)initialize{
    [super initialize];
    
    @weakify(self);
    self.closeCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self);
        [self.services dismissViewModelAnimated:YES completion:NULL];
        return [RACSignal empty];
    }];
    
    self.selelctZoneComand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self);
        FSLZoneCodeViewModel *viewModel = [[FSLZoneCodeViewModel alloc] initWithServices:self.services params:nil];
        [self.services presentViewModel:viewModel animated:YES completion:NULL];
        return [RACSignal empty];
    }];
    
    
    /// 按钮的有效性
    self.validRegisterSignal = [[RACSignal
                              combineLatest:@[RACObserve(self, zoneCode),RACObserve(self, phone)]
                              reduce:^(NSString *zoneCode , NSString *phone) {
                                  return @(zoneCode.length>0 && phone.length>0);
                              }]
                             distinctUntilChanged];
    
    /// 获取验证码命令
    self.captchaCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self);
        /// 将错误置为nil
        self.error = nil;
        return [[[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [subscriber sendNext:nil];
                [subscriber sendCompleted];
            });
            return [RACDisposable disposableWithBlock:^{
            }];
        }] doNext:^(id x) {
            @strongify(self);
            /// 跳转到提交手机号的界面
            FSLCommitViewModel *viewModel = [[FSLCommitViewModel alloc] initWithServices:self.services params:@{FSLMobileLoginPhoneKey:self.phone, FSLMobileLoginZoneCodeKey:self.zoneCode}];
            [self.services presentViewModel:viewModel animated:YES completion:NULL];
            
        }] doError:^(NSError *error) {
            @strongify(self);
            self.error = error;
        }];
    }];
}

@end
