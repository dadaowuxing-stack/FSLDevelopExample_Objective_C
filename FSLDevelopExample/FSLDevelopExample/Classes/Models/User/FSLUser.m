//
//  FSLUser.m
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/6/1.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#import "FSLUser.h"

@implementation FSLUser
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"screenName"         : @"screen_name",
             @"profileImageUrl"    : @"profile_image_url",
             @"avatarLarge"        : @"avatar_large"
             };
}


/// 实现
- (BOOL)isEqual:(FSLUser *)object
{
    /// 重写比对规则
    if([object isKindOfClass:[self class]])
    {
        return [self.idstr isEqualToString:object.idstr];
    }
    return [super isEqual:object];
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        _coverImage = FSLImageNamed(@"Kris");
    }
    return self;
}
@end
