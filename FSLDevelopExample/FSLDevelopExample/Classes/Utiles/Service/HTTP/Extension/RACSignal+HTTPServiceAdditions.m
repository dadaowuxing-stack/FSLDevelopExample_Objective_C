//
//  RACSignal+HTTPServiceAdditions.m
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/6/1.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#import "RACSignal+HTTPServiceAdditions.h"
#import "FSLHTTPResponse.h"

@implementation RACSignal (FSLHTTPServiceAdditions)

- (RACSignal *)fsl_parsedResults {
    return [self map:^(FSLHTTPResponse *response) {
        NSAssert([response isKindOfClass:FSLHTTPResponse.class], @"Expected %@ to be an FSLHTTPResponse.", response);
        return response.parsedResult;
    }];
}

@end
