//
//  FSLEmoticonGroup.h
//  WeChat
//
//  Created by senba on 2018/1/20.
//  Copyright © 2018年 CoderMikeHe. All rights reserved.
//

#import "FSLObject.h"
#import "FSLEmoticon.h"

@interface FSLEmoticonGroup : FSLObject
@property (nonatomic, readwrite, copy) NSString *groupID; ///< 例如 com.sina.default
@property (nonatomic, readwrite, assign) NSInteger version;
@property (nonatomic, readwrite, copy) NSString *nameCN; ///< 例如 浪小花
@property (nonatomic, readwrite, copy) NSString *nameEN;
@property (nonatomic, readwrite, copy) NSString *nameTW;
@property (nonatomic, readwrite, assign) NSInteger displayOnly;
@property (nonatomic, readwrite, assign) NSInteger groupType;
@property (nonatomic, readwrite, copy) NSArray<FSLEmoticon *> *emoticons;
@end
