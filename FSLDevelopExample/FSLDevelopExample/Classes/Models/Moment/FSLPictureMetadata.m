//
//  FSLPictureMetadata.m
//  WeChat
//
//  Created by Fingal Liu on 2017/12/21.
//  Copyright © 2017年 Fingal Liu. All rights reserved.
//

#import "FSLPictureMetadata.h"

@implementation FSLPictureMetadata
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"cutType" : @"cut_type"};
}
- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
    
    if ([_type isEqualToString:@"GIF"]) {
        _badgeType = FSLPictureBadgeTypeGIF;
    } else {
        if (_width > 0 && (float)_height / _width > 3) {
            _badgeType = FSLPictureBadgeTypeLong;
        }
    }
    return YES;
}
@end
