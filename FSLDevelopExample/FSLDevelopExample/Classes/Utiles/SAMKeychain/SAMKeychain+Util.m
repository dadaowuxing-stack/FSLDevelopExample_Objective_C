//
//  SAMKeychain+Util.m
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/6/1.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#import "SAMKeychain+Util.h"
/// 登录账号的key
static NSString *const FSL_RAW_LOGIN = @"FSLRawLogin";
static NSString *const FSL_SERVICE_NAME_IN_KEYCHAIN = @"com.CoderMikeHe.WeChat";
static NSString *const FSL_DEVICEID_ACCOUNT         = @"DeviceID";

@implementation SAMKeychain (Util)
+ (NSString *)rawLogin {
    return [[NSUserDefaults standardUserDefaults] objectForKey:FSL_RAW_LOGIN];
}
+ (BOOL)setRawLogin:(NSString *)rawLogin {
    if (rawLogin == nil) NSLog(@"+setRawLogin: %@", rawLogin);
    
    [[NSUserDefaults standardUserDefaults] setObject:rawLogin forKey:FSL_RAW_LOGIN];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    return YES;
}
+ (BOOL)deleteRawLogin {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:FSL_RAW_LOGIN];
    [[NSUserDefaults standardUserDefaults] synchronize];
    return YES;
}


+ (NSString *)deviceId{
    NSString * deviceidStr = [SAMKeychain passwordForService:FSL_SERVICE_NAME_IN_KEYCHAIN account:FSL_DEVICEID_ACCOUNT];
    if (deviceidStr == nil) {
        deviceidStr = [UIDevice currentDevice].identifierForVendor.UUIDString;
        [SAMKeychain setPassword:deviceidStr forService:FSL_SERVICE_NAME_IN_KEYCHAIN account:FSL_DEVICEID_ACCOUNT];
    }
    return deviceidStr;
}
@end
