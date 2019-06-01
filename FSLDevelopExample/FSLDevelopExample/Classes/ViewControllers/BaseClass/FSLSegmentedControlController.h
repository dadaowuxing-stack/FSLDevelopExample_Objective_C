//
//  FSLSegmentedControlController.h
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/6/1.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#import "FSLViewController.h"
@class FSLSegmentedControlController;

@protocol FSLSegmentedControlControllerDelegate <NSObject>

@optional

- (void)segmentedControlController:(FSLSegmentedControlController *)segmentedControlController didSelectViewController:(UIViewController *)viewController;

@end

@interface FSLSegmentedControlController : FSLViewController

@property (nonatomic, copy) NSArray *viewControllers;
@property (nonatomic, strong, readonly) UISegmentedControl *segmentedControl;
@property (nonatomic, assign) id<FSLSegmentedControlControllerDelegate> delegate;

@end

@interface UIViewController (FSLSegmentedControlItem)

@property (nonatomic, copy) NSString *segmentedControlItem;

@end
