//
//  FSLSearchFriendsHeaderViewModel.m
//  WeChat
//
//  Created by Fingal Liu on 2017/9/24.
//  Copyright © 2017年 Fingal Liu. All rights reserved.
//

#import "FSLSearchFriendsHeaderViewModel.h"

@interface FSLSearchFriendsHeaderViewModel ()
/// Current login User
@property (nonatomic, readwrite, strong) FSLUser * user;
@end

@implementation FSLSearchFriendsHeaderViewModel
- (instancetype)initWithUser:(FSLUser *)user{
    if (self = [super init]) {
        self.user = user;
    }
    return self;
}
@end
