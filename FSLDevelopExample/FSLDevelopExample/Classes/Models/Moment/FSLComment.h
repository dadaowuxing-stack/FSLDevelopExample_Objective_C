//
//  FSLComment.h
//  WeChat
//
//  Created by senba on 2017/12/21.
//  Copyright © 2017年 Fingal Liu. All rights reserved.
/// 一条评论

#import "FSLObject.h"

@interface FSLComment : FSLObject
/// 正文
@property (nonatomic, readwrite, copy) NSString *text;
/// idStr(评论的id)
@property (nonatomic, readwrite, copy) NSString *idstr;
/// momentIdstr(该评论的所处的说说的id)
@property (nonatomic, readwrite, copy) NSString *momentIdstr;
/// 创建时间
@property (nonatomic, readwrite, strong) NSDate *createdAt;
/// 回复:xxx （目标）
@property (nonatomic, readwrite, strong) FSLUser *toUser;
/// xxx: （来源）
@property (nonatomic, readwrite, strong) FSLUser *fromUser;
@end
