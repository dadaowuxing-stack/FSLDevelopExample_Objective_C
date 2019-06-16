//
//  FSLCommonProfileHeaderItemViewModel.m
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/6/16.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#import "FSLCommonProfileHeaderItemViewModel.h"

@interface FSLCommonProfileHeaderItemViewModel ()

/// 用户头像
@property (nonatomic, readwrite, strong) FSLUser *user;

@end

@implementation FSLCommonProfileHeaderItemViewModel

- (instancetype)initViewModelWithUser:(FSLUser *)user{
    
    if (self = [super init]) {
        self.user = user;
    }
    return self;
}

@end
