//
//  FSLGenderViewModel.m
//  WeChat
//
//  Created by Fingal Liu on 2017/10/15.
//  Copyright © 2017年 Fingal Liu. All rights reserved.
//

#import "FSLGenderViewModel.h"
@interface FSLGenderViewModel ()
/// closeCommand
@property (nonatomic, readwrite, strong) RACCommand *closeCommand;
/// 选中的ViewModel
@property (nonatomic, readwrite, strong) FSLGenderItemViewModel *selectedItemViewModel;
/// 语言ID
@property (nonatomic, readwrite, copy) NSString *genderIdStr;
/// 完成命令
@property (nonatomic, readwrite, strong) RACCommand *completeCommand;
/// 完成按钮有效性
@property (nonatomic, readwrite, strong) RACSignal *validCompleteSignal;

@end
@implementation FSLGenderViewModel
- (instancetype)initWithServices:(id<FSLViewModelServices>)services params:(NSDictionary *)params{
    if (self = [super initWithServices:services params:params]) {
        self.genderIdStr = params[FSLViewModelIDKey];
    }
    return self;
}

- (void)initialize{
    [super initialize];
    
    self.title = @"设置性别";
    
    @weakify(self);
    self.closeCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self);
        [self.services dismissViewModelAnimated:YES completion:NULL];
        return [RACSignal empty];
    }];
    
    self.didSelectCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(NSIndexPath * indexPath) {
        @strongify(self);
        /// 三部曲
        self.selectedItemViewModel.selected = NO;
        FSLGenderItemViewModel *itemViewModel = self.dataSource[indexPath.row];
        itemViewModel.selected = YES;
        self.selectedItemViewModel = itemViewModel;
        
        // “手动触发self.dataSource的KVO”，必写。
        [self willChangeValueForKey:@"dataSource"];
        // “手动触发self.now的KVO”，必写。
        [self didChangeValueForKey:@"dataSource"];
        
        return [RACSignal empty];
    }];
    
    /// 完成cmd
    self.completeCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self);
        /// 回调数据
        !self.callback?:self.callback(self.selectedItemViewModel.idstr);
        /// 退出界面
        [self.services dismissViewModelAnimated:YES completion:NULL];
        return [RACSignal empty];
    }];
    
    
    self.validCompleteSignal = [RACObserve(self, selectedItemViewModel) map:^id(FSLGenderItemViewModel * itemViewModel) {
        @strongify(self);
        return @(![itemViewModel.idstr isEqualToString:self.genderIdStr]);
    }];
    /// 初始化数据
    [self _configureData];
}


- (void)_configureData{
    NSArray *titles = @[@"男" , @"女"];
    NSMutableArray *dataSource = [NSMutableArray arrayWithCapacity:titles.count];
    for (NSInteger i = 0; i<titles.count; i++) {
        FSLGenderItemViewModel *itemViewModel = [FSLGenderItemViewModel itemViewModelWithIdstr:[NSString stringWithFormat:@"%zd",i] title:titles[i]];
        if ([itemViewModel.idstr isEqualToString:self.genderIdStr]) {
            itemViewModel.selected = YES;
            self.selectedItemViewModel = itemViewModel;
        }
        [dataSource addObject:itemViewModel];
    }
    
    self.dataSource = dataSource.copy;
    
}
@end
