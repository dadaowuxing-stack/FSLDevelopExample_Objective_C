//
//  FSLLocationViewModel.h
//  WeChat
//
//  Created by Fingal Liu on 2017/10/15.
//  Copyright © 2017年 Fingal Liu. All rights reserved.
//

#import "FSLTableViewModel.h"

@interface FSLLocationViewModel : FSLTableViewModel
/// 取消的命令
@property (nonatomic, readonly, strong) RACCommand *cancelCommand;
/// completeCommand
@property (nonatomic, readonly, strong) RACCommand *completeCommand;
/// 完成按钮有效性
@property (nonatomic, readonly, strong) RACSignal *validCompleteSignal;
@end
