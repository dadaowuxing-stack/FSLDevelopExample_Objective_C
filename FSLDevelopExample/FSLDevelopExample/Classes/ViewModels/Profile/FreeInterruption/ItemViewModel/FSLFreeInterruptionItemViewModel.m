//
//  FSLFreeInterruptionItemViewModel.m
//  WeChat
//
//  Created by Fingal Liu on 2017/12/11.
//  Copyright © 2017年 Fingal Liu. All rights reserved.
//

#import "FSLFreeInterruptionItemViewModel.h"
@interface FSLFreeInterruptionItemViewModel ()
/// title
@property (nonatomic, readwrite, copy) NSString *title;
/// idstr
@property (nonatomic, readwrite, copy) NSString *idstr;
@end
@implementation FSLFreeInterruptionItemViewModel

+ (instancetype)itemViewModelWithIdstr:(NSString *)idstr title:(NSString *)title{
    return [[self alloc] initItemViewModelWithIdstr:idstr title:title];
}
- (instancetype)initItemViewModelWithIdstr:(NSString *)idstr title:(NSString *)title
{
    if (self = [super init]) {
        self.idstr = idstr;
        self.title = title;
    }
    return self;
}
@end
