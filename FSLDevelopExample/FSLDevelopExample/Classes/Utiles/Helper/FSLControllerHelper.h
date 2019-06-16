//
//  FSLControllerHelper.h
//  WeChat
//
//  Created by Fingal Liu on 2017/9/11.
//  Copyright © 2017年 Fingal Liu. All rights reserved.
//  管理视图控制器的工具类

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FSLViewController.h"


@interface FSLControllerHelper : NSObject

/// 获取当前正在显示控制器
+ (UIViewController *)currentViewController;

/// 获取MHNavigationControllerStack管理的栈顶导航栏控制器
+ (UINavigationController *)topNavigationController;

/// 获取MHNavigationControllerStack管理的栈顶导航栏控制器的 顶部控制器，理论上这个应该是 FSLViewController的子类，但是他不一定是当前正在显示的视图控制器
+ (FSLViewController *)topViewController;
@end
