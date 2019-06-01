//
//  NSError+ModelException.m
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/6/1.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#import "NSError+ModelException.h"

// The domain for errors originating from FSLModel.
static NSString * const FSLModelErrorDomain = @"FSLModelErrorDomain";

// An exception was thrown and caught.
static const NSInteger FSLModelErrorExceptionThrown = 1;

// Associated with the NSException that was caught.
static NSString * const FSLModelThrownExceptionErrorKey = @"FSLModelThrownException";

@implementation NSError (FSLModelException)

+ (instancetype)fsl_modelErrorWithException:(NSException *)exception {
    NSParameterAssert(exception != nil);
    
    NSDictionary *userInfo = @{
                               NSLocalizedDescriptionKey: exception.description,
                               NSLocalizedFailureReasonErrorKey: exception.reason,
                               FSLModelThrownExceptionErrorKey: exception
                               };
    
    return [NSError errorWithDomain:FSLModelErrorDomain code:FSLModelErrorExceptionThrown userInfo:userInfo];
}

@end
