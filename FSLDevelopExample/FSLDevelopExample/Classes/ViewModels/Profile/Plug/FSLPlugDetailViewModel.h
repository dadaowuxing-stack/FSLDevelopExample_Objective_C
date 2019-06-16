//
//  FSLPlugDetailViewModel.h
//  WeChat
//
//  Created by senba on 2017/10/16.
//  Copyright © 2017年 Fingal Liu. All rights reserved.
//

#import "FSLViewModel.h"

@interface FSLPlugDetailViewModel : FSLViewModel
/// type
@property (nonatomic, readonly, assign) FSLPlugDetailType type;

/// feedbackCommand
@property (nonatomic, readonly, strong) RACCommand *feedbackCommand;
@end
