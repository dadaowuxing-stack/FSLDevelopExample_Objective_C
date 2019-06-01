//
//  UIView+YGCommon.h
//  Sales
//
//  Created by Fingal Liu on 2018/12/11.
//  Copyright © 2018 MJB. All rights reserved.
//

#import <UIKit/UIKit.h>

//cell线宽度
#define MCellLineHeight    (Screen_Width > 375.f ? 1/3.0f : 0.5f)

@interface UIView (YGCommon)
/**
 *  画圆角
 */
- (void)setCornerRadius;
/**
 * Finds the first descendant view (including this view) that is a member of a particular class.
 */
- (UIView*)descendantOrSelfWithClass:(Class)cls;
/**
 * Finds the first ancestor view (including this view) that is a member of a particular class.
 */
- (UIView*)ancestorOrSelfWithClass:(Class)cls;
/**
 * Removes all subviews.
 */
- (void)removeAllSubviews;
/**
 * The view controller whose view contains this view.
 */
- (UIViewController*)viewController;
/**
 *  获取子view通过tag
 *
 *  @param tag 标准
 *
 *  @return 返回view
 */
- (id)subviewWithTag:(NSInteger)tag;
/**
 *  获取当前view的controller(利用响应者链)
 *
 *  @return UIViewController
 */
- (UIViewController *)next_viewController;
#pragma mark - View坐标方法
/**
 * Shortcut for frame.origin.x.
 *
 * Sets frame.origin.x = left
 */
@property (nonatomic) CGFloat left;
/**
 * Shortcut for frame.origin.y
 *
 * Sets frame.origin.y = top
 */
@property (nonatomic) CGFloat top;
/**
 * Shortcut for frame.origin.x + frame.size.width
 *
 * Sets frame.origin.x = right - frame.size.width
 */
@property (nonatomic) CGFloat right;
/**
 * Shortcut for frame.origin.y + frame.size.height
 *
 * Sets frame.origin.y = bottom - frame.size.height
 */
@property (nonatomic) CGFloat bottom;
/**
 * Shortcut for frame.size.width
 *
 * Sets frame.size.width = width
 */
@property (nonatomic) CGFloat width;
/**
 * Shortcut for frame.size.height
 *
 * Sets frame.size.height = height
 */
@property (nonatomic) CGFloat height;

/**
 * Shortcut for frame.origin
 */
@property (nonatomic) CGPoint origin;
/**
 * Shortcut for frame.size
 */
@property (nonatomic) CGSize size;

@property (nonatomic) CGFloat centerX;

@property (nonatomic) CGFloat centerY;

@end
