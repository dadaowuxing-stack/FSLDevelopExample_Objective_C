//
//  FSLMomentVideoView.h
//  WeChat
//
//  Created by Fingal Liu on 2018/2/2.
//  Copyright © 2018年 Fingal Liu. All rights reserved.
//  短视频的View

#import <UIKit/UIKit.h>
#import "FSLReactiveView.h"
@interface FSLMomentVideoView : UIView<FSLReactiveView>
+ (instancetype)videoView;
@end
