//
//  FSLHTTPRequest.h
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/6/1.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FSLURLParameters.h"
#import "RACSignal+HTTPServiceAdditions.h"

@interface FSLHTTPRequest : NSObject
/// 请求参数
@property (nonatomic, readonly, strong) FSLURLParameters *urlParameters;
/**
 获取请求类
 @param parameters  参数模型
 @return 请求类
 */
+(instancetype)requestWithParameters:(FSLURLParameters *)parameters;

@end
/// FSLHTTPService的分类
@interface FSLHTTPRequest (FSLHTTPService)
/// 入队
- (RACSignal *) enqueueResultClass:(Class /*subclass of FSLObject*/) resultClass;

@end
