//
//  FSLMomentPhotoView.m
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2017/7/12.
//  Copyright © 2017年 Fingal Liu. All rights reserved.
//

#import "FSLMomentPhotoView.h"

#import "FSLMomentPhotoItemViewModel.h"
@interface FSLMomentPhotoView ()

/// viewModel
@property (nonatomic, readwrite, strong) FSLMomentPhotoItemViewModel *viewModel;



@end

@implementation FSLMomentPhotoView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.clipsToBounds = YES;
        self.exclusiveTouch = YES;
    }
    return self;
}

- (void)bindViewModel:(FSLMomentPhotoItemViewModel *)viewModel
{
    self.viewModel = viewModel;
    
    /// 设置
    /// 移除动画
    [self.layer removeAnimationForKey:@"contents"];
    
    /// 请求图片
    @weakify(self);
    [self.layer yy_setImageWithURL:viewModel.picture.bmiddle.url
                       placeholder:FSLPicturePlaceholder()
                           options:YYWebImageOptionAvoidSetImage
                        completion:^(UIImage *image, NSURL *url, YYWebImageFromType from, YYWebImageStage stage, NSError *error) {
                              @strongify(self);
                              
                              if (image && stage == YYWebImageStageFinished) {
                                  int width = viewModel.picture.bmiddle.width;
                                  int height = viewModel.picture.bmiddle.height;
                                  CGFloat scale = (height / width) / (self.height / self.width);
                                  if (scale < 0.99 || isnan(scale)) {
                                      // 宽图把左右两边裁掉
                                      self.contentMode = UIViewContentModeScaleAspectFill;
                                      self.layer.contentsRect = CGRectMake(0, 0, 1, 1);
                                  } else {
                                      // 高图只保留顶部
                                      self.contentMode = UIViewContentModeScaleToFill;
                                      self.layer.contentsRect = CGRectMake(0, 0, 1, (float)width / height);
                                  }
                                  self.image = image;
                                  if (from != YYWebImageFromMemoryCacheFast) {
                                      CATransition *transition = [CATransition animation];
                                      transition.duration = 0.15;
                                      transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
                                      transition.type = kCATransitionFade;
                                      [self.layer addAnimation:transition forKey:@"contents"];
                                  }
                              }
                          }];

}


#pragma mark - Override
- (void)setHidden:(BOOL)hidden{
    /// 取消当前图片的请求
    if (hidden) [self.layer yy_cancelCurrentImageRequest];
    
    [super setHidden:hidden];
}
@end
