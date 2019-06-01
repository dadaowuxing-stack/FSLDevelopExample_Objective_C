//
//  NSObject+Extension.h
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/6/1.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Extension)
/// 获取 [from to] 之间的数据
+ (NSInteger) fsl_randomNumberWithFrom:(NSInteger)from to:(NSInteger)to;

/// 根据获取到的
- (void)fsl_convertNotification:(NSNotification *_Nullable)notification completion:(void (^ __nullable)(CGFloat duration, UIViewAnimationOptions options, CGFloat keyboardH))completion;


#pragma mark - Get..
/// Get class
- (BOOL)fsl_isStringClass;
- (BOOL)fsl_isNumberClass;
- (BOOL)fsl_isArrayClass;
- (BOOL)fsl_isDictionaryClass;
- (BOOL)fsl_isStringOrNumberClass;
- (BOOL)fsl_isNullOrNil;
- (BOOL)fsl_isExist;

/// Get value
- (NSString *_Nullable)fsl_stringValueExtension;


@end
