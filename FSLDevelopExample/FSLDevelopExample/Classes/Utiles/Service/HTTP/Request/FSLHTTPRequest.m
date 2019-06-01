//
//  FSLHTTPRequest.m
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/6/1.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#import "FSLHTTPRequest.h"
#import "FSLHTTPService.h"

@interface FSLHTTPRequest ()
/// 请求参数
@property (nonatomic, readwrite, strong) FSLURLParameters *urlParameters;

@end

@implementation FSLHTTPRequest

+(instancetype)requestWithParameters:(FSLURLParameters *)parameters{
    return [[self alloc] initRequestWithParameters:parameters];
}

-(instancetype)initRequestWithParameters:(FSLURLParameters *)parameters{
    
    self = [super init];
    if (self) {
        self.urlParameters = parameters;
    }
    return self;
}


@end

/// 网络服务层分类 方便MHHTTPRequest 主动发起请求
@implementation FSLHTTPRequest (FSLHTTPService)
/// 请求数据
-(RACSignal *) enqueueResultClass:(Class /*subclass of FSLObject*/) resultClass {
    return [[FSLHTTPService sharedInstance] enqueueRequest:self resultClass:resultClass];
}
@end
