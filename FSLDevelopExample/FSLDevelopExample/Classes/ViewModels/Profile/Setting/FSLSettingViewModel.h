//
//  FSLSettingViewModel.h
//  WeChat
//
//  Created by Fingal Liu on 2017/10/11.
//  Copyright © 2017年 Fingal Liu. All rights reserved.
//

#import "FSLCommonViewModel.h"

@interface FSLSettingViewModel : FSLCommonViewModel
/// 登出的命令
@property (nonatomic, readonly, strong) RACCommand *logoutCommand;
@end
