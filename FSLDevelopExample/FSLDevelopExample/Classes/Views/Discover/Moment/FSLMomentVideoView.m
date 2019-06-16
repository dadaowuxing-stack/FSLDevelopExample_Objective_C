//
//  FSLMomentVideoView.m
//  WeChat
//
//  Created by Fingal Liu on 2018/2/2.
//  Copyright © 2018年 Fingal Liu. All rights reserved.
//

#import "FSLMomentVideoView.h"
#import "FSLMomentItemViewModel.h"
@interface FSLMomentVideoView ()

/// coverView
@property (nonatomic, readwrite, weak) UIImageView *coverView;

/// playBtn
@property (nonatomic, readwrite, weak) UIButton *playBtn;

/// viewModel
@property (nonatomic, readwrite, strong) FSLMomentItemViewModel *viewModel;
@end


@implementation FSLMomentVideoView

- (void)bindViewModel:(FSLMomentItemViewModel *)viewModel{
    self.viewModel = viewModel;
    self.coverView.image = viewModel.moment.videoInfo.coverImage;
}

+ (instancetype)videoView{
    return [[self alloc] init];
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        // 初始化
        [self _setup];
        
        // 创建自控制器
        [self _setupSubViews];
        
        // 布局子控件
        [self _makeSubViewsConstraints];
    }
    return self;
}

#pragma mark - 初始化
- (void)_setup
{
    
}

#pragma mark - 初始化子空间
- (void)_setupSubViews{
    /// avatarView
    UIImageView *coverView = [[UIImageView alloc] init];
    coverView.userInteractionEnabled = YES;
    self.coverView = coverView;
    [self addSubview:coverView];
    
    
    /// 播放按钮
    UIButton *playBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [playBtn setImage:FSLImageNamed(@"Fav_List_Video_Play_40x40") forState:UIControlStateNormal];
    [playBtn setImage:FSLImageNamed(@"Fav_List_Video_Play_HL_40x40") forState:UIControlStateHighlighted];
    self.playBtn = playBtn;
    [coverView addSubview:playBtn];
}

#pragma mark - 布局子控件
- (void)_makeSubViewsConstraints{
    [self.coverView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
    
    [self.playBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
}


@end
