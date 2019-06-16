//
//  FSLPlugViewModel.h
//  WeChat
//
//  Created by Fingal Liu on 2017/10/15.
//  Copyright © 2017年 Fingal Liu. All rights reserved.
//  插件ViewModel

#import "FSLViewModel.h"

@interface FSLPlugViewModel : FSLViewModel
/// plugDetailCommand
@property (nonatomic, readonly, strong) RACCommand *plugDetailCommand;
/// 使用协议cmd
@property (nonatomic, readonly, strong) RACCommand *useIntroCommand;
@end
