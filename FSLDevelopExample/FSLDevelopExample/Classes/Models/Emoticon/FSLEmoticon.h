//
//  FSLEmoticon.h
//  WeChat
//
//  Created by senba on 2018/1/20.
//  Copyright © 2018年 CoderMikeHe. All rights reserved.
//

#import "FSLObject.h"
@class FSLEmoticonGroup;

/// 表情类型
typedef NS_ENUM(NSUInteger, FSLEmoticonType) {
    FSLEmoticonTypeImage = 0, ///< 图片表情
    FSLEmoticonTypeEmoji = 1, ///< Emoji表情
};

@interface FSLEmoticon : FSLObject
@property (nonatomic, readwrite, copy) NSString *chs;  ///< 例如 [吃惊]
@property (nonatomic, readwrite, copy) NSString *cht;  ///< 例如 [吃驚]
@property (nonatomic, readwrite, copy) NSString *gif;  ///< 例如 d_chijing.gif
@property (nonatomic, readwrite, copy) NSString *png;  ///< 例如 d_chijing.png
@property (nonatomic, readwrite, copy) NSString *code; ///< 例如 0x1f60d
@property (nonatomic, readwrite, assign) FSLEmoticonType type;
@property (nonatomic, readwrite, weak) FSLEmoticonGroup *group;
@end
