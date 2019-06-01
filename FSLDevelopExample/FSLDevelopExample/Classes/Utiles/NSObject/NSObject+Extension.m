//
//  NSObject+Extension.m
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/6/1.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#import "NSObject+Extension.h"

@implementation NSObject (Extension)

+ (NSInteger) fsl_randomNumberWithFrom:(NSInteger)from to:(NSInteger)to{
    return (NSInteger)(from + (arc4random() % (to - from + 1)));
}


- (void)fsl_convertNotification:(NSNotification *)notification completion:(void (^ _Nullable)(CGFloat, UIViewAnimationOptions, CGFloat))completion
{
    // 按钮
    NSDictionary *userInfo = notification.userInfo;
    // 最终尺寸
    CGRect endFrame = [userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    // 开始尺寸
    CGRect beginFrame = [userInfo[UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    // 动画时间
    CGFloat duration = [userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    /// options
    UIViewAnimationOptions options = ([userInfo[UIKeyboardAnimationCurveUserInfoKey] integerValue] << 16 ) | UIViewAnimationOptionBeginFromCurrentState;
    
    /// keyboard height
    CGFloat keyboardH = 0;
    if (beginFrame.origin.y == [[UIScreen mainScreen] bounds].size.height){
        // up
        keyboardH = endFrame.size.height;
    }else if (endFrame.origin.y == [[UIScreen mainScreen] bounds].size.height) {
        // down
        keyboardH = 0;
    }else{
        // up
        keyboardH = endFrame.size.height;
    }
    /// 回调
    !completion?:completion(duration,options,keyboardH);
}



/// Get class
- (BOOL)fsl_isStringClass { return [self isKindOfClass:[NSString class]]; }
- (BOOL)fsl_isNumberClass { return [self isKindOfClass:[NSNumber class]]; }
- (BOOL)fsl_isArrayClass { return [self isKindOfClass:[NSArray class]]; }
- (BOOL)fsl_isDictionaryClass { return [self isKindOfClass:[NSDictionary class]]; }
- (BOOL)fsl_isStringOrNumberClass { return [self fsl_isStringClass] || [self fsl_isNumberClass]; }
- (BOOL)fsl_isNullOrNil { return !self || [self isKindOfClass:[NSNull class]]; }
- (BOOL)fsl_isExist {
    if (self.fsl_isNullOrNil) return NO;
    if (self.fsl_isStringClass) return (self.fsl_stringValueExtension.length>0);
    return YES;
}

/// Get value
- (NSString *)fsl_stringValueExtension{
    if ([self fsl_isStringClass]) return [(NSString *)self length]? (NSString *)self: @"";
    if ([self fsl_isNumberClass]) return [NSString stringWithFormat:@"%@", self];
    return @"";
}


@end
