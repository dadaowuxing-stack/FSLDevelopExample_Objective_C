//
//  FSLBootLoginViewModel.h
//  WeChat
//
//  Created by senba on 2017/9/26.
//  Copyright © 2017年 CoderMikeHe. All rights reserved.
//

#import "FSLViewModel.h"

@interface FSLBootLoginViewModel : FSLViewModel
/// loginCommand
@property (nonatomic, readonly, strong) RACCommand *loginCommand;
/// registerCommand
@property (nonatomic, readonly, strong) RACCommand *registerCommand;
/// languageCommand
@property (nonatomic, readonly, strong) RACCommand *languageCommand;

/// language
@property (nonatomic, readonly, copy) NSString *language;
@end
