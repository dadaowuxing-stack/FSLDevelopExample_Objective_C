//
//  FSLCommonProfileHeaderItemViewModel.h
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/6/16.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#import "FSLCommonItemViewModel.h"
#import "FSLUser.h"

NS_ASSUME_NONNULL_BEGIN

@interface FSLCommonProfileHeaderItemViewModel : FSLCommonItemViewModel

/// 用户头像
@property (nonatomic, readonly, strong) FSLUser *user;


- (instancetype)initViewModelWithUser:(FSLUser *)user;

@end

NS_ASSUME_NONNULL_END
