//
//  FSLRouter.m
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/6/1.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#import "FSLRouter.h"

@interface FSLRouter ()

/// viewModel到viewController的映射
@property (nonatomic, copy) NSDictionary *viewModelViewMappings;

@end

@implementation FSLRouter

static FSLRouter *sharedInstance_ = nil;

+ (id)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance_ = [super allocWithZone:zone];
    });
    return sharedInstance_;
}

- (id)copyWithZone:(NSZone *)zone
{
    return sharedInstance_;
}

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance_ = [[self alloc] init];
    });
    return sharedInstance_;
}

- (FSLViewController *)viewControllerForViewModel:(FSLViewModel *)viewModel {
    NSString *viewController = self.viewModelViewMappings[NSStringFromClass(viewModel.class)];
    
    NSParameterAssert([NSClassFromString(viewController) isSubclassOfClass:[FSLViewController class]]);
    NSParameterAssert([NSClassFromString(viewController) instancesRespondToSelector:@selector(initWithViewModel:)]);
    
    return [[NSClassFromString(viewController) alloc] initWithViewModel:viewModel];
}


/// 这里是viewModel -> ViewController的映射
/// If You Use Push 、 Present 、 ResetRootViewController ,You Must Config This Dict
- (NSDictionary *)viewModelViewMappings {
    return @{@"FSLNewFeatureViewModel":@"FSLNewFeatureViewController",
             @"FSLHomePageViewModel":@"FSLHomePageViewController",
             @"FSLUserInfoViewModel":@"FSLUserInfoViewController",
             @"FSLMoreInfoViewModel":@"FSLMoreInfoViewController",
             @"FSLFeatureSignatureViewModel":@"FSLFeatureSignatureViewController",
             @"FSLAddFriendsViewModel":@"FSLAddFriendsViewController",
             @"FSLSearchFriendsViewModel":@"FSLSearchFriendsViewController",
             @"FSLAccountLoginViewModel":@"FSLAccountLoginViewController",
             @"FSLBootLoginViewModel":@"FSLBootLoginViewController",
             @"FSLLoginViewModel":@"FSLLoginViewController",
             @"FSLMobileLoginViewModel":@"FSLMobileLoginViewController",
             @"FSLZoneCodeViewModel":@"FSLZoneCodeViewController",
             @"FSLSettingViewModel":@"FSLSettingViewController",
             @"FSLWebViewModel":@"FSLWebViewController",
             @"FSLRegisterViewModel":@"FSLRegisterViewController",
             @"FSLCommitViewModel":@"FSLCommitViewController",
             @"FSLLanguageViewModel":@"FSLLanguageViewController",
             @"FSLModifyNicknameViewModel":@"FSLModifyNicknameViewController",
             @"FSLLocationViewModel":@"FSLLocationViewController",
             @"FSLGenderViewModel":@"FSLGenderViewController",
             @"FSLPlugViewModel":@"FSLPlugViewController",
             @"FSLPlugDetailViewModel":@"FSLPlugDetailViewController",
             @"FSLAccountSecurityViewModel":@"FSLAccountSecurityViewController",
             @"FSLTestViewModel":@"FSLTestViewController",
             @"FSLNotificationViewModel":@"FSLNotificationViewController",
             @"FSLFreeInterruptionViewModel":@"FSLFreeInterruptionViewController",
             @"FSLAboutUsViewModel":@"FSLAboutUsViewController",
             @"FSLPrivacyViewModel":@"FSLPrivacyViewController",
             @"FSLGeneralViewModel":@"FSLGeneralViewController",
             @"FSLEmotionViewModel":@"FSLEmotionViewController",
             @"FSLMomentViewModel":@"FSLMomentViewController",
             @"FSLProfileInfoViewModel":@"FSLProfileInfoViewController"
             };
}

@end
