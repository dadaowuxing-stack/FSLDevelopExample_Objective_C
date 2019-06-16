//
//  FSLMainFrameViewModel.h
//  WeChat
//
//  Created by Fingal Liu on 2017/9/11.
//  Copyright © 2017年 Fingal Liu. All rights reserved.
//

#import "FSLTableViewModel.h"
#import "FSLMainFrameItemViewModel.h"

@interface FSLMainFrameViewModel : FSLTableViewModel

/// 商品数组 <FSLLiveRoom *>
@property (nonatomic, readonly, copy) NSArray *liveRooms;

@end
