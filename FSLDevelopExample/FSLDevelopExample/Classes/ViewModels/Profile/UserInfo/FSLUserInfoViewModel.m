//
//  FSLUserInfoViewModel.m
//  WeChat
//
//  Created by senba on 2017/9/21.
//  Copyright © 2017年 Fingal Liu. All rights reserved.
//

#import "FSLUserInfoViewModel.h"
#import "FSLCommonAvatarItemViewModel.h"
#import "FSLCommonLabelItemViewModel.h"
#import "FSLCommonQRCodeItemViewModel.h"
#import "FSLMoreInfoViewModel.h"
#import "FSLModifyNicknameViewModel.h"
@interface FSLUserInfoViewModel ()
/// The current `user`.
@property (nonatomic, readwrite , strong) FSLUser *user;
@end

@implementation FSLUserInfoViewModel

- (instancetype)initWithServices:(id<FSLViewModelServices>)services params:(NSDictionary *)params{
    if (self = [super initWithServices:services params:params]) {
        /// 获取user
        self.user = params[FSLViewModelUtilKey];
    }
    return self;
}

- (void)initialize{
    [super initialize];
    @weakify(self);
    self.title = @"个人信息";
    
    /// 第一组
    FSLCommonGroupViewModel *group0 = [FSLCommonGroupViewModel groupViewModel];
    /// 头像
    FSLCommonAvatarItemViewModel *avatar = [FSLCommonAvatarItemViewModel itemViewModelWithTitle:@"头像"];
    avatar.avatar = self.user.profileImageUrl.absoluteString;
    avatar.rowHeight = 83.0f;
    
    /// 名字
    FSLCommonArrowItemViewModel *nickname = [FSLCommonArrowItemViewModel itemViewModelWithTitle:@"名字"];
    nickname.subtitle = self.user.screenName;
    @weakify(nickname);
    nickname.operation = ^{
        @strongify(self);
        @strongify(nickname);
        NSString *value = FSLStringIsNotEmpty(self.user.screenName)?self.user.screenName:@"";
        FSLModifyNicknameViewModel *viewModel = [[FSLModifyNicknameViewModel alloc] initWithServices:self.services params:@{FSLViewModelUtilKey:value}];
        [self.services presentViewModel:viewModel animated:YES completion:NULL];
        
        /// 设置block
        @weakify(self);
        @weakify(nickname);
        viewModel.callback = ^(NSString *screenName) {
            @strongify(self);
            @strongify(nickname);
            self.user.screenName = screenName;
            [[self.services client] saveUser:self.user];
            nickname.subtitle = screenName;
            
            // “手动触发self.dataSource的KVO”，必写。
            [self willChangeValueForKey:@"dataSource"];
            // “手动触发self.now的KVO”，必写。
            [self didChangeValueForKey:@"dataSource"];
        };
    };
    
    /// 微信号
    FSLCommonItemViewModel *wechatId = [FSLCommonItemViewModel itemViewModelWithTitle:@"微信号"];
    wechatId.selectionStyle = UITableViewCellSelectionStyleNone;
    wechatId.subtitle = self.user.wechatId;
    
    /// 二维码
    FSLCommonQRCodeItemViewModel *qrCode = [FSLCommonQRCodeItemViewModel itemViewModelWithTitle:@"我的二维码"];
    
    /// 更多
    FSLCommonArrowItemViewModel *moreInfo = [FSLCommonArrowItemViewModel itemViewModelWithTitle:@"更多"];
    /// 将用户数据 传递过去
    moreInfo.destViewModelClass = [FSLMoreInfoViewModel class];
    
    
    
    group0.itemViewModels = @[avatar , nickname , wechatId , qrCode , moreInfo];
    
    /// 第二组
    FSLCommonGroupViewModel *group1 = [FSLCommonGroupViewModel groupViewModel];
    /// 我的地址
    FSLCommonArrowItemViewModel *address = [FSLCommonArrowItemViewModel itemViewModelWithTitle:@"我的地址"];
    group1.itemViewModels = @[address];
    
    self.dataSource = @[group0 , group1];
}

@end
