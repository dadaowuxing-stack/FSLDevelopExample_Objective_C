//
//  FSLMomentContentCell.h
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2017/7/16.
//  Copyright © 2017年 Fingal Liu. All rights reserved.
//  评论、点赞基类

#import <UIKit/UIKit.h>
#import "FSLReactiveView.h"
#import "FSLMomentContentItemViewModel.h"


@interface FSLMomentContentCell : UITableViewCell<FSLReactiveView>

/// 正文
@property (nonatomic, readonly, weak) YYLabel *contentLable;
/// divider
@property (nonatomic, readwrite, weak) UIImageView *divider;
/// viewModel
@property (nonatomic , readonly , strong) FSLMomentContentItemViewModel *viewModel;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
