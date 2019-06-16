//
//  FSLPrivacyViewModel.h
//  WeChat
//
//  Created by Fingal Liu on 2017/12/18.
//  Copyright © 2017年 Fingal Liu. All rights reserved.
//

#import "FSLCommonViewModel.h"

@interface FSLPrivacyViewModel : FSLCommonViewModel
/// 软件许可
@property (nonatomic, readonly, strong) RACCommand *softLicenseCommand;
/// 隐私保护
@property (nonatomic, readonly, strong) RACCommand *privateGuardCommand;
@end
