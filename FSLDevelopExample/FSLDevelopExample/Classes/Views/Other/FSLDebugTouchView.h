//
//  FSLDebugTouchView.h
//  WeChat
//
//  Created by senba on 2017/11/26.
//  Copyright © 2017年 Fingal Liu. All rights reserved.
//  调试指示器 方便测试妹子测试

#import <UIKit/UIKit.h>

@interface FSLDebugTouchView : UIImageView
/// init
FSLSingletonH(Instance);

/// 设置显示or隐藏
- (void)setHide:(BOOL)hide;
- (BOOL)isHide;
@end
