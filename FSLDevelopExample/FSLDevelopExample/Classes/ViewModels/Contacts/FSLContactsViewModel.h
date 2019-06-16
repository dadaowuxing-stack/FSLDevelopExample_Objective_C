//
//  FSLContactsViewModel.h
//  WeChat
//
//  Created by Fingal Liu on 2017/9/11.
//  Copyright © 2017年 Fingal Liu. All rights reserved.
//

#import "FSLTableViewModel.h"

@interface FSLContactsViewModel : FSLTableViewModel
/// addFriendsCommand
@property (nonatomic, readonly, strong) RACCommand *addFriendsCommand;
@end
