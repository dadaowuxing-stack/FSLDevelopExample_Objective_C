//
//  FSLPictureMetadata.h
//  WeChat
//
//  Created by Fingal Liu on 2017/12/21.
//  Copyright © 2017年 Fingal Liu. All rights reserved.
/// 一张图片的元数据

#import "FSLObject.h"

/// 图片标记
typedef NS_ENUM(NSUInteger, FSLPictureBadgeType) {
    FSLPictureBadgeTypeNone = 0, ///< 正常图片
    FSLPictureBadgeTypeLong,     ///< 长图
    FSLPictureBadgeTypeGIF,      ///< GIF
};


@interface FSLPictureMetadata : FSLObject
/// < Full image url
@property (nonatomic, readwrite, strong) NSURL *url;
/// < pixel width
@property (nonatomic, readwrite, assign) int width;
/// < pixel height
@property (nonatomic, readwrite, assign) int height;
/// < "WEBP" "JPEG" "GIF"
@property (nonatomic, readwrite, copy) NSString *type;
/// < Default:1
@property (nonatomic, readwrite, assign) int cutType;
/// 图片标记 （正常 GIF 长图）
@property (nonatomic, readwrite, assign) FSLPictureBadgeType badgeType;
@end
