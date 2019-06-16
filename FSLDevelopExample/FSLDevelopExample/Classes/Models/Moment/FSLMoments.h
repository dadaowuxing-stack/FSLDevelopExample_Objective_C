//
//  FSLMoments.h
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2017/7/7.
//  Copyright © 2017年 Fingal Liu. All rights reserved.
//  微信朋友圈数据模型

#import "FSLObject.h"
#import "FSLMoment.h"

//  一组说说
@interface FSLMoments : FSLObject

/// 多个说说
@property (nonatomic, readwrite, copy) NSArray <FSLMoment *> *moments;

@end
