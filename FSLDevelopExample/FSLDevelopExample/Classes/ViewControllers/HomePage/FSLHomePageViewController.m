//
//  FSLHomePageViewController.m
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/6/1.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#import "FSLHomePageViewController.h"
#import "FSLNavigationController.h"
#import "FSLMainFrameViewController.h"
#import "FSLContactsViewController.h"
#import "FSLDiscoverViewController.h"
#import "FSLProfileViewController.h"
@interface FSLHomePageViewController ()
/// viewModel
@property (nonatomic, readonly, strong) FSLHomePageViewModel *viewModel;
@end

@implementation FSLHomePageViewController

@dynamic viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /// 初始化所有的子控制器
    [self _setupAllChildViewController];
    
    /// set delegate
    self.tabBarController.delegate = self;
    
}

#pragma mark - 初始化所有的子视图控制器
- (void)_setupAllChildViewController{
    NSArray *titlesArray = @[@"微信", @"通讯录", @"发现", @"我"];
    NSArray *imageNamesArray = @[@"tabbar_mainframe_25x23",
                                 @"tabbar_contacts_27x23",
                                 @"tabbar_discover_23x23",
                                 @"tabbar_me_23x23"];
    NSArray *selectedImageNamesArray = @[@"tabbar_mainframeHL_25x23",
                                         @"tabbar_contactsHL_27x23",
                                         @"tabbar_discoverHL_23x23",
                                         @"tabbar_meHL_23x23"];
    
    /// 微信会话层
    UINavigationController *mainFrameNavigationController = ({
        FSLMainFrameViewController *mainFrameViewController = [[FSLMainFrameViewController alloc] initWithViewModel:self.viewModel.mainFrameViewModel];
        
        FSLTabBarItemTagType tagType = FSLTabBarItemTagTypeMainFrame;
        /// 配置
        [self _configViewController:mainFrameViewController imageName:imageNamesArray[tagType] selectedImageName:selectedImageNamesArray[tagType] title:titlesArray[tagType] itemTag:tagType];
        /// 添加到导航栏的栈底控制器
        [[FSLNavigationController alloc] initWithRootViewController:mainFrameViewController];
    });
    
    /// 通讯录
    UINavigationController *contactsNavigationController = ({
        FSLContactsViewController *contactsViewController = [[FSLContactsViewController alloc] initWithViewModel:self.viewModel.contactsViewModel];
        
        FSLTabBarItemTagType tagType = FSLTabBarItemTagTypeContacts;
        /// 配置
        [self _configViewController:contactsViewController imageName:imageNamesArray[tagType] selectedImageName:selectedImageNamesArray[tagType] title:titlesArray[tagType] itemTag:tagType];
        
        [[FSLNavigationController alloc] initWithRootViewController:contactsViewController];
    });
    
    /// 发现
    UINavigationController *discoverNavigationController = ({
        FSLDiscoverViewController *discoverViewController = [[FSLDiscoverViewController alloc] initWithViewModel:self.viewModel.discoverViewModel];
        
        FSLTabBarItemTagType tagType = FSLTabBarItemTagTypeDiscover;
        /// 配置
        [self _configViewController:discoverViewController imageName:imageNamesArray[tagType] selectedImageName:selectedImageNamesArray[tagType] title:titlesArray[tagType] itemTag:tagType];
        
        [[FSLNavigationController alloc] initWithRootViewController:discoverViewController];
    });
    
    /// 我的
    UINavigationController *profileNavigationController = ({
        FSLProfileViewController *profileViewController = [[FSLProfileViewController alloc] initWithViewModel:self.viewModel.profileViewModel];
        
        FSLTabBarItemTagType tagType = FSLTabBarItemTagTypeProfile;
        /// 配置
        [self _configViewController:profileViewController imageName:imageNamesArray[tagType] selectedImageName:selectedImageNamesArray[tagType] title:titlesArray[tagType] itemTag:tagType];
        
        [[FSLNavigationController alloc] initWithRootViewController:profileViewController];
    });
    
    /// 添加到tabBarController的子视图
    self.tabBarController.viewControllers = @[ mainFrameNavigationController, contactsNavigationController, discoverNavigationController, profileNavigationController ];
    
    /// 配置栈底
    [FSLSharedAppDelegate.navigationControllerStack pushNavigationController:mainFrameNavigationController];
}

#pragma mark - 配置ViewController
- (void)_configViewController:(UIViewController *)viewController imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName title:(NSString *)title itemTag:(FSLTabBarItemTagType)tagType {
    
    UIImage *image = [UIImage imageNamed:imageName];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewController.tabBarItem.image = image;
    viewController.tabBarItem.tag = tagType;
    
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewController.tabBarItem.selectedImage = selectedImage;
    viewController.tabBarItem.title = title;
    
    NSDictionary *normalAttr = @{NSForegroundColorAttributeName:FSLColorFromHexString(@"#929292"),
                                 NSFontAttributeName:FSLRegularFont_10};
    NSDictionary *selectedAttr = @{NSForegroundColorAttributeName:FSLColorFromHexString(@"#09AA07"),
                                   NSFontAttributeName:FSLRegularFont_10};
    [viewController.tabBarItem setTitleTextAttributes:normalAttr forState:UIControlStateNormal];
    [viewController.tabBarItem setTitleTextAttributes:selectedAttr forState:UIControlStateSelected];
    
    [viewController.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, 0)];
    [viewController.tabBarItem setImageInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
}


//#pragma mark - UITabBarControllerDelegate
//- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
//    /// 需要判断是否登录
//    if ([[self.viewModel.services client] isLogin]) return YES;
//
//    FSLTabBarItemTagType tagType = viewController.tabBarItem.tag;
//
//    switch (tagType) {
//        case FSLTabBarItemTagTypeHome:
//        case FSLTabBarItemTagTypeConsign:
//            return YES;
//            break;
//        case FSLTabBarItemTagTypeMessage:
//        case FSLTabBarItemTagTypeProfile:
//        {
//            @weakify(self);
//            [[self.viewModel.services client] checkLogin:^{
//                @strongify(self);
//                self.tabBarController.selectedViewController = viewController;
//                [self tabBarController:tabBarController didSelectViewController:viewController];
//            } cancel:NULL];
//            return NO;
//        }
//            break;
//    }
//    return NO;
//}
//
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    NSLog(@"viewController   %@  %zd",viewController,viewController.tabBarItem.tag);
    [FSLSharedAppDelegate.navigationControllerStack popNavigationController];
    [FSLSharedAppDelegate.navigationControllerStack pushNavigationController:(UINavigationController *)viewController];
}

@end
