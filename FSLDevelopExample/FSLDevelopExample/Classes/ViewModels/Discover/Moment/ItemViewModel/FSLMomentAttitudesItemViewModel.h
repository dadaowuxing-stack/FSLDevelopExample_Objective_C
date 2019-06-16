//
//  FSLMomentAttitudesItemViewModel.h
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2017/7/16.
//  Copyright © 2017年 Fingal Liu. All rights reserved.
//  点赞列表 视图模型

#import "FSLMomentContentItemViewModel.h"
#import "FSLMoments.h"
@interface FSLMomentAttitudesItemViewModel : FSLMomentContentItemViewModel

/// 单条说说
@property (nonatomic, readonly, strong) FSLMoment *moment;

/// init
- (instancetype)initWithMoment:(FSLMoment *)moment;

/// 执行更新数据的命令
@property (nonatomic, readonly, strong) RACCommand *operationCmd;
@end
