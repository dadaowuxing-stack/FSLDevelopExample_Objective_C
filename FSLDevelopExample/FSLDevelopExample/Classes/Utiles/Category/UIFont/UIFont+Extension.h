//
//  UIFont+Extension.h
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/6/1.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  Mike_He 但是苹方字体 iOS9.0+出现  需要做适配
 *  这个分类主要用来 字体...
 (
 "PingFangSC-Ultralight",
 "PingFangSC-Regular",
 "PingFangSC-Semibold",
 "PingFangSC-Thin",
 "PingFangSC-Light",
 "PingFangSC-Medium"
 )
 */

// IOS版本
#define FSLIOSVersion ([[[UIDevice currentDevice] systemVersion] floatValue])


/// 设置系统的字体大小（YES：粗体 NO：常规）
#define FSLFont(__size__,__bold__) ((__bold__)?([UIFont boldSystemFontOfSize:__size__]):([UIFont systemFontOfSize:__size__]))

/// 极细体
#define FSLUltralightFont(__size__) ((FSLIOSVersion<9.0)?FSLFont(__size__ , YES):[UIFont fsl_fontForPingFangSC_UltralightFontOfSize:__size__])

/// 纤细体
#define FSLThinFont(__size__)       ((FSLIOSVersion<9.0)?FSLFont(__size__ , YES):[UIFont fsl_fontForPingFangSC_ThinFontOfSize:__size__])

/// 细体
#define FSLLightFont(__size__)      ((FSLIOSVersion<9.0)?FSLFont(__size__ , YES):[UIFont fsl_fontForPingFangSC_LightFontOfSize:__size__])

// 中等
#define FSLMediumFont(__size__)     ((FSLIOSVersion<9.0)?FSLFont(__size__ , YES):[UIFont fsl_fontForPingFangSC_MediumFontOfSize:__size__])

// 常规
#define FSLRegularFont(__size__)    ((FSLIOSVersion<9.0)?FSLFont(__size__ , NO):[UIFont fsl_fontForPingFangSC_RegularFontOfSize:__size__])

/** 中粗体 */
#define FSLSemiboldFont(__size__)   ((FSLIOSVersion<9.0)?FSLFont(__size__ , YES):[UIFont fsl_fontForPingFangSC_SemiboldFontOfSize:__size__])



/// 苹方常规字体 10
#define FSLRegularFont_10 FSLRegularFont(10.0f)
/// 苹方常规字体 11
#define FSLRegularFont_11 FSLRegularFont(11.0f)
/// 苹方常规字体 12
#define FSLRegularFont_12 FSLRegularFont(12.0f)
/// 苹方常规字体 13
#define FSLRegularFont_13 FSLRegularFont(13.0f)
/** 苹方常规字体 14 */
#define FSLRegularFont_14 FSLRegularFont(14.0f)
/// 苹方常规字体 15
#define FSLRegularFont_15 FSLRegularFont(15.0f)
/// 苹方常规字体 16
#define FSLRegularFont_16 FSLRegularFont(16.0f)
/// 苹方常规字体 17
#define FSLRegularFont_17 FSLRegularFont(17.0f)
/// 苹方常规字体 18
#define FSLRegularFont_18 FSLRegularFont(18.0f)
/// 苹方常规字体 19
#define FSLRegularFont_19 FSLRegularFont(19.0f)
/// 苹方常规字体 20
#define FSLRegularFont_20 FSLRegularFont(20.0f)


#import <UIKit/UIKit.h>

@interface UIFont (Extension)

/**
 *  苹方极细体
 *
 *  @param fontSize 字体大小
 *
 */
+(instancetype) fsl_fontForPingFangSC_UltralightFontOfSize:(CGFloat)fontSize;

/**
 *  苹方常规体
 *
 *  @param fontSize 字体大小
 *
 */
+(instancetype) fsl_fontForPingFangSC_RegularFontOfSize:(CGFloat)fontSize;

/**
 *  苹方中粗体
 *
 *  @param fontSize 字体大小
 *
 */
+(instancetype) fsl_fontForPingFangSC_SemiboldFontOfSize:(CGFloat)fontSize;

/**
 *  苹方纤细体
 *
 *  @param fontSize 字体大小
 *
 */
+(instancetype) fsl_fontForPingFangSC_ThinFontOfSize:(CGFloat)fontSize;

/**
 *  苹方细体
 *
 *  @param fontSize 字体大小
 *
 */
+(instancetype) fsl_fontForPingFangSC_LightFontOfSize:(CGFloat)fontSize;

/**
 *  苹方中黑体
 *
 *  @param fontSize 字体大小
 *
 */
+(instancetype) fsl_fontForPingFangSC_MediumFontOfSize:(CGFloat)fontSize;




@end
