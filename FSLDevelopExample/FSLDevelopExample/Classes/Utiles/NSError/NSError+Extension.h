//
//  NSError+Extension.h
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/6/1.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSError (Extension)
+ (NSString *)fsl_tipsFromError:(NSError *)error;
@end
