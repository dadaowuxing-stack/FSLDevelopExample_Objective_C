//
//  FSLFeatureSignatureViewModel.h
//  WeChat
//
//  Created by Fingal Liu on 2017/9/21.
//  Copyright © 2017年 Fingal Liu. All rights reserved.
//

#import "FSLViewModel.h"

@interface FSLFeatureSignatureViewModel : FSLViewModel
/// 取消的命令
@property (nonatomic, readonly, strong) RACCommand *cancelCommand;

/// text
@property (nonatomic, readwrite, strong) NSString *text;

/// completeCommand
@property (nonatomic, readonly, strong) RACCommand *completeCommand;
/// 完成按钮有效性
@property (nonatomic, readonly, strong) RACSignal *validCompleteSignal;
@end
