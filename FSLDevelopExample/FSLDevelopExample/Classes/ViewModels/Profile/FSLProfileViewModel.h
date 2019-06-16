//
//  FSLProfileViewModel.h
//  WeChat
//
//  Created by senba on 2017/9/11.
//  Copyright © 2017年 Fingal Liu. All rights reserved.
//

#import "FSLCommonViewModel.h"
#import "FSLCommonArrowItemViewModel.h"
#import "FSLCommonProfileHeaderItemViewModel.h"

@interface FSLProfileViewModel : FSLCommonViewModel
/// The current `user`.
@property (nonatomic, readonly , strong) FSLUser *user;

@end
