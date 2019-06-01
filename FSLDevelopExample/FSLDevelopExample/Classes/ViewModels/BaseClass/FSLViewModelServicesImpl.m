//
//  FSLViewModelServicesImpl.m
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/6/1.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#import "FSLViewModelServicesImpl.h"

@implementation FSLViewModelServicesImpl
@synthesize client = _client;
- (instancetype)init
{
    self = [super init];
    if (self) {
        _client = [FSLHTTPService sharedInstance];
    }
    return self;
}


#pragma mark - SBNavigationProtocol empty operation
- (void)pushViewModel:(FSLViewModel *)viewModel animated:(BOOL)animated {}

- (void)popViewModelAnimated:(BOOL)animated {}

- (void)popToRootViewModelAnimated:(BOOL)animated {}

- (void)presentViewModel:(FSLViewModel *)viewModel animated:(BOOL)animated completion:(VoidBlock)completion {}

- (void)dismissViewModelAnimated:(BOOL)animated completion:(VoidBlock)completion {}

- (void)resetRootViewModel:(FSLViewModel *)viewModel {}

@end
