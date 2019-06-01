//
//  RACSignal+HTTPServiceAdditions.h
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/6/1.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#import <ReactiveCocoa/ReactiveCocoa.h>

// Convenience category to retreive parsedResults from FSLHTTPResponses.
@interface RACSignal (HTTPServiceAdditions)
// This method assumes that the receiver is a signal of FSLHTTPResponses.
//
// Returns a signal that maps the receiver to become a signal of
// FSLHTTPResponses.parsedResult.
- (RACSignal *)fsl_parsedResults;
@end
