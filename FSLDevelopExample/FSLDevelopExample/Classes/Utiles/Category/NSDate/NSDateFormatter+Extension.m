//
//  NSDateFormatter+Extension.m
//  YBJY
//
//  Created by apple on 16/8/11.
//  Copyright © 2016年 YouBeiJiaYuan. All rights reserved.
//

#import "NSDateFormatter+Extension.h"

@implementation NSDateFormatter (Extension)
+ (instancetype)fsl_dateFormatter
{
    return [[self alloc] init];
}

+ (instancetype)fsl_dateFormatterWithFormat:(NSString *)dateFormat
{
    NSDateFormatter *dateFormatter = [[self alloc] init];
    dateFormatter.dateFormat = dateFormat;
    return dateFormatter;
}

+ (instancetype)fsl_defaultDateFormatter
{
    return [self fsl_dateFormatterWithFormat:@"yyyy-MM-dd HH:mm:ss"];
}
@end
