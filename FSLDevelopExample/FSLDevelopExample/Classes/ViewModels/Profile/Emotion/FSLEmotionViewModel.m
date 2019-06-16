//
//  FSLEmotionViewModel.m
//  WeChat
//
//  Created by senba on 2017/12/20.
//  Copyright © 2017年 Fingal Liu. All rights reserved.
//

#import "FSLEmotionViewModel.h"
#import "FSLUsefulEmotionViewModel.h"
#import "FSLMoreEmotionViewModel.h"

@implementation FSLEmotionViewModel
- (void)initialize {
    [super initialize];
    
    self.title = @"表情";
    
    FSLUsefulEmotionViewModel *usefulEmotion = [[FSLUsefulEmotionViewModel alloc] initWithServices:self.services params:nil];
    FSLMoreEmotionViewModel *moreEmotion = [[FSLMoreEmotionViewModel alloc] initWithServices:self.services params:nil];
    
    self.viewModels = @[ usefulEmotion, moreEmotion ];
}
@end
