//
//  FSLGeneralViewModel.h
//  WeChat
//
//  Created by Fingal Liu on 2017/12/19.
//  Copyright © 2017年 Fingal Liu. All rights reserved.
//

#import "FSLCommonViewModel.h"

@interface FSLGeneralViewModel : FSLCommonViewModel
/// 清除聊天记录de的命令
@property (nonatomic, readonly, strong) RACCommand *clearChatRecordsCommand;
@end
