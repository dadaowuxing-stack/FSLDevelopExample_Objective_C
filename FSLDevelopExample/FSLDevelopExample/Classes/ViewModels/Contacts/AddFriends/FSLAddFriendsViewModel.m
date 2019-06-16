//
//  FSLAddFriendsViewModel.m
//  WeChat
//
//  Created by senba on 2017/9/22.
//  Copyright © 2017年 Fingal Liu. All rights reserved.
//  添加好友

#import "FSLAddFriendsViewModel.h"
#import "FSLCommonArrowItemViewModel.h"
#import "FSLSearchFriendsViewModel.h"
@interface FSLAddFriendsViewModel ()
/// headerViewModel
@property (nonatomic, readwrite, strong) FSLSearchFriendsHeaderViewModel *headerViewModel;
@end


@implementation FSLAddFriendsViewModel
- (void)initialize{
    [super initialize];
    
    self.title = @"添加朋友";
    
    /// 配置HeaderView
    self.headerViewModel = [[FSLSearchFriendsHeaderViewModel alloc] initWithUser:self.services.client.currentUser];
    
    @weakify(self);
    self.headerViewModel.searchCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self);
        FSLSearchFriendsViewModel *viewModel = [[FSLSearchFriendsViewModel alloc] initWithServices:self.services params:nil];
        [self.services presentViewModel:viewModel animated:NO completion:NULL];
        return [RACSignal empty];
    }];
    
    
    
    
    
    
    /// 第一组
    FSLCommonGroupViewModel *group0 = [FSLCommonGroupViewModel groupViewModel];
    group0.headerHeight = 25.0f;
    /// 雷达加朋友
    FSLCommonArrowItemViewModel *reda = [FSLCommonArrowItemViewModel itemViewModelWithTitle:@"雷达加朋友" icon:@"add_friend_icon_reda_36x36"];
    reda.subtitle = @"添加身边的朋友";
    
    /// 面对面建群
    FSLCommonArrowItemViewModel *group = [FSLCommonArrowItemViewModel itemViewModelWithTitle:@"面对面建群" icon:@"add_friend_icon_addgroup_36x36"];
    group.subtitle = @"与身边的朋友进入同一个群聊";
    
    /// 扫一扫
    FSLCommonArrowItemViewModel *scan = [FSLCommonArrowItemViewModel itemViewModelWithTitle:@"扫一扫" icon:@"add_friend_icon_scanqr_36x36"];
    scan.subtitle = @"扫描二维码名片";
    
    /// 手机联系人
    FSLCommonArrowItemViewModel *contacts = [FSLCommonArrowItemViewModel itemViewModelWithTitle:@"手机联系人" icon:@"add_friend_icon_contacts_36x36"];
    contacts.subtitle = @"添加通讯录中的朋友";
    
    /// 公众号
    FSLCommonArrowItemViewModel *official = [FSLCommonArrowItemViewModel itemViewModelWithTitle:@"公众号" icon:@"add_friend_icon_offical_36x36"];
    official.subtitle = @"获取更多资讯和服务";
    
    /// 设置cell的高度
    reda.rowHeight = group.rowHeight = scan.rowHeight = contacts.rowHeight = official.rowHeight = 60.0f;
    
    /// 更多
    group0.itemViewModels = @[reda , group , scan , contacts, official];
    self.dataSource = @[group0];
}
@end
