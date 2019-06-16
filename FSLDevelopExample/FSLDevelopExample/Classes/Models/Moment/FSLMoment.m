//
//  FSLMoment.m
//  WeChat
//
//  Created by Fingal Liu on 2017/12/20.
//  Copyright © 2017年 Fingal Liu. All rights reserved.
//

#import "FSLMoment.h"

@implementation FSLMoment
- (NSMutableArray<FSLComment *> *)commentsList
{
    if (_commentsList == nil) {
        _commentsList = [[NSMutableArray alloc] init];
    }
    return _commentsList;
}

- (NSMutableArray<FSLUser *> *)attitudesList
{
    if (_attitudesList == nil) {
        _attitudesList = [NSMutableArray array];
    }
    return _attitudesList;
}

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"createdAt"        : @"created_at",
             @"sourceAllowClick" : @"source_allowclick",
             @"sourceUrl"        : @"source_url",
             @"attitudesStatus"  : @"attitudes_status",
             @"attitudesCount"   : @"attitudes_count",
             @"attitudesList"    : @"attitudes_list",
             @"commentsCount"    : @"comments_count",
             @"commentsList"     : @"comments_list",
             @"picInfos"         : @"pic_infos"
             };
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    
    return @{@"picInfos"        : [FSLPicture class],
             @"commentsList"    : [FSLComment class],
             @"attitudesList"   : [FSLUser class]
             };
}
@end
