//
//  FSLCommonGroupViewModel.m
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/6/1.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#import "FSLCommonGroupViewModel.h"

@implementation FSLCommonGroupViewModel

+ (instancetype)groupViewModel{
    return [[self alloc] init];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _footerHeight = 21;
        _headerHeight = CGFLOAT_MIN;
    }
    return self;
}

@end
