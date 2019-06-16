//
//  FSLHomePageViewModel.h
//  WeChat
//
//  Created by Fingal Liu on 2017/9/11.
//  Copyright © 2017年 Fingal Liu. All rights reserved.
//  主界面的视图的视图模型

#import "FSLTabBarViewModel.h"
#import "FSLMainFrameViewModel.h"
#import "FSLContactsViewModel.h"
#import "FSLDiscoverViewModel.h"
#import "FSLProfileViewModel.h"
@interface FSLHomePageViewModel : FSLTabBarViewModel
// The view model of `MainFrame` interface.
@property (nonatomic, strong, readonly) FSLMainFrameViewModel *mainFrameViewModel;

// The view model of `contacts` interface.
@property (nonatomic, strong, readonly) FSLContactsViewModel *contactsViewModel;

// The view model of `discover` interface.
@property (nonatomic, strong, readonly) FSLDiscoverViewModel *discoverViewModel;

// The view model of `Profile` interface.
@property (nonatomic, strong, readonly) FSLProfileViewModel *profileViewModel;

@end
