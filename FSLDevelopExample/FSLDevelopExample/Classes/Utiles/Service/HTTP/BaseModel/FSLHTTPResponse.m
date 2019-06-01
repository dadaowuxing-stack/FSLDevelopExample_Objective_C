//
//  FSLHTTPResponse.m
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/6/1.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#import "FSLHTTPResponse.h"
#import "FSLHTTPServiceConstant.h"

@interface FSLHTTPResponse ()

/// The parsed FSLObject object corresponding to the API response.
/// The developer need care this data
@property (nonatomic, readwrite, strong) id parsedResult;
/// 自己服务器返回的状态码
@property (nonatomic, readwrite, assign) FSLHTTPResponseCode code;
/// 自己服务器返回的信息
@property (nonatomic, readwrite, copy) NSString *msg;
@end

@implementation FSLHTTPResponse

- (instancetype)initWithResponseObject:(id)responseObject parsedResult:(id)parsedResult
{
    self = [super init];
    if (self) {
        self.parsedResult = parsedResult ?:NSNull.null;
        self.code = [responseObject[FSLHTTPServiceResponseCodeKey] integerValue];
        self.msg = responseObject[FSLHTTPServiceResponseMsgKey];
    }
    return self;
}
@end
