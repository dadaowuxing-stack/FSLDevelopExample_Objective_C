//
//  FSLDiscoverViewModel.m
//  WeChat
//
//  Created by Fingal Liu on 2017/9/11.
//  Copyright © 2017年 Fingal Liu. All rights reserved.
//

#import "FSLDiscoverViewModel.h"
#import "FSLWebViewModel.h"
#import "FSLMomentViewModel.h"
@implementation FSLDiscoverViewModel

- (instancetype)initWithServices:(id<FSLViewModelServices>)services params:(NSDictionary *)params
{
    if (self = [super initWithServices:services params:params]) {
        /// 监听通知
        @weakify(self);
        [[FSLNotificationCenter rac_addObserverForName:FSLPlugSwitchValueDidChangedNotification object:nil] subscribeNext:^(id _) {
            @strongify(self);
            /// 配置数据
            [self _configureData];
        }];
    }
    return self;
}

- (void)initialize
{
    [super initialize];
    self.title = @"发现";
    /// 配置数据
    [self _configureData];
}
#pragma mark - 配置数据
- (void)_configureData{
    
    @weakify(self);
    
    /// 第一组
    FSLCommonGroupViewModel *group0 = [FSLCommonGroupViewModel groupViewModel];
    /// 盆友圈
    FSLCommonArrowItemViewModel *moment = [FSLCommonArrowItemViewModel itemViewModelWithTitle:@"朋友圈" icon:@"ff_IconShowAlbum_25x25"];
    moment.destViewModelClass = [FSLMomentViewModel class];
    group0.itemViewModels = @[moment];
    
    /// 第二组
    FSLCommonGroupViewModel *group1 = [FSLCommonGroupViewModel groupViewModel];
    /// 扫一扫
    FSLCommonArrowItemViewModel *qrCode = [FSLCommonArrowItemViewModel itemViewModelWithTitle:@"扫一扫" icon:@"ff_IconQRCode_25x25"];
    /// 摇一摇
    FSLCommonArrowItemViewModel *shake = [FSLCommonArrowItemViewModel itemViewModelWithTitle:@"摇一摇" icon:@"ff_IconShake_25x25"];
    group1.itemViewModels = @[qrCode , shake];
    
    /// 第三组
    FSLCommonGroupViewModel *group2 = [FSLCommonGroupViewModel groupViewModel];
    /// 附近的人
    FSLCommonArrowItemViewModel *locationService = [FSLCommonArrowItemViewModel itemViewModelWithTitle:@"附近的人" icon:@"ff_IconLocationService_25x25"];
    /// 漂流瓶
    FSLCommonArrowItemViewModel *bottle = [FSLCommonArrowItemViewModel itemViewModelWithTitle:@"漂流瓶" icon:@"ff_IconBottle_25x25"];
    group2.itemViewModels = @[locationService , bottle];
    
    /// 第四组
    FSLCommonGroupViewModel *group3 = [FSLCommonGroupViewModel groupViewModel];
    /// 购物
    FSLCommonArrowItemViewModel *shopping = [FSLCommonArrowItemViewModel itemViewModelWithTitle:@"购物" icon:@"CreditCard_ShoppingBag_25x25"];
    /// 游戏
    FSLCommonArrowItemViewModel *game = [FSLCommonArrowItemViewModel itemViewModelWithTitle:@"游戏" icon:@"MoreGame_25x25"];
    group3.itemViewModels = @[shopping , game];
    
    /// 第五组
    FSLCommonGroupViewModel *group4 = [FSLCommonGroupViewModel groupViewModel];
    /// 小程序
    FSLCommonArrowItemViewModel *moreApps = [FSLCommonArrowItemViewModel itemViewModelWithTitle:@"小程序" icon:@"MoreWeApp_25x25"];
    group4.itemViewModels = @[moreApps];
    
    /// 插件功能
    NSMutableArray *group5s = [NSMutableArray arrayWithCapacity:2];
    /// 看一看
    if ([FSLPreferenceSettingHelper boolForKey:FSLPreferenceSettingLook]) {
        FSLCommonArrowItemViewModel *look= [FSLCommonArrowItemViewModel itemViewModelWithTitle:@"看一看" icon:@"ff_IconBrowse1_25x25"];
        look.centerLeftViewName = [FSLPreferenceSettingHelper boolForKey:FSLPreferenceSettingLookArtboard]?@"Artboard23_38x18":nil;;
        [group5s addObject:look];
        @weakify(look);
        look.operation = ^{
            @strongify(self);
            @strongify(look);
            NSURL *url = [NSURL URLWithString:FSLMyBlogHomepageUrl];
            NSURLRequest *request = [NSURLRequest requestWithURL:url];
            FSLWebViewModel * webViewModel = [[FSLWebViewModel alloc] initWithServices:self.services params:@{FSLViewModelRequestKey:request}];
            /// 去掉关闭按钮
            webViewModel.shouldDisableWebViewClose = YES;
            [self.services pushViewModel:webViewModel animated:YES];
            
            if (look.centerLeftViewName) {
                look.centerLeftViewName = nil;
                [FSLPreferenceSettingHelper setBool:NO forKey:FSLPreferenceSettingLookArtboard];
                // “手动触发self.dataSource的KVO”，必写。
                [self willChangeValueForKey:@"dataSource"];
                // “手动触发self.now的KVO”，必写。
                [self didChangeValueForKey:@"dataSource"];
            }
        };
    }
    /// 搜一搜
    if ([FSLPreferenceSettingHelper boolForKey:FSLPreferenceSettingSearch]) {
        FSLCommonArrowItemViewModel *search = [FSLCommonArrowItemViewModel itemViewModelWithTitle:@"搜一搜" icon:@"ff_IconSearch1_25x25"];
        search.centerLeftViewName = [FSLPreferenceSettingHelper boolForKey:FSLPreferenceSettingSearchArtboard]?@"Artboard23_38x18":nil;
        [group5s addObject:search];
        @weakify(search);
        search.operation = ^{
            @strongify(self);
            @strongify(search);
            NSURL *url = [NSURL URLWithString:FSLMyBlogHomepageUrl];
            NSURLRequest *request = [NSURLRequest requestWithURL:url];
            FSLWebViewModel * webViewModel = [[FSLWebViewModel alloc] initWithServices:self.services params:@{FSLViewModelRequestKey:request}];
            /// 去掉关闭按钮
            webViewModel.shouldDisableWebViewClose = YES;
            [self.services pushViewModel:webViewModel animated:YES];
            
            if (search.centerLeftViewName) {
                search.centerLeftViewName = nil;
                [FSLPreferenceSettingHelper setBool:NO forKey:FSLPreferenceSettingSearchArtboard];
                // “手动触发self.dataSource的KVO”，必写。
                [self willChangeValueForKey:@"dataSource"];
                // “手动触发self.now的KVO”，必写。
                [self didChangeValueForKey:@"dataSource"];
            }
        };
    }
    
    
    
    if (group5s.count>0) {
        FSLCommonGroupViewModel *group5 = [FSLCommonGroupViewModel groupViewModel];
        group5.itemViewModels = [group5s copy];
        self.dataSource = @[group0 , group1 ,group5 , group2 , group3 , group4];
    }else{
        self.dataSource = @[group0 , group1 , group2 , group3 , group4];
    }
}
@end
