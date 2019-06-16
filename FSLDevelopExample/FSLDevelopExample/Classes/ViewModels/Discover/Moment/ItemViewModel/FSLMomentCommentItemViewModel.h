//
//  FSLMomentCommentItemViewModel.h
//  FSLDevelopExample
//
//  Created by senba on 2017/7/13.
//  Copyright © 2017年 Fingal Liu. All rights reserved.
//

#import "FSLMomentContentItemViewModel.h"
#import "FSLMoments.h"

@interface FSLMomentCommentItemViewModel : FSLMomentContentItemViewModel

/// ==== Model Properties ====
/// 评论模型
@property (nonatomic, readonly, strong) FSLComment *comment;

/// init
- (instancetype)initWithComment:(FSLComment *)comment;
@end
