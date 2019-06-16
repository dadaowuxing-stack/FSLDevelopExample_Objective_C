//
//  FSLMomentMessageTipsView.m
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2017/7/14.
//  Copyright © 2017年 Fingal Liu. All rights reserved.
//

#import "FSLMomentMessageTipsView.h"
#import "FSLMomentProfileViewModel.h"
@interface FSLMomentMessageTipsView ()

/// 右箭头
@property (nonatomic, readwrite, weak) UIImageView *rightArrow;

/// viewModel
@property (nonatomic, readwrite, strong) FSLMomentProfileViewModel *viewModel;

@end

@implementation FSLMomentMessageTipsView

+ (instancetype)messageTipsView
{
    return [[self alloc] init];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // 初始化
        [self _setup];
        
        // 创建自控制器
        [self _setupSubViews];
        
    }
    return self;
}

#pragma mark - BindData
- (void)bindViewModel:(FSLMomentProfileViewModel *)viewModel
{
    self.viewModel = viewModel;
    
    [self yy_setImageWithURL:viewModel.unreadUser.profileImageUrl forState:UIControlStateNormal placeholder:FSLDefaultAvatar(FSLDefaultAvatarTypeSmall) options:YYWebImageOptionAllowInvalidSSLCertificates|YYWebImageOptionAllowBackgroundTask completion:nil];
    
    
    
    @weakify(self);
    [[RACObserve(viewModel , unread)
      distinctUntilChanged]
     subscribeNext:^(NSNumber * unread) {
         @strongify(self);
         [self setTitle:viewModel.unreadTips forState:UIControlStateNormal];
     }];
}


#pragma mark - 初始化
- (void)_setup
{
    // 设置颜色
    self.backgroundColor = [UIColor whiteColor];
    
    [self setBackgroundImage:[FSLImageNamed(@"wx_AlbumTimeLineTipBkg_50x40") resizableImageWithCapInsets:UIEdgeInsetsMake(13, 13, 13, 13)] forState:UIControlStateNormal];
    [self setBackgroundImage:[FSLImageNamed(@"wx_AlbumTimeLineTipBkgHL_50x40") resizableImageWithCapInsets:UIEdgeInsetsMake(13, 13, 13, 13)] forState:UIControlStateHighlighted];
    
    /// setup
    self.titleLabel.font = FSLMediumFont(12.0f);
    self.titleLabel.backgroundColor = [UIColor clearColor];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

#pragma mark - 创建自控制器
- (void)_setupSubViews
{
    /// 右箭头
    UIImageView *rightArrow = [[UIImageView alloc] initWithImage:FSLImageNamed(@"wx_albumTimeLineTipArrow_15x15") highlightedImage:FSLImageNamed(@"wx_AlbumTimeLineTipArrowHL_15x15")];
    self.rightArrow = rightArrow;
    [self addSubview:rightArrow];
}

#pragma mark - 布局
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    /// 布局头像
    self.imageView.size = CGSizeMake(FSLMomentProfileViewTipsViewAvatarWH, FSLMomentProfileViewTipsViewAvatarWH);
    self.imageView.left = FSLMomentProfileViewTipsViewInnerInset;
    self.imageView.centerY = self.height * .5f;
    
    
    /// 布局右箭头
    self.rightArrow.left =  self.width - FSLMomentProfileViewTipsViewRightInset - FSLMomentProfileViewTipsViewRightArrowWH;
    self.rightArrow.centerY = self.imageView.centerY ;
    
    
    /// 布局文字
    self.titleLabel.left = CGRectGetMaxX(self.imageView.frame)+FSLMomentProfileViewTipsViewInnerInset;
    self.titleLabel.width = CGRectGetMinX(self.rightArrow.frame)-self.titleLabel.left-FSLMomentProfileViewTipsViewInnerInset;
    self.titleLabel.centerY = self.imageView.centerY ;
    
}
@end
