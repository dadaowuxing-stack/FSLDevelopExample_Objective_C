//
//  UILabel+Extension.h
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/6/2.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (Extension)

/// 创建文本标签
///
/// @param text     文本
/// @param fontSize 字体大小
/// @param textColor    颜色
///
/// @return UILabel
+ (instancetype)fsl_labelWithText:(NSString *)text fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor;
+ (instancetype)fsl_labelWithText:(NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor;

@end

NS_ASSUME_NONNULL_END
