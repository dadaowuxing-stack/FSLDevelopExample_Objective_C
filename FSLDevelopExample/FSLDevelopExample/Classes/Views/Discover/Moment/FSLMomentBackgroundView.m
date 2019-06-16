//
//  FSLMomentBackgroundView.m
//  WeChat
//
//  Created by Fingal Liu on 2018/1/18.
//  Copyright © 2018年 Fingal Liu. All rights reserved.
//

#import "FSLMomentBackgroundView.h"

@interface FSLMomentBackgroundView ()

@end


@implementation FSLMomentBackgroundView

- (void)awakeFromNib{
    [super awakeFromNib];
    
    /// 初始化
    [self setup];
    
    /// 初始化控件
    [self setupSubViews];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        /// 初始化
        [self setup];
        
        /// 初始化控件
        [self setupSubViews];
    }
    return self;
}


#pragma mark - Private Method
- (void)setup{
    self.backgroundColor = FSLRandomColor;
}

- (void)setupSubViews{
    
    /// 单击手势
    @weakify(self);
    UITapGestureRecognizer *tapGr = [[UITapGestureRecognizer alloc] init];
    [self addGestureRecognizer:tapGr];
    [tapGr.rac_gestureSignal subscribeNext:^(id x) {
        @strongify(self);
        [UIView animateWithDuration:.1 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.backgroundColor = FSLRandomColor;
        } completion:^(BOOL finished) {
            !self.touchBlock ? : self.touchBlock(self);
            self.backgroundColor = FSLRandomColor;
        }];
    }];
    
    /// 长按手势
    UILongPressGestureRecognizer *longGr = [[UILongPressGestureRecognizer alloc] init];
    [self addGestureRecognizer:longGr];
    [longGr.rac_gestureSignal subscribeNext:^(UILongPressGestureRecognizer * gr) {
        @strongify(self);
        
        switch (gr.state) {
            case UIGestureRecognizerStateBegan:
            {
                NSLog(@"-- UIGestureRecognizerStateBegan --");
            }
                break;
            case UIGestureRecognizerStateChanged:
            {
                NSLog(@"-- UIGestureRecognizerStateChanged --");
            }
                break;
            case UIGestureRecognizerStateCancelled:
            {
                NSLog(@"-- UIGestureRecognizerStateCancelled --");
            }
                break;
            case UIGestureRecognizerStateEnded:
            {
                NSLog(@"-- UIGestureRecognizerStateEnded --");
            }
                break;
            case UIGestureRecognizerStateFailed:
            {
                NSLog(@"-- UIGestureRecognizerStateFailed --");
            }
                break;
            default:
                break;
        }
        
        
//        [UIView animateWithDuration:.1 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
//            self.backgroundColor = FSLMomentCommentViewSelectedBackgroundColor;
//        } completion:^(BOOL finished) {
//            !self.touchBlock ? : self.touchBlock(self);
//            self.backgroundColor = FSLMomentCommentViewBackgroundColor;
//        }];
    }];
    
}

- (void)_restBackgroundColor{
    
}

@end
