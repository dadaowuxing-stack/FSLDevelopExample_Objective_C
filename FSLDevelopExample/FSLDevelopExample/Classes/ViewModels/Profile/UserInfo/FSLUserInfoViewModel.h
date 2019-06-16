//
//  FSLUserInfoViewModel.h
//  WeChat
//
//  Created by Fingal Liu on 2017/9/21.
//  Copyright © 2017年 Fingal Liu. All rights reserved.
//

#import "FSLCommonViewModel.h"

@interface FSLUserInfoViewModel : FSLCommonViewModel
/// The current `user`.
@property (nonatomic, readonly , strong) FSLUser *user;
@end
