//
//  FSLMomentPhotosView.m
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2017/7/7.
//  Copyright © 2017年 Fingal Liu. All rights reserved.
//

#import "FSLMomentPhotosView.h"
#import "FSLMomentPhotoView.h"
#import "FSLMomentItemViewModel.h"
#import "YYPhotoGroupView.h"

@interface FSLMomentPhotosView ()
/// viewModel
@property (nonatomic, readwrite, strong) FSLMomentItemViewModel *viewModel;
@end

@implementation FSLMomentPhotosView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 预先创建9个图片控件 避免动态创建
        for (int i = 0; i<FSLMomentPhotosMaxCount; i++) {
            FSLMomentPhotoView *photoView = [[FSLMomentPhotoView alloc] init];
            photoView.backgroundColor = self.backgroundColor;
            photoView.hidden = YES;
            photoView.tag = i;
            [self addSubview:photoView];
            
            // 添加手势监听器（一个手势监听器 只能 监听对应的一个view）
            UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] init];
            [recognizer addTarget:self action:@selector(_tapPhoto:)];
            [photoView addGestureRecognizer:recognizer];
        }
    }
    return self;
}


/// bind data
- (void)bindViewModel:(FSLMomentItemViewModel *)viewModel
{
    self.viewModel = viewModel;
    
    CGFloat photoViewWH = FSLMomentPhotosViewItemWidth();
    
    /// 设置显示or隐藏以及布局
    NSUInteger count = viewModel.picInfos.count;
    
    if (count==0) [self _hideAllImageViews];
    
    int maxCols = FSLMomentMaxCols(count);
    for (int i = 0; i<FSLMomentPhotosMaxCount; i++) {
        FSLMomentPhotoView *photoView = self.subviews[i];
        
        if (i < count)
        {
            /// 显示隐藏
            photoView.hidden = NO;
            
            if(count == 1)
            {   /// 一张图的情况
                photoView.frame = self.bounds;
            }else{
                /// 其他情况
                photoView.width = photoViewWH;
                photoView.height = photoViewWH;
                photoView.left = (i % maxCols) * (photoViewWH + FSLMomentPhotosViewItemInnerMargin);
                photoView.top = (i / maxCols) * (photoViewWH + FSLMomentPhotosViewItemInnerMargin);
            }
            // 绑定数据
            [photoView bindViewModel:viewModel.picInfos[i]];
            
        } else {
            // 隐藏
            /// 这里我重写了子控件的 hidden方法 目的是取消 图片下载请求
            photoView.hidden = YES;
        }
    }
    
}

/// 隐藏所有图片
- (void)_hideAllImageViews {
    for (FSLMomentPhotoView *imageView in self.subviews) {
        imageView.hidden = YES;
    }
}

#pragma mark - 事件处理
- (void)_tapPhoto:(UITapGestureRecognizer *)sender{
    /// 图片浏览
    NSMutableArray *items = [NSMutableArray new];
    
    CGFloat count = self.viewModel.picInfos.count;
    for (NSUInteger i = 0; i < count; i++) {
        UIView *imgView = self.subviews[i];
        FSLPicture *picture = [self.viewModel.picInfos[i] picture];
        FSLPictureMetadata *meta = picture.largest.badgeType == FSLPictureBadgeTypeGIF ? picture.largest : picture.large;
        YYPhotoGroupItem *item = [YYPhotoGroupItem new];
        item.thumbView = imgView;
        item.largeImageURL = meta.url;
        item.largeImageSize = CGSizeMake(meta.width, meta.height);
        [items addObject:item];
    }
    /// 关闭popView
    [FSLMomentHelper hideAllPopViewWithAnimated:YES];
    
    YYPhotoGroupView *photoBrowser = [[YYPhotoGroupView alloc] initWithGroupItems:items];
    [photoBrowser presentFromImageView:sender.view toContainer:self.window animated:YES completion:NULL];
}


@end
