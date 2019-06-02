//
//  UIView+Extend.h
//  Sales
//
//  Created by Fingal Liu on 2018/12/11.
//  Copyright © 2018 MJB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extend)

- (UIImage *)screenshot;

- (UIImage *)screenshotWithRect:(CGRect)rect;

- (UITapGestureRecognizer *)m_addTapGestureWithTarget:(id)target selector:(SEL)sel;

// Corner Radius
@property(nonatomic, assign) UIEdgeInsets m_cornerRadius;


- (UIView *)m_topLeftCorner;


- (UIView *)m_bottomLeftCorner;


- (UIView *)m_topRightCorner;


- (UIView *)m_bottomRightCorner;


- (UIView *)m_allRoundCorner;


- (void) m_withRadius:(CGFloat)radius;


- (void) m_resetAllRoundCorner;

+ (instancetype) m_instance;

// 强制隐藏键盘
- (void)m_endEditing;

/**
 * 判断一个控件是否真正显示在主窗口
 */
- (BOOL)fsl_isShowingOnKeyWindow;

/**
 * xib创建的view
 */
+ (instancetype)fsl_viewFromXib;

/**
 * xib创建的view
 */
+ (instancetype)fsl_viewFromXibWithFrame:(CGRect)frame;

@end
