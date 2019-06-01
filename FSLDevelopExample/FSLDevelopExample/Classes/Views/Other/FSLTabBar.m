//
//  FSLTabBar.m
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/6/1.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#import "FSLTabBar.h"

@interface FSLTabBar ()
/// divider
@property (nonatomic, readwrite, weak) UIView *divider ;
@end
@implementation FSLTabBar
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        /// 去掉tabBar的分割线,以及背景图片
        [self setShadowImage:[UIImage new]];
        [self setBackgroundImage:[UIImage fsl_resizableImage:@"tabbarBkg_5x49"]];
        
        /// 添加细线,
        UIView *divider = [[UIView alloc] init];
        divider.backgroundColor = FSLColor(167.0f, 167.0f, 170.0f);
        [self addSubview:divider];
        self.divider = divider;
    }
    return self;
}


#pragma mark - 布局
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self bringSubviewToFront:self.divider];
    self.divider.height = FSLGlobalBottomLineHeight;
    self.divider.width = FSL_SCREEN_WIDTH;
}
@end
