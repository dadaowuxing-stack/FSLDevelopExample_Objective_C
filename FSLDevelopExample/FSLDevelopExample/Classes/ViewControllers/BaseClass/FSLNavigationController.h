//
//  FSLNavigationController.h
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/6/1.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FSLNavigationController : UINavigationController

/// 显示导航栏的细线
- (void)showNavigationBottomLine;
/// 隐藏导航栏的细线
- (void)hideNavigationBottomLine;

@end

NS_ASSUME_NONNULL_END
