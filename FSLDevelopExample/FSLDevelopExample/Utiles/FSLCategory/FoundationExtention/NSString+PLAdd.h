//
//  NSString+PLAdd.h
//  Sales
//
//  Created by Fingal Liu on 2018/12/10.
//  Copyright © 2018 MJB. All rights reserved.
//

#import <UIKit/UIKit.h>






@interface NSString (PLAdd)






/* URL编码 */


- (NSString *)pl_encodedString;


/* URL decode */


- (NSString *)pl_decodedString;






/* 去掉左右空格、换行符 */


- (NSString *)pl_trim;






/* 去掉所有的空格、换行符（包括中间的） */


- (NSString *)pl_trimAll;






/* 把 String 转化为 URL String已经URL编码了 */


- (NSURL *)pl_URL;


- (BOOL)pl_isValidURL;






- (NSString *)pl_md5;


+ (NSString *)pl_uuid;










/**
 
 
 只能是 字母 A-Z a-z
 
 
 @return 是否为 字母
 
 
 */


- (BOOL)pl_isValidAlphabet;


- (BOOL)pl_isNumber;


-(BOOL)pl_isDecimalNumber; // 只能是小数






- (BOOL)pl_isValidEmail;






- (BOOL)pl_isFixedLinePhone; // 固定电话


/**
 
 
 是否包含系统中的emoji
 
 
 */


- (BOOL)pl_containsNativeEmoji;


- (NSString *)pl_removesNativeEmoji;


// 富文本


- (NSAttributedString *)pl_attibutedString;


// 算文字的高度


- (CGSize)pl_sizeWithFont:(UIFont *)font maxWidth:(CGFloat)width;






-(NSString *)deleteLastRemovableZero;






+(NSString *)deleteLastRemovableZeroInDecimal:(double)decimal;






@end
