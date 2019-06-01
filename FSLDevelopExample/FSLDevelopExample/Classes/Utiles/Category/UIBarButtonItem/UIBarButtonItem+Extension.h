//
//  UIBarButtonItem+Extension.h
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/6/1.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

/// 获取系统颜色
static inline UIColor *FSLBarButtonItemTitleColor(BOOL useSystem) {
    return useSystem ? FSL_MAIN_TEXT_COLOR_2: FSL_MAIN_TEXT_COLOR_2;
}

@interface UIBarButtonItem (Extension)
/**
 通过系统的方法，初始化一个UIBarButtonItem
 
 @param title 显示的文字，例如'完成'、'取消'
 @param titleColor title的颜色，if nil ，The Color is [UIColor whiteColor]
 @param imageName 图片名称
 @param target target
 @param selector selector
 @param textType 是否是纯文字
 @return init a UIBarButtonItem
 */
+ (UIBarButtonItem *)fsl_systemItemWithTitle:(NSString *)title
                                 titleColor:(UIColor *)titleColor
                                  imageName:(NSString *)imageName
                                     target:(id)target
                                   selector:(SEL)selector
                                   textType:(BOOL)textType;


/**
 通过自定义的方法，快速初始化一个UIBarButtonItem，内部是按钮
 
 @param title 显示的文字，例如'完成'、'取消'
 @param titleColor title的颜色，if nil ，The Color is [UIColor whiteColor]
 @param imageName 图片名称
 @param target target
 @param selector selector
 @param contentHorizontalAlignment 文本对齐方向
 @return UIBarButtonItem
 */
+ (UIBarButtonItem *)fsl_customItemWithTitle:(NSString *)title
                                 titleColor:(UIColor *)titleColor
                                  imageName:(NSString *)imageName
                                     target:(id)target
                                   selector:(SEL)selector
                 contentHorizontalAlignment:(UIControlContentHorizontalAlignment)contentHorizontalAlignment;

/**
 快速创建一个导航栏leftBarButtonItem 用于返回（pop）或者（dismiss），切记只能是纯图片 （eg: < or X）
 且可以加大点击范围
 @param title title
 @param imageName 返回按钮的图片
 @param target target
 @param action action
 @return UIBarButtonItem Instance
 */
+ (UIBarButtonItem *)fsl_backItemWithTitle:(NSString *)title
                                imageName:(NSString *)imageName
                                   target:(id)target
                                   action:(SEL)action;


@end
