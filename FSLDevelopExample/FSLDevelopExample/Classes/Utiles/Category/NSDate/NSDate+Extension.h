//
//  NSDate+Extension.h
//  YBJY
//
//  Created by apple on 16/8/11.
//  Copyright © 2016年 YouBeiJiaYuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDateFormatter+Extension.h"

#define FSL_D_MINUTE	    60
#define FSL_D_HOUR		3600
#define FSL_D_DAY		86400
#define FSL_D_WEEK		604800
#define FSL_D_YEAR		31556926


@interface NSDate (Extension)
/**
 *  是否为今天
 */
- (BOOL)fsl_isToday;
/**
 *  是否为昨天
 */
- (BOOL)fsl_isYesterday;
/**
 *  是否为今年
 */
- (BOOL)fsl_isThisYear;
/**
 *  是否本周
 */
- (BOOL) fsl_isThisWeek;

/**
 *  星期几
 */
- (NSString *)fsl_weekDay;

/**
 *  是否为在相同的周
 */
- (BOOL) fsl_isSameWeekWithAnotherDate: (NSDate *)anotherDate;


/**
 *  通过一个时间 固定的时间字符串 "2016/8/10 14:43:45" 返回时间
 *  @param timestamp 固定的时间字符串 "2016/8/10 14:43:45"
 */
+ (instancetype)fsl_dateWithTimestamp:(NSString *)timestamp;

/**
 *  返回固定的 当前时间 2016-8-10 14:43:45
 */
+ (NSString *)fsl_currentTimestamp;

/**
 *  返回一个只有年月日的时间
 */
- (NSDate *)fsl_dateWithYMD;

/**
 * 格式化日期描述
 */
- (NSString *)fsl_formattedDateDescription;

/** 与当前时间的差距 */
- (NSDateComponents *)fsl_deltaWithNow;



//////////// MVC&MVVM的商品的发布时间的描述 ////////////
- (NSString *)fsl_string_yyyy_MM_dd;
- (NSString *)fsl_string_yyyy_MM_dd:(NSDate *)toDate;
//////////// MVC&MVVM的商品的发布时间的描述 ////////////

@end
