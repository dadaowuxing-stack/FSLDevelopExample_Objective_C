//
//  NSString+Valid.h
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/6/2.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Valid)

/// 检测字符串是否包含中文
+( BOOL)fsl_isContainChinese:(NSString *)str;

/// 整形
+ (BOOL)fsl_isPureInt:(NSString *)string;

/// 浮点型
+ (BOOL)fsl_isPureFloat:(NSString *)string;

/// 有效的手机号码
+ (BOOL)fsl_isValidMobile:(NSString *)str;

/// 纯数字
+ (BOOL)fsl_isPureDigitCharacters:(NSString *)string;

/// 字符串为字母或者数字
+ (BOOL)fsl_isValidCharacterOrNumber:(NSString *)str;

/// 判断字符串全是空格or空
+ (BOOL) fsl_isEmpty:(NSString *) str;

/// 是否是正确的邮箱
+ (BOOL) fsl_isValidEmail:(NSString *)email;

/// 是否是正确的QQ
+ (BOOL) fsl_isValidQQ:(NSString *)QQ;

@end

NS_ASSUME_NONNULL_END
