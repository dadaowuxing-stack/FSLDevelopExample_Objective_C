//
//  FSLFreeInterruptionViewModel.m
//  WeChat
//
//  Created by senba on 2017/12/11.
//  Copyright © 2017年 Fingal Liu. All rights reserved.
//

#import "FSLFreeInterruptionViewModel.h"

@interface FSLFreeInterruptionViewModel ()
/// 选中的ViewModel
@property (nonatomic, readwrite, strong) FSLFreeInterruptionItemViewModel *selectedItemViewModel;
/// footer
@property (nonatomic, readwrite, copy) NSString *footer;
/// closeCommand
@property (nonatomic, readwrite, strong) RACCommand *closeCommand;
/// 完成命令
@property (nonatomic, readwrite, strong) RACCommand *completeCommand;
@end

@implementation FSLFreeInterruptionViewModel

- (void)initialize{
    [super initialize];
    @weakify(self);
    self.title = @"设置消息免打扰";
    self.closeCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self);
        [self.services dismissViewModelAnimated:YES completion:NULL];
        return [RACSignal empty];
    }];
    
    self.didSelectCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(NSIndexPath * indexPath) {
        @strongify(self);
        /// 三部曲
        self.selectedItemViewModel.selected = NO;
        FSLFreeInterruptionItemViewModel *itemViewModel = self.dataSource[indexPath.row];
        itemViewModel.selected = YES;
        self.selectedItemViewModel = itemViewModel;
        
        // “手动触发self.dataSource的KVO”，必写。
        [self willChangeValueForKey:@"dataSource"];
        // “手动触发self.now的KVO”，必写。
        [self didChangeValueForKey:@"dataSource"];
        
        return [RACSignal empty];
    }];
    
    /// 完成cmd
    self.completeCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id _) {
        @strongify(self);
        /// 记录数据
        [FSLPreferenceSettingHelper setObject:self.selectedItemViewModel.idstr forKey:FSLPreferenceSettingMessageFreeInterruption];
        /// 退出界面
        [self.services dismissViewModelAnimated:YES completion:NULL];
        return [RACSignal empty];
    }];
    
    
    /// 初始化数据
    [self _configureData];
}

- (void)_configureData{
    self.footer = @"开启后，“QQ邮箱提醒”在收到邮件后，手机不会震动与发出提示音。如果设置为“只在夜间开启”，则只在22：00到8:00间生效。";
    NSArray *titles = @[@"开启",@"只在夜间开启",@"关闭"];
    NSMutableArray *dataSource = [NSMutableArray arrayWithCapacity:titles.count];
    
    /// 取出缓存数据
    NSString *idstr = [FSLPreferenceSettingHelper objectForKey:FSLPreferenceSettingMessageFreeInterruption];
    /// 默认值
    if (!FSLStringIsNotEmpty(idstr)) { idstr = @"1000"; }
    
    for (NSInteger i = 1000; i<(titles.count + 1000); i++) {
        FSLFreeInterruptionItemViewModel *itemViewModel = [FSLFreeInterruptionItemViewModel itemViewModelWithIdstr:[NSString stringWithFormat:@"%zd",i] title:titles[i-1000]];
        if ([itemViewModel.idstr isEqualToString:idstr]) {
            itemViewModel.selected = YES;
            self.selectedItemViewModel = itemViewModel;
        }
        [dataSource addObject:itemViewModel];
    }
    self.dataSource = dataSource.copy;
    
}
@end
