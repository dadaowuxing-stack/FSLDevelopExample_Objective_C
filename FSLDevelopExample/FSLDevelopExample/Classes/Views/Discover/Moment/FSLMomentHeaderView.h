//
//  FSLMomentHeaderView.h
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2017/7/7.
//  Copyright © 2017年 Fingal Liu. All rights reserved.
//  微信朋友圈正文 view

#import <UIKit/UIKit.h>
#import "FSLReactiveView.h"

@interface FSLMomentHeaderView : UITableViewHeaderFooterView<FSLReactiveView>
/// 段
@property (nonatomic, readwrite, assign) NSInteger section;

/// generate a header
+ (instancetype)headerViewWithTableView:(UITableView *)tableView;


@end
