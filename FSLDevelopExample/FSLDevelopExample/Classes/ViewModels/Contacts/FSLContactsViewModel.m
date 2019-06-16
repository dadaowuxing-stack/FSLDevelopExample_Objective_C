//
//  FSLContactsViewModel.m
//  WeChat
//
//  Created by Fingal Liu on 2017/9/11.
//  Copyright © 2017年 Fingal Liu. All rights reserved.
//

#import "FSLContactsViewModel.h"
#import "FSLAddFriendsViewModel.h"
@interface FSLContactsViewModel ()
/// addFriendsCommand
@property (nonatomic, readwrite, strong) RACCommand *addFriendsCommand;
@end


@implementation FSLContactsViewModel
- (void)initialize
{
    [super initialize];
    
    self.title = @"通讯录";
    
    @weakify(self);
    self.addFriendsCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self);
        FSLAddFriendsViewModel *viewModel = [[FSLAddFriendsViewModel alloc] initWithServices:self.services params:nil];
        [self.services pushViewModel:viewModel animated:YES];
        return [RACSignal empty];
    }];
    
}
@end
