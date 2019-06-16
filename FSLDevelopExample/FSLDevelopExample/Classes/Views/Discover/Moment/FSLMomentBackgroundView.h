//
//  FSLMomentBackgroundView.h
//  WeChat
//
//  Created by Fingal Liu on 2018/1/18.
//  Copyright © 2018年 Fingal Liu. All rights reserved.
//  主要用来 点击或者长按显示背景颜色

#import <UIKit/UIKit.h>

@interface FSLMomentBackgroundView : UIView
/// 基础设置
- (void)setup;
/// 初始化子控件
- (void)setupSubViews;

/// 点击回调
@property (nonatomic, readwrite, copy) void (^touchBlock)(FSLMomentBackgroundView *view);
/// 长按回调
@property (nonatomic, readwrite, copy) void (^longPressBlock)(FSLMomentBackgroundView *view);
@end
