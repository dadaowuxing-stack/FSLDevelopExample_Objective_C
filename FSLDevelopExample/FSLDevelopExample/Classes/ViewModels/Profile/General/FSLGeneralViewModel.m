//
//  FSLGeneralViewModel.m
//  WeChat
//
//  Created by senba on 2017/12/19.
//  Copyright © 2017年 Fingal Liu. All rights reserved.
//

#import "FSLGeneralViewModel.h"
#import "FSLCommonSwitchItemViewModel.h"
#import "FSLCommonArrowItemViewModel.h"

@interface FSLGeneralViewModel ()
/// 清除聊天记录de的命令
@property (nonatomic, readwrite, strong) RACCommand *clearChatRecordsCommand;
@end


@implementation FSLGeneralViewModel
- (void)initialize{
    [super initialize];
    @weakify(self);
    self.title = @"通用";
    self.style = UITableViewStyleGrouped;
    
    /// 第一组
    FSLCommonGroupViewModel *group0 = [FSLCommonGroupViewModel groupViewModel];
    /// 多语言
    FSLCommonArrowItemViewModel * language = [FSLCommonArrowItemViewModel itemViewModelWithTitle:@"多语言"];
    language.operation = ^{
        @strongify(self);
        
    };
    group0.itemViewModels = @[language];
    
    
    /// 第二组
    FSLCommonGroupViewModel *group1 = [FSLCommonGroupViewModel groupViewModel];
    /// 字体大小
    FSLCommonArrowItemViewModel * fontSize = [FSLCommonArrowItemViewModel itemViewModelWithTitle:@"字体大小"];
    fontSize.operation = ^{
        @strongify(self);
        
    };
    /// 聊天背景
    FSLCommonArrowItemViewModel * chatBg = [FSLCommonArrowItemViewModel itemViewModelWithTitle:@"聊天背景"];
    /// 我的表情
    FSLCommonArrowItemViewModel * myEmotion = [FSLCommonArrowItemViewModel itemViewModelWithTitle:@"我的表情"];
    /// 照片、视频和文件
    FSLCommonArrowItemViewModel * resource = [FSLCommonArrowItemViewModel itemViewModelWithTitle:@"照片、视频和文件"];
    group1.itemViewModels = @[fontSize , chatBg , myEmotion , resource];
    
    
    /// 第三组
    FSLCommonGroupViewModel *group2 = [FSLCommonGroupViewModel groupViewModel];
    /// 听筒模式
    FSLCommonSwitchItemViewModel *receiverMode = [FSLCommonSwitchItemViewModel itemViewModelWithTitle:@"听筒模式"];
    receiverMode.key = FSLPreferenceSettingReceiverMode;
    receiverMode.selectionStyle = UITableViewCellSelectionStyleNone;
    group2.itemViewModels = @[receiverMode];
    
    
    /// 第四组
    FSLCommonGroupViewModel *group3 = [FSLCommonGroupViewModel groupViewModel];
    /// 功能
    FSLCommonArrowItemViewModel * func = [FSLCommonArrowItemViewModel itemViewModelWithTitle:@"功能"];
    group3.itemViewModels = @[ func ];
    
    
    /// 第五组
    FSLCommonGroupViewModel *group4 = [FSLCommonGroupViewModel groupViewModel];
    /// chatRecord 聊天记录
    FSLCommonArrowItemViewModel * chatRecord = [FSLCommonArrowItemViewModel itemViewModelWithTitle:@"聊天记录"];
    /// 存储空间
    FSLCommonArrowItemViewModel * storageSpace = [FSLCommonArrowItemViewModel itemViewModelWithTitle:@"存储空间"];
    group4.itemViewModels = @[ chatRecord , storageSpace ];
    
    /// 数据源
    self.dataSource = @[group0 , group1 , group2 , group3 , group4];
    
    
    self.clearChatRecordsCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self);
        /// 模拟清除聊天记录的过程
        NSLog(@"-- 清除聊天记录 --");
        
        return [RACSignal empty];
    }];
}
@end
