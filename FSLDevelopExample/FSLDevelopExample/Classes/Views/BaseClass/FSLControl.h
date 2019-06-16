//
//  FSLControl.h
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/6/16.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YYGestureRecognizer.h"

NS_ASSUME_NONNULL_BEGIN

@interface FSLControl : UIView

/// 图片
@property (nonatomic, readwrite , strong) UIImage *image;

/// 点击回调
@property (nonatomic, readwrite, copy) void (^touchBlock)(FSLControl *view, YYGestureRecognizerState state, NSSet *touches, UIEvent *event);
/// 长按回调
@property (nonatomic, readwrite, copy) void (^longPressBlock)(FSLControl *view, CGPoint point);

@end

NS_ASSUME_NONNULL_END
