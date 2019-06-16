//
//  FSLSearchFriendsHeaderViewModel.h
//  WeChat
//
//  Created by senba on 2017/9/24.
//  Copyright © 2017年 Fingal Liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FSLUser.h"
@interface FSLSearchFriendsHeaderViewModel : NSObject

/// Current login User
@property (nonatomic, readonly, strong) FSLUser * user;

/// searchCmd
@property (nonatomic, readwrite, strong) RACCommand *searchCommand;

/// init
- (instancetype)initWithUser:(FSLUser *)user;


@end
