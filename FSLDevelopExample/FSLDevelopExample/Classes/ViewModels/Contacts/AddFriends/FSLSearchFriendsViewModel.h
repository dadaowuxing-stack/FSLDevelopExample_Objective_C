//
//  FSLSearchFriendsViewModel.h
//  WeChat
//
//  Created by Fingal Liu on 2017/9/24.
//  Copyright © 2017年 Fingal Liu. All rights reserved.
//

#import "FSLTableViewModel.h"

@interface FSLSearchFriendsViewModel : FSLTableViewModel
/// searchText
@property (nonatomic, readwrite, copy) NSString *searchText;

/// searchCommand
@property (nonatomic, readonly, strong) RACCommand *searchCommand;
@end
