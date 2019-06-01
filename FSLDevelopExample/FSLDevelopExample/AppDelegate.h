//
//  AppDelegate.h
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/5/31.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FSLNavigationControllerStack.h"
#import "FSLViewModelServicesImpl.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

/// 窗口
@property (strong, nonatomic) UIWindow *window;

/// APP管理的导航栏的堆栈
@property (nonatomic, readonly, strong) FSLNavigationControllerStack *navigationControllerStack;

/// 获取AppDelegate
+ (AppDelegate *)sharedDelegate;

/// 是否已经弹出键盘 主要用于微信朋友圈的判断
@property (nonatomic, readwrite, assign , getter = isShowKeyboard) BOOL showKeyboard;

@end

