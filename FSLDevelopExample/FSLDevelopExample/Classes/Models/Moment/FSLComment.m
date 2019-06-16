//
//  FSLComment.m
//  WeChat
//
//  Created by Fingal Liu on 2017/12/21.
//  Copyright © 2017年 Fingal Liu. All rights reserved.
//

#import "FSLComment.h"

@implementation FSLComment
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"createdAt"        : @"created_at",
             @"momentIdstr"      : @"moment_idstr",
             @"toUser"           : @"to_user",
             @"fromUser"         : @"from_user"
             };
}
@end
