//
//  NSError+Extension.m
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/6/1.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#import "NSError+Extension.h"
#import "FSLHTTPService.h"

@implementation NSError (Extension)

+ (NSString *)fsl_tipsFromError:(NSError *)error{
    if (!error) return nil;
    NSString *tipStr = nil;
    /// 这里需要处理HTTP请求的错误
    if (error.userInfo[FSLHTTPServiceErrorDescriptionKey]) {
        tipStr = [error.userInfo objectForKey:FSLHTTPServiceErrorDescriptionKey];
    }else if (error.userInfo[FSLHTTPServiceErrorMessagesKey]) {
        tipStr = [error.userInfo objectForKey:FSLHTTPServiceErrorMessagesKey];
    }else if (error.domain) {
        tipStr = error.localizedFailureReason;
    } else {
        tipStr = error.localizedDescription;
    }
    return tipStr;
}

@end
