//
//  FSLHTTPService+Live.m
//  WeChat
//
//  Created by senba on 2017/10/19.
//  Copyright © 2017年 Fingal Liu. All rights reserved.
//

#import "FSLHTTPService+Live.h"

@implementation FSLHTTPService (Live)
/// 获取直播间列表
- (RACSignal *)fetchLivesWithUseridx:(NSString *)useridx type:(NSInteger)type page:(NSInteger)page lat:(NSNumber *)lat lon:(NSNumber *)lon province:(NSString *)province{
    /// 1. 配置参数
    FSLKeyedSubscript *subscript = [FSLKeyedSubscript subscript];
    subscript[@"useridx"] = useridx;
    subscript[@"type"] = @(type);
    subscript[@"page"] = @(page);
    if (lat == nil) subscript[@"lat"] = @(22.54192103514200);
    if (lon == nil) subscript[@"lon"] = @(113.96939828211362);
    if (province == nil) subscript[@"province"] = @"广东省";
    
    /// 2. 配置参数模型 #define FSL_GET_LIVE_ROOM_LIST  @"Room/GetHotLive_v2"
    FSLURLParameters *paramters = [FSLURLParameters urlParametersWithMethod:FSL_HTTTP_METHOD_GET path:FSL_GET_LIVE_ROOM_LIST parameters:subscript.dictionary];
    
    /// 3.发起请求
    return [[[FSLHTTPRequest requestWithParameters:paramters]
             enqueueResultClass:[FSLLiveRoom class]]
            fsl_parsedResults];
    
    /** 复杂的方式
    /// 配置请求模型
    FSLHTTPRequest *request = [FSLHTTPRequest requestWithParameters:paramters];
    /// 发起请求
    return [[FSLHTTPService sharedInstance] enqueueRequest:request resultClass:[FSLLiveRoom class]];
     */
}


@end
