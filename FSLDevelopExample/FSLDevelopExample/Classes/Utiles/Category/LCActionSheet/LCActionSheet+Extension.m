//
//  LCActionSheet+FSLExtension.m
//  WeChat
//
//  Created by senba on 2017/5/22.
//  Copyright © 2017年 Fingal Liu. All rights reserved.
//

#import "LCActionSheet+Extension.h"

@implementation LCActionSheet (Extension)
+ (void)fsl_configureActionSheet
{
    LCActionSheetConfig *config = LCActionSheetConfig.config;
    
    /// 蒙版可点击
    config.darkViewNoTaped = NO;
    config.separatorColor = FSL_MAIN_LINE_COLOR_1;
    config.buttonColor = [UIColor colorFromHexString:@"#3C3E44"];
    config.buttonFont = FSLRegularFont_16;
    config.unBlur = YES;
    config.darkOpacity = .6f;
 
    /// 设置
    config.titleEdgeInsets = UIEdgeInsetsMake(27, 22, 27, 22);
    config.titleFont = FSLRegularFont_13;
    
}
@end
