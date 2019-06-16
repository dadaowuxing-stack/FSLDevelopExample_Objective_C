//
//  FSLFreeInterruptionViewModel.h
//  WeChat
//
//  Created by senba on 2017/12/11.
//  Copyright © 2017年 Fingal Liu. All rights reserved.
//

#import "FSLTableViewModel.h"
#import "FSLFreeInterruptionItemViewModel.h"
@interface FSLFreeInterruptionViewModel : FSLTableViewModel
/// footer
@property (nonatomic, readonly, copy) NSString *footer;
/// closeCommand
@property (nonatomic, readonly, strong) RACCommand *closeCommand;
/// 完成命令
@property (nonatomic, readonly, strong) RACCommand *completeCommand;
@end
