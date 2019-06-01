//
//  FSLCommonViewModel.m
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/6/1.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#import "FSLCommonViewModel.h"

@implementation FSLCommonViewModel

- (void)initialize{
    [super initialize];
    
    @weakify(self);
    /// 选中cell的命令
    /// UI Test
    self.didSelectCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(NSIndexPath *indexPath) {
        @strongify(self);
        FSLCommonGroupViewModel *groupViewModel = self.dataSource[indexPath.section] ;
        FSLCommonItemViewModel *itemViewModel = groupViewModel.itemViewModels[indexPath.row];
        
        if (itemViewModel.operation) {
            /// 有操作执行操作
            itemViewModel.operation();
        }else if(itemViewModel.destViewModelClass){
            /// 没有操作就跳转VC
            Class viewModelClass = itemViewModel.destViewModelClass;
            FSLViewModel *viewModel = [[viewModelClass alloc] initWithServices:self.services params:@{FSLViewModelTitleKey:itemViewModel.title}];
            [self.services pushViewModel:viewModel animated:YES];
        }
        return [RACSignal empty];
    }];
}

@end
