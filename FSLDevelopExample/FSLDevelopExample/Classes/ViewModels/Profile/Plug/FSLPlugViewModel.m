//
//  FSLPlugViewModel.m
//  WeChat
//
//  Created by Fingal Liu on 2017/10/15.
//  Copyright © 2017年 Fingal Liu. All rights reserved.
//

#import "FSLPlugViewModel.h"
#import "FSLPlugDetailViewModel.h"
#import "FSLWebViewModel.h"
@interface FSLPlugViewModel ()
/// plugDetailCommand
@property (nonatomic, readwrite, strong) RACCommand *plugDetailCommand;
/// 使用协议cmd
@property (nonatomic, readwrite, strong) RACCommand *useIntroCommand;
@end

@implementation FSLPlugViewModel
- (void)initialize{
    [super initialize];
    @weakify(self);
    self.title = @"插件";
    /// 去掉导航栏的细线
    self.prefersNavigationBarBottomLineHidden = YES;
    
    self.useIntroCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self);
        NSURL *url = [NSURL URLWithString:FSLMyBlogHomepageUrl];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        FSLWebViewModel * webViewModel = [[FSLWebViewModel alloc] initWithServices:self.services params:@{FSLViewModelRequestKey:request}];
        /// 去掉关闭按钮
        webViewModel.shouldDisableWebViewClose = YES;
        [self.services pushViewModel:webViewModel animated:YES];
        return [RACSignal empty];
    }];
    
    self.plugDetailCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self);
        FSLPlugDetailViewModel *viewModel = [[FSLPlugDetailViewModel alloc] initWithServices:self.services params:@{FSLViewModelIDKey:input}];
        [self.services pushViewModel:viewModel animated:YES];
        return [RACSignal empty];
    }];
}
@end
