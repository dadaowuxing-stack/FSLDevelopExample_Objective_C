//
//  FSLCommonSwitchItemViewModel.h
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/6/1.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#import "FSLCommonValueItemViewModel.h"

@interface FSLCommonSwitchItemViewModel : FSLCommonValueItemViewModel

/// 开关状态
@property (nonatomic, readwrite, assign) BOOL off;

@end
