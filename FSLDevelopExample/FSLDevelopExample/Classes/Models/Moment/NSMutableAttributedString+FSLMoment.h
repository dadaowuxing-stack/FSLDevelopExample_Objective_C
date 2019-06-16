//
//  NSMutableAttributedString+FSLMoment.h
//  WeChat
//
//  Created by Fingal Liu on 2018/1/22.
//  Copyright © 2018年 Fingal Liu. All rights reserved.
//  主要用于微博内容的公共处理

#import <Foundation/Foundation.h>

@interface NSMutableAttributedString (FSLMoment)
/// 内容正则（链接 ， 表情 ， 手机号） fontSize： 表情的字体大小
- (void)fsl_regexContentWithWithEmojiImageFontSize:(CGFloat)fontSize;
@end
