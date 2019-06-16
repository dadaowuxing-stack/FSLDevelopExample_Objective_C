//
//  FSLProfileInfoViewModel.h
//  WeChat
//
//  Created by Fingal Liu on 2018/1/29.
//  Copyright © 2018年 Fingal Liu. All rights reserved.
//  用户主页信息

#import "FSLTableViewModel.h"
#import "FSLUser.h"
@interface FSLProfileInfoViewModel : FSLTableViewModel
/// user
@property (nonatomic, readonly, strong) FSLUser *user;

/// pictures
@property (nonatomic, readonly, copy) NSArray *pictures;

/// 是否是当前用户
@property (nonatomic, readonly, assign) BOOL currentUser;
@end
