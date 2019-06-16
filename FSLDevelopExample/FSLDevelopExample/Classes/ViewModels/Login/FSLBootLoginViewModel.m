//
//  FSLBootLoginViewModel.m
//  WeChat
//
//  Created by Fingal Liu on 2017/9/26.
//  Copyright © 2017年 Fingal Liu. All rights reserved.
//

#import "FSLBootLoginViewModel.h"
#import "FSLLoginViewModel.h"
#import "FSLRegisterViewModel.h"
#import "FSLLanguageViewModel.h"

@interface FSLBootLoginViewModel ()
/// loginCommand
@property (nonatomic, readwrite, strong) RACCommand *loginCommand;
/// registerCommand
@property (nonatomic, readwrite, strong) RACCommand *registerCommand;
/// languageCommand
@property (nonatomic, readwrite, strong) RACCommand *languageCommand;

/// language
@property (nonatomic, readwrite, copy) NSString *language;
/// languageIdstr
@property (nonatomic, readwrite, copy) NSString *languageIdstr;
@end

@implementation FSLBootLoginViewModel

- (void)initialize{
    [super initialize];
    /// 隐藏导航条
    self.prefersNavigationBarHidden = YES;
    
    /// 先从偏好设置里面取出languageIdstr
    NSString *language = [FSLPreferenceSettingHelper objectForKey:FSLPreferenceSettingLanguage];
    if (language) {
        NSArray *array = [language componentsSeparatedByString:@"-"];
        self.language = array.firstObject;
        self.languageIdstr = array.lastObject;
    }else{
        self.language = @"简体中文";
        self.languageIdstr = @"1000";
    }
    
    
    @weakify(self);
    self.loginCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self);
        FSLLoginViewModel *viewModel = [[FSLLoginViewModel alloc] initWithServices:self.services params:nil];
        [self.services presentViewModel:viewModel animated:YES completion:NULL];
        return [RACSignal empty];
    }];
    
    self.registerCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self);
        FSLRegisterViewModel *viewModel = [[FSLRegisterViewModel alloc] initWithServices:self.services params:nil];
        [self.services presentViewModel:viewModel animated:YES completion:NULL];
        return [RACSignal empty];
    }];
    
    self.languageCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self);
        FSLLanguageViewModel *viewModel = [[FSLLanguageViewModel alloc] initWithServices:self.services params:@{FSLViewModelIDKey:self.languageIdstr}];
        [self.services presentViewModel:viewModel animated:YES completion:NULL];
        
        /// 回调
        viewModel.callback = ^(FSLLanguageItemViewModel * itemViewModel) {
            @strongify(self);
            self.language = itemViewModel.title;
            self.languageIdstr = itemViewModel.idstr;
            /// 存储到偏好设置
            [FSLPreferenceSettingHelper setObject:[NSString stringWithFormat:@"%@-%@",self.language , self.languageIdstr] forKey:FSLPreferenceSettingLanguage];
        };
        
        return [RACSignal empty];
    }];
}

@end
