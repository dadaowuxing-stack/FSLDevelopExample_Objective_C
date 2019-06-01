//
//  FSLHTTPServiceConstant.h
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/6/1.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#ifndef FSLHTTPServiceConstant_h
#define FSLHTTPServiceConstant_h

/// 服务器相关
#define FSLHTTPRequestTokenKey @"token"

/// 私钥key
#define FSLHTTPServiceKey  @"privatekey"
/// 私钥Value
#define FSLHTTPServiceKeyValue @"/** 你的私钥 **/"

/// 签名key
#define FSLHTTPServiceSignKey @"sign"

/// 服务器返回的三个固定字段
/// 状态码key
#define FSLHTTPServiceResponseCodeKey @"code"
/// 消息key
#define FSLHTTPServiceResponseMsgKey    @"msg"
/// 数据data
#define FSLHTTPServiceResponseDataKey   @"data"
/// 数据data{"list":[]}
#define FSLHTTPServiceResponseDataListKey   @"list"

#endif /* FSLHTTPServiceConstant_h */
