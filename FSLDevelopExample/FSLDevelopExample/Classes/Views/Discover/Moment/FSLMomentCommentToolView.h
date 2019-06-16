//
//  FSLMomentCommentToolView.h
//  WeChat
//
//  Created by Fingal Liu on 2018/1/23.
//  Copyright © 2018年 Fingal Liu. All rights reserved.
//  评论输入框

#import <UIKit/UIKit.h>
#import "FSLReactiveView.h"
@interface FSLMomentCommentToolView : UIView<FSLReactiveView>

/// toHeight (随着文字的输入，FSLMomentCommentToolView 将要到达的高度)
@property (nonatomic, readonly, assign) CGFloat toHeight;

- (BOOL)FSL_canBecomeFirstResponder;    // default is NO
- (BOOL)FSL_becomeFirstResponder;
- (BOOL)FSL_canResignFirstResponder;    // default is YES
- (BOOL)FSL_resignFirstResponder;

@end
