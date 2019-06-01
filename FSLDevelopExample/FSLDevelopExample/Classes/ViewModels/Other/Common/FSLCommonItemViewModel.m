//
//  FSLCommonItemViewModel.m
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/6/1.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#import "FSLCommonItemViewModel.h"

@implementation FSLCommonItemViewModel

+ (instancetype)itemViewModelWithTitle:(NSString *)title icon:(NSString *)icon{
    FSLCommonItemViewModel *item = [[self alloc] init];
    item.title = title;
    item.icon = icon;
    return item;
}

+ (instancetype)itemViewModelWithTitle:(NSString *)title{
    return [self itemViewModelWithTitle:title icon:nil];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _selectionStyle = UITableViewCellSelectionStyleGray;
        _rowHeight = 44.0f;
    }
    return self;
}

@end
