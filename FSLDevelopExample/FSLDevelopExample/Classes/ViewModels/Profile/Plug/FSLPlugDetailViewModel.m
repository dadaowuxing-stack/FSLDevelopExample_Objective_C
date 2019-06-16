//
//  FSLPlugDetailViewModel.m
//  WeChat
//
//  Created by senba on 2017/10/16.
//  Copyright © 2017年 Fingal Liu. All rights reserved.
//

#import "FSLPlugDetailViewModel.h"
#import "FSLWebViewModel.h"
@interface FSLPlugDetailViewModel ()
/// type
@property (nonatomic, readwrite, assign) FSLPlugDetailType type;

/// feedbackCommand
@property (nonatomic, readwrite, strong) RACCommand *feedbackCommand;
@end

@implementation FSLPlugDetailViewModel
- (instancetype)initWithServices:(id<FSLViewModelServices>)services params:(NSDictionary *)params{
    if (self = [super initWithServices:services params:params]) {
        /// 获取user
        self.type = [params[FSLViewModelIDKey] integerValue];
        
    }
    return self;
}

- (void)initialize{
    [super initialize];
    
    @weakify(self);
    self.title = nil;
    /// 去掉导航栏的细线
    self.prefersNavigationBarBottomLineHidden = YES;
    
    self.feedbackCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self);
        NSURL *url = [NSURL URLWithString:FSLMyBlogHomepageUrl];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        FSLWebViewModel * webViewModel = [[FSLWebViewModel alloc] initWithServices:self.services params:@{FSLViewModelRequestKey:request}];
        /// 去掉关闭按钮
        webViewModel.shouldDisableWebViewClose = YES;
        [self.services pushViewModel:webViewModel animated:YES];
        return [RACSignal empty];
    }];
}
@end
