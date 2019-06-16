//
//  FSLMomentContentItemViewModel.h
//  FSLDevelopExample
//
//  Created by senba on 2017/7/16.
//  Copyright © 2017年 Fingal Liu. All rights reserved.
//  朋友圈 评论+点赞的基类

#import "FSLObject.h"

@interface FSLMomentContentItemViewModel : FSLObject
/// 正文布局
@property (nonatomic, readwrite, strong) YYTextLayout *contentLableLayout;
/// 正文尺寸
@property (nonatomic, readwrite, assign) CGRect contentLableFrame;
/// cellHeight
@property (nonatomic, readwrite, assign) CGFloat cellHeight;
/// 类型 （评论、点赞）
@property (nonatomic, readwrite, assign) FSLMomentContentType type;


/// 富文本文字上的事件处理
@property (nonatomic, readwrite, strong) RACCommand *attributedTapCommand;
@end
