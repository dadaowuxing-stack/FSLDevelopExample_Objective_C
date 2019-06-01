//
//  FSLCommonSwitchItemViewModel.m
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/6/1.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#import "FSLCommonSwitchItemViewModel.h"

@implementation FSLCommonSwitchItemViewModel

- (void)setOff:(BOOL)off
{
    _off = off;
    
    //[FSLPreferenceSettingHelper setBool:off forKey:self.key];
}

- (void)setKey:(NSString *)key
{
    [super setKey:key];
    
    //_off = [FSLPreferenceSettingHelper boolForKey:key];
}

@end
