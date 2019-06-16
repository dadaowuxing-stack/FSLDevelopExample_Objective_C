//
//  FSLPicture.h
//  WeChat
//
//  Created by Fingal Liu on 2017/12/21.
//  Copyright © 2017年 Fingal Liu. All rights reserved.
//

#import "FSLObject.h"
#import "FSLPictureMetadata.h"
@interface FSLPicture : FSLObject
/// 图片模型id
@property (nonatomic, readwrite, copy) NSString *picID;
@property (nonatomic, readwrite, copy) NSString *objectID;
@property (nonatomic, readwrite, assign) int photoTag;
/// < YES:固定为方形 NO:原始宽高比
@property (nonatomic, readwrite, assign) BOOL keepSize;
/// < w:180
@property (nonatomic, readwrite, strong) FSLPictureMetadata *thumbnail;
/// < w:360 (列表中的缩略图)
@property (nonatomic, readwrite, strong) FSLPictureMetadata *bmiddle;
/// < w:480
@property (nonatomic, readwrite, strong) FSLPictureMetadata *middlePlus;
/// < w:720 (放大查看)
@property (nonatomic, readwrite, strong) FSLPictureMetadata *large;
/// < (查看原图)
@property (nonatomic, readwrite, strong) FSLPictureMetadata *largest;
/// < 原图
@property (nonatomic, readwrite, strong) FSLPictureMetadata *original;
/// 图片标记类型
@property (nonatomic, readwrite, assign) FSLPictureBadgeType badgeType;
@end
