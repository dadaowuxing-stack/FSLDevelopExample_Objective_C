//
//  NSAttributedString+Size.h
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/6/2.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSAttributedString (Size)

/**
 *  动态计算文字的宽高（多行）
 *  @param limitSize 限制的范围
 *
 *  @return 计算的宽高
 */
- (CGSize)fsl_sizeWithLimitSize:(CGSize)limitSize;

/**
 *  动态计算文字的宽高（多行）
 *  @param limitWidth 限制宽度 ，高度不限制
 *
 *  @return 计算的宽高
 */
- (CGSize)fsl_sizeWithLimitWidth:(CGFloat)limitWidth;

@end

NS_ASSUME_NONNULL_END
