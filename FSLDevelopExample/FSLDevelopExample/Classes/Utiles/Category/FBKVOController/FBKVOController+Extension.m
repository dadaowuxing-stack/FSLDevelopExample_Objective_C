//
//  FBKVOController+Extension.m
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/6/1.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#import "FBKVOController+Extension.h"

@implementation FBKVOController (Extension)

- (void)fsl_observe:(id)object keyPath:(NSString *)keyPath block:(FBKVONotificationBlock)block
{
    [self observe:object keyPath:keyPath options:NSKeyValueObservingOptionInitial|NSKeyValueObservingOptionNew block:block];
}

- (void)fsl_observe:(id)object keyPath:(NSString *)keyPath action:(SEL)action
{
    [self observe:object keyPath:keyPath options:NSKeyValueObservingOptionInitial|NSKeyValueObservingOptionNew action:action];
}
@end
