//
//  FSLAboutUsViewModel.m
//  WeChat
//
//  Created by senba on 2017/12/13.
//  Copyright © 2017年 Fingal Liu. All rights reserved.
//

#import "FSLAboutUsViewModel.h"
#import "FSLCommonArrowItemViewModel.h"
#import "FSLWebViewModel.h"
@interface FSLAboutUsViewModel ()
/// 软件许可
@property (nonatomic, readwrite, strong) RACCommand *softLicenseCommand;
/// 隐私保护
@property (nonatomic, readwrite, strong) RACCommand *privateGuardCommand;
@end

@implementation FSLAboutUsViewModel

- (void)initialize{
    [super initialize];
    @weakify(self);
    
    /// 统一操作
    void (^operation)(void) = ^{
        @strongify(self);
        NSURL *url = [NSURL URLWithString:FSLMyBlogHomepageUrl];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        FSLWebViewModel * viewModel = [[FSLWebViewModel alloc] initWithServices:self.services params:@{FSLViewModelRequestKey:request}];
        /// 去掉关闭按钮
        viewModel.shouldDisableWebViewClose = YES;
        [self.services pushViewModel:viewModel animated:YES];
    };
    
    
    /// 第三组
    FSLCommonGroupViewModel *group0 = [FSLCommonGroupViewModel groupViewModel];
    /// 去评分
    FSLCommonArrowItemViewModel * score = [FSLCommonArrowItemViewModel itemViewModelWithTitle:@"去评分"];
    score.operation = operation;
    /// 功能介绍
    FSLCommonArrowItemViewModel * functionIntroduce = [FSLCommonArrowItemViewModel itemViewModelWithTitle:@"功能介绍"];
    functionIntroduce.operation = operation;
    /// 投诉
    FSLCommonArrowItemViewModel * complain = [FSLCommonArrowItemViewModel itemViewModelWithTitle:@"投诉"];
    complain.operation = operation;
    group0.itemViewModels = @[score , functionIntroduce , complain];
    
    self.dataSource = @[group0];
    
    
    /// 初始化一些命令
    self.softLicenseCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self);
        NSURL *url = [NSURL URLWithString:FSLMyBlogHomepageUrl];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        FSLWebViewModel * viewModel = [[FSLWebViewModel alloc] initWithServices:self.services params:@{FSLViewModelRequestKey:request}];
        /// 去掉关闭按钮
        viewModel.shouldDisableWebViewClose = YES;
        [self.services pushViewModel:viewModel animated:YES];
        
        return [RACSignal empty];
    }];
    
    self.privateGuardCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self);
        NSURL *url = [NSURL URLWithString:FSLMyBlogHomepageUrl];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        FSLWebViewModel * viewModel = [[FSLWebViewModel alloc] initWithServices:self.services params:@{FSLViewModelRequestKey:request}];
        /// 去掉关闭按钮
        viewModel.shouldDisableWebViewClose = YES;
        [self.services pushViewModel:viewModel animated:YES];
        return [RACSignal empty];
    }];
}

@end
