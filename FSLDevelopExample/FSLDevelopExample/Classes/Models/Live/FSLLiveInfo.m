//
//  FSLLiveInfo.m
//  WeChat
//
//  Created by Fingal Liu on 2017/11/3.
//  Copyright © 2017年 Fingal Liu. All rights reserved.
//

#import "FSLLiveInfo.h"

@implementation FSLLiveInfo
// 返回容器类中的所需要存放的数据类型 (以 Class 或 Class Name 的形式)。
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"list":[FSLLiveRoom class]};
}

@end
