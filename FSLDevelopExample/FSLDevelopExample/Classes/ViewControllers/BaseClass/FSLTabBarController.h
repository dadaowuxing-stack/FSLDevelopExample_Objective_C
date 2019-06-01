//
//  FSLTabBarController.h
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/6/1.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#import "FSLViewController.h"

@interface FSLTabBarController : FSLViewController<UITabBarControllerDelegate>

/// The `tabBarController` instance
@property (nonatomic, readonly, strong) UITabBarController *tabBarController;

@end
