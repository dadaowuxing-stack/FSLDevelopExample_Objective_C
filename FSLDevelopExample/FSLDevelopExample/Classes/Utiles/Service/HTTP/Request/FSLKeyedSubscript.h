//
//  FSLKeyedSubscript.h
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/6/1.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FSLKeyedSubscript : NSObject
/// 类方法
+ (instancetype) subscript;
/// 拼接一个字典
+ (instancetype)subscriptWithDictionary:(NSDictionary *) dict;
-(instancetype)initWithDictionary:(NSDictionary *) dict;
- (id)objectForKeyedSubscript:(id)key;
- (void)setObject:(id)obj forKeyedSubscript:(id <NSCopying>)key;

/// 转换为字典
- (NSDictionary *)dictionary;
@end
