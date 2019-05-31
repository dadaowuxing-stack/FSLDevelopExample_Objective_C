//
//  FSLWidgetWindow.h
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/5/31.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MMonitorBaseView.h"

@interface MWidgetWindow : UIWindow

+ (void)showOrHide;

+ (BOOL)isDisplaying;

+ (instancetype)currentInstance;

// 提前缓存数据la
+ (void)registerDatasource;

//-(void)addItemWithTitle:(NSString *)title view:(MMonitorBaseView *)view;

@end
