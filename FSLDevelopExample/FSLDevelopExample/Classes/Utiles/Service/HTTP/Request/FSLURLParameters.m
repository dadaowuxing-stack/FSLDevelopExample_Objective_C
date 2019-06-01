//
//  FSLURLParameters.m
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/6/1.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#import "FSLURLParameters.h"
#import "FSLHTTPService.h"


@implementation SBURLExtendsParameters

+ (instancetype)extendsParameters
{
    return [[self alloc] init];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

- (NSString *)ver{
    static NSString *version = nil;
    if (version == nil) version = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
    return (version.length>0)?version:@"";
}

- (NSString *)token {
    //    NSString *uid = self.uid;
    //    if (FSLStringIsNotEmpty(uid) && FSLStringIsNotEmpty([FSLHTTPService sharedInstance].token)){
    //        NSString *t_token = [NSString stringWithFormat:@"%@-%@",uid,[FSLHTTPService sharedInstance].token];
    //        return t_token;
    //    }
    return @"";//[FSLHTTPService sharedInstance].token;
}

- (NSString *)deviceid {
    static NSString *deviceidStr = nil;
    if (deviceidStr == nil) deviceidStr = [SAMKeychain deviceId];
    return deviceidStr.length>0?deviceidStr:@"";
}

- (NSString *)platform{
    return @"iOS";
}

- (NSString *)channel{
    return @"AppStore";
}

- (NSString *)t {
    return [NSString stringWithFormat:@"%.f", [NSDate date].timeIntervalSince1970];
}

@end

@implementation FSLURLParameters

+(instancetype)urlParametersWithMethod:(NSString *)method path:(NSString *)path parameters:(NSDictionary *)parameters
{
    return [[self alloc] initUrlParametersWithMethod:method path:path parameters:parameters];
}

-(instancetype)initUrlParametersWithMethod:(NSString *)method path:(NSString *)path parameters:(NSDictionary *)parameters
{
    self = [super init];
    if (self) {
        self.method = method;
        self.path = path;
        self.parameters = parameters;
        self.extendsParameters = [[SBURLExtendsParameters alloc] init];
    }
    return self;
}
@end
