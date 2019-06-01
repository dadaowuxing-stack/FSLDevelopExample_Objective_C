//
//  NSString+PLAdd.m
//  Sales
//
//  Created by Fingal Liu on 2018/12/10.
//  Copyright © 2018 MJB. All rights reserved.
//

#import "NSString+PLAdd.h"


#import <CommonCrypto/CommonDigest.h>






@implementation NSString (PLAdd)






-(NSString *)pl_md5


{
    
    
    if(self == nil || [self length] == 0) return nil;
    
    
    
    
    
    const char *value = [self UTF8String];
    
    
    unsigned char outputBuffer[CC_MD5_DIGEST_LENGTH];
    
    
    CC_MD5(value, (CC_LONG)strlen(value), outputBuffer);
    
    
    NSMutableString *outputString = [[NSMutableString alloc] initWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    
    for(NSInteger count = 0; count < CC_MD5_DIGEST_LENGTH; count++){
        
        
        [outputString appendFormat:@"%02x",outputBuffer[count]];
        
        
    }
    
    
    return outputString;
    
    
}






+(NSString *)pl_uuid


{
    
    
    CFUUIDRef puuid = CFUUIDCreate( nil );
    
    
    CFStringRef uuidString = CFUUIDCreateString( nil, puuid );
    
    
    NSString * result = (NSString *)CFBridgingRelease(CFStringCreateCopy( NULL, uuidString));
    
    
    CFRelease(puuid);
    
    
    CFRelease(uuidString);
    
    
    return result;
    
    
}






// URL编码


-(NSString *)pl_encodedString


{
    
    
    NSString *string = self;
    
    
    return [string stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    
}


// URL decode


-(NSString *)pl_decodedString


{
    
    
    NSString *string = self;
    
    
    return [string stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    
}






// 去掉第一个和最后一个空格（如果有的话）


-(NSString *)pl_trim


{
    
    
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    
}






// 去掉所有的空格


-(NSString *)pl_trimAll


{
    
    
    return [[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    
}






-(NSURL *)pl_URL


{
    
    
    return [NSURL URLWithString:self.pl_encodedString];
    
    
}






-(BOOL)pl_isValidURL {
    
    
    NSString *url = self.lowercaseString;
    
    
    return [url hasPrefix:@"http://"] || [url hasPrefix:@"https://"];
    
    
}






- (BOOL)pl_isValidAlphabet {
    
    
    return [[NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"^[A-Za-z]+$"] evaluateWithObject:self];
    
    
}






- (BOOL)pl_isNumber {
    
    
    return [[NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"^\\d+$"] evaluateWithObject:self];
    
    
}






// 固定电话


- (BOOL)pl_isFixedLinePhone {
    
    
    return [[NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"^((0\\d{2,3}-\\d{7,8})|(1[3456789]\\d{9}))$"]
            
            
            evaluateWithObject:self];
    
    
}






-(BOOL)pl_isDecimalNumber {
    
    
    return [[NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"^\\d+\\.\\d+$"] evaluateWithObject:self];
    
    
}






- (BOOL)pl_isValidEmail


{
    
    
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    
    
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    
    return [emailTest evaluateWithObject:self];
    
    
}






-(BOOL)pl_containsNativeEmoji {
    
    
    __block BOOL contain = NO;
    
    
    [self enumerateSubstringsInRange:NSMakeRange(0, self.length) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
        
        
        if ([substring m_isEmoji]) {
            
            
            contain = YES;
            
            
            *stop = YES;
            
            
        }
        
        
    }];
    
    
    return contain;
    
    
}


// 检查一个‘字符’是否是emoji表情


// http://stackoverflow.com/questions/25861468/how-to-disable-ios-8-emoji-keyboard


- (BOOL)m_isEmoji


{
    
    
    if (self.length <= 0) {
        
        
        return NO;
        
        
    }
    
    
    unichar first = [self characterAtIndex:0];
    
    
    switch (self.length) {
            
            
        case 1:
            
            
        {
            
            
            if (first == 0xa9 || first == 0xae || first == 0x2122 ||
                
                
                first == 0x3030 || (first >= 0x25b6 && first <= 0x27bf) ||
                
                
                first == 0x2328 || (first >= 0x23e9 && first <= 0x23fa)) {
                
                
                return YES;
                
                
            }
            
            
        } break;
            
            
        case 2:
            
            
        {
            
            
            unichar c = [self characterAtIndex:1];
            
            
            if (c == 0xfe0f) {
                
                
                if (first >= 0x203c && first <= 0x3299) {
                    
                    
                    return YES;
                    
                    
                }
                
                
            }
            
            
            if (first >= 0xd83c && first <= 0xd83e) {
                
                
                return YES;
                
                
            }
            
            
        } break;
            
            
        case 3:
            
            
        {
            
            
            unichar c = [self characterAtIndex:1];
            
            
            if (c == 0xfe0f) {
                
                
                if (first >= 0x23 && first <= 0x39) {
                    
                    
                    return YES;
                    
                    
                }
                
                
            }
            
            
            else if (c == 0xd83c) {
                
                
                if (first == 0x26f9 || first == 0x261d || (first >= 0x270a && first <= 0x270d)) {
                    
                    
                    return YES;
                    
                    
                }
                
                
            }
            
            
            if (first == 0xd83c) {
                
                
                return YES;
                
                
            }
            
            
        }  break;
            
            
        case 4:
            
            
        {
            
            
            unichar c = [self characterAtIndex:1];
            
            
            if (c == 0xd83c) {
                
                
                if (first == 0x261d || first == 0x270c) {
                    
                    
                    return YES;
                    
                    
                }
                
                
            }
            
            
            if (first >= 0xd83c && first <= 0xd83e) {
                
                
                return YES;
                
                
            }
            
            
        } break;
            
            
        case 5:
            
            
        {
            
            
            if (first == 0xd83d) {
                
                
                return YES;
                
                
            }
            
            
        } break;
            
            
        case 8:
            
            
        case 11:
            
            
        {
            
            
            if (first == 0xd83d) {
                
                
                return YES;
                
                
            }
            
            
        } break;
            
            
        default:
            
            
            break;
            
            
    }
    
    
    return NO;
    
    
}






-(NSString *)pl_removesNativeEmoji {
    
    
    NSString *string = self;
    
    
    NSUInteger len = [string lengthOfBytesUsingEncoding:NSUTF8StringEncoding];
    
    
    const char *utf8 = [string UTF8String];
    
    
    char *newUTF8 = malloc( sizeof(char) * len );
    
    
    int j = 0;
    
    
    
    
    
    //0xF0(4) 0xE2(3) 0xE3(3) 0xC2(2) 0x30---0x39(4)
    
    
    for ( int i = 0; i < len; i++ ) {
        
        
        unsigned int c = utf8[i];
        
        
        BOOL isControlChar = NO;
        
        
        if ( c == 4294967280 ||
            
            
            c == 4294967089 ||
            
            
            c == 4294967090 ||
            
            
            c == 4294967091 ||
            
            
            c == 4294967092 ||
            
            
            c == 4294967093 ||
            
            
            c == 4294967094 ||
            
            
            c == 4294967095 ||
            
            
            c == 4294967096 ||
            
            
            c == 4294967097 ||
            
            
            c == 4294967088 ) {
            
            
            i = i + 3;
            
            
            isControlChar = YES;
            
            
        }
        
        
        if ( c == 4294967266 || c == 4294967267 ) {
            
            
            i = i + 2;
            
            
            isControlChar = YES;
            
            
        }
        
        
        if ( c == 4294967234 ) {
            
            
            i = i + 1;
            
            
            isControlChar = YES;
            
            
        }
        
        
        if ( !isControlChar ) {
            
            
            newUTF8[j] = utf8;
            
            
            j++;
            
            
        }
        
        
    }
    
    
    newUTF8[j] = '\0';
    
    
    NSString *encrypted = [NSString stringWithCString:(const char*)newUTF8
                           
                           
                                             encoding:NSUTF8StringEncoding];
    
    
    free( newUTF8 );
    
    
    return encrypted;
    
    
}






-(NSAttributedString *)pl_attibutedString


{
    
    
    return [[NSMutableAttributedString alloc] initWithData:[self dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
    
    
}






-(CGSize) pl_sizeWithFont:(UIFont *)font maxWidth:(CGFloat)width


{
    
    
    if (self.length > 0) {
        
        
        CGRect frame = [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:
                        
                        
                        NSStringDrawingUsesLineFragmentOrigin
                        
                        
                                       attributes:@{NSFontAttributeName:font} context:nil];
        
        
        
        
        
        return frame.size;
        
        
    }
    
    
    return CGSizeZero;
    
    
}






-(NSString *)deleteLastRemovableZero


{
    
    
    NSString *string = self;
    
    
    if (![string pl_isDecimalNumber] && ![string containsString:@"."]) {
        
        
        return string;
        
        
    }
    
    
    if ([string hasSuffix:@".00"]) {
        
        
        return [string substringToIndex:string.length - 3];
        
        
    }
    
    
    if ([string hasSuffix:@"0"]) {
        
        
        return [string substringToIndex:string.length - 1];
        
        
    }
    
    
    return string;
    
    
}






+(NSString *)deleteLastRemovableZeroInDecimal:(double)decimal


{
    
    
    NSString *string = [NSString stringWithFormat:@"%.02f", decimal];
    
    
    if (![string pl_isDecimalNumber] || ![string containsString:@"."]) {
        
        
        return string;
        
        
    }
    
    
    if ([string hasSuffix:@".00"]) {
        
        
        return [string substringToIndex:string.length - 3];
        
        
    }
    
    
    if ([string hasSuffix:@"0"]) {
        
        
        return [string substringToIndex:string.length - 1];
        
        
    }
    
    
    return string;
    
    
}






@end
