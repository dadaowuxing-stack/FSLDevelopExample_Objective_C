//
//  SAMKeychain+Util.h
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/6/1.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#import <SAMKeychain/SAMKeychain.h>

@interface SAMKeychain (Util)
+ (NSString *)rawLogin ;

+ (BOOL)setRawLogin:(NSString *)rawLogin ;

+ (BOOL)deleteRawLogin;



/// 设备ID or UUID
+ (NSString *)deviceId;
@end
