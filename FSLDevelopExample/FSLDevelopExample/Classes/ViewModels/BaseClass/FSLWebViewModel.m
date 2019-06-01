//
//  FSLWebViewModel.m
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/6/1.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#import "FSLWebViewModel.h"

@implementation FSLWebViewModel
- (instancetype)initWithServices:(id<FSLViewModelServices>)services params:(NSDictionary *)params {
    self = [super initWithServices:services params:params];
    if (self) {
        self.request = params[FSLViewModelRequestKey];
    }
    return self;
}
@end
