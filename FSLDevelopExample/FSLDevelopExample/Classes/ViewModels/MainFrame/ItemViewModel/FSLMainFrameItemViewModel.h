//
//  FSLMainFrameItemViewModel.h
//  WeChat
//
//  Created by Fingal Liu on 2017/10/20.
//  Copyright © 2017年 Fingal Liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FSLLiveRoom.h"
@interface FSLMainFrameItemViewModel : NSObject

/// LiveRoom
@property (nonatomic, readonly, strong) FSLLiveRoom *liveRoom;

/// girlStar
@property (nonatomic, readonly, copy) NSString *girlStar;

/// 观众人数
@property (nonatomic, readonly, copy) NSAttributedString *allNumAttr;

/// cellHeight
@property (nonatomic, readonly, assign) CGFloat cellHeight;

/// init
- (instancetype)initWithLiveRoom:(FSLLiveRoom *)liveRoom;
@end
