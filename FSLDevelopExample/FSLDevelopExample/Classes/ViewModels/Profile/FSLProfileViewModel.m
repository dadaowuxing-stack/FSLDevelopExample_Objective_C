//
//  FSLProfileViewModel.m
//  WeChat
//
//  Created by senba on 2017/9/11.
//  Copyright © 2017年 Fingal Liu. All rights reserved.
//

#import "FSLProfileViewModel.h"
#import "FSLUserInfoViewModel.h"
#import "FSLSettingViewModel.h"
#import "FSLEmotionViewModel.h"

#if defined(DEBUG)||defined(_DEBUG)
/// PS：调试模式，这里在ViewModel中引用了UIKite的东西， 但是release模式下无效，这里只是用作测试而已
#import "FSLDebugTouchView.h"
#endif

@interface FSLProfileViewModel()
/// The current `user`.
@property (nonatomic, readwrite , strong) FSLUser *user;

@end


@implementation FSLProfileViewModel

- (instancetype)initWithServices:(id<FSLViewModelServices>)services params:(NSDictionary *)params{
    if (self = [super initWithServices:services params:params]) {
        /// 获取user
        self.user = [self.services.client currentUser];
    }
    return self;
}


- (void)initialize
{
    [super initialize];
    @weakify(self);
    self.title = @"我";
    
    /// 获取网络数据+本地数据
    RACSignal *fetchLocalDataSignal = [RACSignal return:[self fetchLocalData]];
    RACSignal *requestRemoteDataSignal = self.requestRemoteDataCommand.executionSignals.switchToLatest;
    [[[fetchLocalDataSignal
       merge:requestRemoteDataSignal]
      deliverOnMainThread]
     subscribeNext:^(FSLUser *user) {
         @strongify(self)
         [self willChangeValueForKey:@"user"];
         /// user模型的数据 重置，但是user的 指针地址不变
         [self.user mergeValuesForKeysFromModel:user];
         [self didChangeValueForKey:@"user"];
     }];
    
    /// 配置数据
    [self _configureData];

}

/// 获取本地的用户数据
- (FSLUser *)fetchLocalData{
    return [[self.services client] currentUser];
}
/// 回去网络的用户数据 用于比对
- (RACSignal *)requestRemoteDataSignalWithPage:(NSUInteger)page
{
    return [RACSignal empty];
}


#pragma mark - 配置数据
- (void)_configureData{
    
    /// 第一组
    FSLCommonGroupViewModel *group0 = [FSLCommonGroupViewModel groupViewModel];
    /// 用户信息
    FSLCommonProfileHeaderItemViewModel *profileHeader = [[FSLCommonProfileHeaderItemViewModel alloc] initViewModelWithUser:self.user];
    /// 由于涉及到 更新用户的数据，这里最后把用户数据传递过去
//    profileHeader.destViewModelClass = [FSLUserInfoViewModel class];
    @weakify(self);
    profileHeader.operation = ^{
        @strongify(self);
        FSLUserInfoViewModel *viewModel = [[FSLUserInfoViewModel alloc] initWithServices:self.services params:@{FSLViewModelUtilKey:self.user}];
        [self.services pushViewModel:viewModel animated:YES];
        
    };
    profileHeader.rowHeight = 88.0f;
    group0.itemViewModels = @[profileHeader];
    
    /// 第一组
    FSLCommonGroupViewModel *group1 = [FSLCommonGroupViewModel groupViewModel];
    /// 钱包
    FSLCommonArrowItemViewModel *wallet = [FSLCommonArrowItemViewModel itemViewModelWithTitle:@"钱包" icon:@"MoreMyBankCard_25x25"];
    /// 设置组头高度
    group1.itemViewModels = @[wallet];
    
    /// 第二组
    FSLCommonGroupViewModel *group2 = [FSLCommonGroupViewModel groupViewModel];
    /// 收藏
    FSLCommonArrowItemViewModel *collect = [FSLCommonArrowItemViewModel itemViewModelWithTitle:@"收藏" icon:@"MoreMyFavorites_25x25"];
    /// 相册
    FSLCommonArrowItemViewModel *album = [FSLCommonArrowItemViewModel itemViewModelWithTitle:@"相册" icon:@"MoreMyAlbum_25x25"];
    /// 卡包
    FSLCommonArrowItemViewModel *cardPackage = [FSLCommonArrowItemViewModel itemViewModelWithTitle:@"卡包" icon:@"MyCardPackageIcon_25x25"];
    /// 表情
    FSLCommonArrowItemViewModel *expression = [FSLCommonArrowItemViewModel itemViewModelWithTitle:@"表情" icon:@"MoreExpressionShops_25x25"];
    expression.destViewModelClass = [FSLEmotionViewModel class];
    group2.itemViewModels = @[collect, album, cardPackage,expression];
    
    /// 第三组
    FSLCommonGroupViewModel *group3 = [FSLCommonGroupViewModel groupViewModel];
    /// 设置
    FSLCommonArrowItemViewModel *setting = [FSLCommonArrowItemViewModel itemViewModelWithTitle:@"设置" icon:@"MoreSetting_25x25"];
    setting.destViewModelClass = [FSLSettingViewModel class];
    
#if defined(DEBUG)||defined(_DEBUG)
    /// 调试模式
    FSLCommonArrowItemViewModel *debug = [FSLCommonArrowItemViewModel itemViewModelWithTitle:@"打开/关闭调试器" icon:@"FSL_profile_debug_25x25"];
    debug.operation = ^{
        [[FSLDebugTouchView sharedInstance] setHide:![FSLDebugTouchView sharedInstance].isHide];
        [FSLSharedAppDelegate.window bringSubviewToFront:[FSLDebugTouchView sharedInstance]];
    };
    group3.itemViewModels = @[setting , debug];
#else
    /// 发布模式
    group3.itemViewModels = @[setting];
#endif
    self.dataSource = @[group0 , group1 , group2 , group3];
}
@end
