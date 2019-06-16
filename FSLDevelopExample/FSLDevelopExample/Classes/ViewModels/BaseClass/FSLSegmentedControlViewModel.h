//
//  FSLSegmentedControlViewModel.h
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/6/16.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#import "FSLViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FSLSegmentedControlViewModel : FSLViewModel

/// 数组
@property (nonatomic, readwrite , copy) NSArray *viewModels;

@end

NS_ASSUME_NONNULL_END
