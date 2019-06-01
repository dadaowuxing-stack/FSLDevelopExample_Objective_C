//
//  UIImage+Extension.h
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/6/1.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)
/**
 *  根据图片名返回一张能够自由拉伸的图片 (从中间拉伸)
 */
+ (UIImage *)fsl_resizableImage:(NSString *)imgName;
+ (UIImage *)fsl_resizableImage:(NSString *)imgName capInsets:(UIEdgeInsets)capInsets;


/// 返回一张未被渲染的图片
+ (UIImage *)fsl_imageAlwaysShowOriginalImageWithImageName:(NSString *)imageName;
/// 获取视频某个时间的帧图片
+ (UIImage *)fsl_thumbnailImageForVideo:(NSURL *)videoURL atTime:(NSTimeInterval)time;

/// /// 获取屏幕截图
///
/// @return 屏幕截图图像
+ (UIImage *)fsl_screenShot;

- (UIImage *)fsl_fixOrientation;
@end
