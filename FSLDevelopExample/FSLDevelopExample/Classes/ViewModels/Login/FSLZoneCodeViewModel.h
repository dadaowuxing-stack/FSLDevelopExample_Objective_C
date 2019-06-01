//
//  FSLZoneCodeViewModel.h
//  WeChat
//
//  Created by senba on 2017/9/28.
//  Copyright © 2017年 CoderMikeHe. All rights reserved.
//

#import "FSLTableViewModel.h"

@interface FSLZoneCodeViewModel : FSLTableViewModel
/// closeCommand
@property (nonatomic, readonly, strong) RACCommand *closeCommand;

@end
