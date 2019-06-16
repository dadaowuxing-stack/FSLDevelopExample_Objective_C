//
//  FSLZoneCodeViewModel.h
//  WeChat
//
//  Created by Fingal Liu on 2017/9/28.
//  Copyright © 2017年 Fingal Liu. All rights reserved.
//

#import "FSLTableViewModel.h"

@interface FSLZoneCodeViewModel : FSLTableViewModel
/// closeCommand
@property (nonatomic, readonly, strong) RACCommand *closeCommand;

@end
