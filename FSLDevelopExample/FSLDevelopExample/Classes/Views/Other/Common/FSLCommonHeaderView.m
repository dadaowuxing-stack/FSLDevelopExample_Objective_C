//
//  FSLCommonHeaderView.m
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/6/1.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#import "FSLCommonHeaderView.h"
#import "FSLCommonGroupViewModel.h"

@interface FSLCommonHeaderView ()
/// viewModel
@property (nonatomic, readwrite, strong) FSLCommonGroupViewModel *viewModel;
/// contentLabel
@property (nonatomic, readwrite, weak) UILabel *contentLabel;

@end
@implementation FSLCommonHeaderView
#pragma mark - 公共方法
+ (instancetype)headerViewWithTableView:(UITableView *)tableView{
    static NSString *ID = @"CommonHeader";
    FSLCommonHeaderView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if (header == nil) {
        // 缓存池中没有, 自己创建
        header = [[self alloc] initWithReuseIdentifier:ID];
    }
    return header;
}

- (void)bindViewModel:(FSLCommonGroupViewModel *)viewModel {
    self.viewModel = viewModel;
    
    self.contentLabel.text = viewModel.header;
}

#pragma mark - 私有方法
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
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
- (void)_setup{
    self.contentView.backgroundColor = FSL_MAIN_BACKGROUNDCOLOR;
}

#pragma mark - 创建自控制器
- (void)_setupSubViews{
    // label
    UILabel *contentLabel = [[UILabel alloc] init];
    contentLabel.textColor = FSLColorFromHexString(@"#888888");
    contentLabel.font = FSLRegularFont_14;
    contentLabel.numberOfLines = 0;
    contentLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:contentLabel];
    self.contentLabel = contentLabel;
}



#pragma mark - 布局子控件
- (void)_makeSubViewsConstraints
{
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).with.offset(20);
        make.top.equalTo(self.contentView).with.offset(5);
        make.right.equalTo(self.contentView).with.offset(-20);
    }];
}

@end
