//
//  NSString+Valid.m
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/6/2.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#import "NSString+Valid.h"

@implementation NSString (Valid)

/// 检测字符串是否包含中文
+( BOOL)fsl_isContainChinese:(NSString *)str
{
    for(int i=0; i< [str length];i++)
    {
        int a = [str characterAtIndex:i];
        if( a > 0x4e00 && a < 0x9fff)
        {
            return YES;
        }
    }
    return NO;
}
/// 整形
+ (BOOL)fsl_isPureInt:(NSString *)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}
/// 浮点型
+ (BOOL)fsl_isPureFloat:(NSString *)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    float val;
    return [scan scanFloat:&val] && [scan isAtEnd];
}

/// 有效的手机号码
+ (BOOL)fsl_isValidMobile:(NSString *)str
{
    NSString *phoneRegex = @"^1[34578]\\d{9}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:str];
}
/// 纯数字
+ (BOOL)fsl_isPureDigitCharacters:(NSString *)string
{
    string = [string stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
    if(string.length > 0) return NO;
    
    return YES;
}

/// 字符串为字母或者数字
+ (BOOL)fsl_isValidCharacterOrNumber:(NSString *)str
{
    // 编写正则表达式：只能是数字或英文，或两者都存在
    NSString *regex = @"^[a-z0－9A-Z]*$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:str];
}


//判断是否全是空格
+ (BOOL) fsl_isEmpty:(NSString *)str {
    if (!str) {
        return true;
    } else {
        NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        NSString *trimedString = [str stringByTrimmingCharactersInSet:set];
        if ([trimedString length] == 0) {
            return true;
        } else {
            return false;
        }
    }
}

/// 是否是正确的邮箱
+ (BOOL) fsl_isValidEmail:(NSString *)email
{
    NSString *emailRegex =@"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [predicate evaluateWithObject:email];
}


/// 是否是正确的QQ
+ (BOOL) fsl_isValidQQ:(NSString *)QQ
{
    NSString *regex =@"^[1-9][0-9]{4,9}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:QQ];
}

@end
