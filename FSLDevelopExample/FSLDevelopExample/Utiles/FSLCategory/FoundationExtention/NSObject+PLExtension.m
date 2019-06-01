//
//  NSObject+PLExtension.m
//  Sales
//
//  Created by Fingal Liu on 2018/12/10.
//  Copyright © 2018 MJB. All rights reserved.
//

#import "NSObject+PLExtension.h"
#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@implementation NSObject (PLExtension_)

- (void)setM_tag:(NSString *)m_tag {
    objc_setAssociatedObject(self, @selector(m_tag), m_tag, OBJC_ASSOCIATION_COPY);
}

- (NSString *)m_tag {
    
    
    return objc_getAssociatedObject(self, _cmd);
}

@end

#if DEBUG

@implementation NSDictionary (PLExtension_)

- (NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level {
    
    
    return [self descriptionWithLocale:locale];
}






- (NSString *)descriptionWithLocale:(id)locale


{
    
    
    NSDictionary *dict = self;
    
    
    NSError *err = self[@"NSUnderlyingError"];
    
    
    if (err) {
        
        
        NSMutableDictionary *mdict = [err.userInfo mutableCopy];
        
        
        [err.userInfo.allKeys enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            
            if ([@"com.alamofire.serialization.response.error.data" isEqualToString:obj]) {
                
                
                [mdict removeObjectForKey:obj];
                
                
                return;
                
                
            }
            
            
            if ([obj isKindOfClass:NSString.class]) {
                
                
                id value = mdict[obj];
                
                
                [mdict setObject:[value description] forKey:obj];
                
                
            } if ([obj isKindOfClass:UIImage.class]) {
                
                
                [mdict removeObjectForKey:obj];
                
                
                [mdict setObject:@"这是一张图片" forKey:obj];
                
                
            } else {
                
                
                NSString *key = [obj description];
                
                
                id value = mdict[obj];
                
                
                [mdict removeObjectForKey:obj];
                
                
                if(value && ![value isKindOfClass:NSData.class]) {
                    
                    
                    [mdict setValue:value forKey:key];
                    
                    
                }
                
                
            }
            
            
        }];
        
        
        dict = mdict;
        
        
    }
    
    
    NSError *error;
    
    
    NSString *string = nil;
    
    
    if([NSJSONSerialization isValidJSONObject:dict]) {
        
        
        NSData *data = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
        
        
        string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        
        
        if (error) {
            
            
            string = [NSString stringWithFormat:@"解析Dictionary失败 -- %@", error];
            
            
        }
        
        
    }
    
    
    return string;
    
    
}






@end










@implementation NSArray (PLExtension_)






- (NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level


{
    
    
    return [self descriptionWithLocale:locale];
    
    
}






- (NSString *)descriptionWithLocale:(id)locale


{
    
    
    NSMutableString *string = [NSMutableString string];
    
    
    
    
    
    [string appendString:@"[\n"];
    
    
    
    
    
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        
        [string appendFormat:@"\t%@,\n", obj];
        
        
    }];
    
    
    
    
    
    [string appendString:@"]"];
    
    
    
    
    
    // 查找最后一个逗号
    
    
    NSRange range = [string rangeOfString:@"," options:NSBackwardsSearch];
    
    
    if (range.location != NSNotFound)
        
        
        [string deleteCharactersInRange:range];
    
    
    
    
    
    return string;
    
    
}










@end










#endif
