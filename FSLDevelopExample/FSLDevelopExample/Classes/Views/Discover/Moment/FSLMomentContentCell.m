//
//  FSLMomentContentCell.m
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2017/7/16.
//  Copyright © 2017年 Fingal Liu. All rights reserved.
//

#import "FSLMomentContentCell.h"

@interface FSLMomentContentCell ()
/// 正文
@property (nonatomic, readwrite, weak) YYLabel *contentLable;

@property (nonatomic , readwrite , strong) FSLMomentContentItemViewModel *viewModel;
@end

@implementation FSLMomentContentCell

- (void)awakeFromNib {
    [super awakeFromNib];
}



+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"MomentContentCell";
    FSLMomentContentCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self)
    {
        // 初始化
        [self _setup];
        
        // 创建自控制器
        [self _setupSubViews];
    }
    return self;
}

#pragma mark - BindViewModel 子类重写
- (void)bindViewModel:(FSLMomentContentItemViewModel *)viewModel{
    self.viewModel = viewModel;
    /// 文本
    self.contentLable.textLayout = viewModel.contentLableLayout;
    self.contentLable.frame = viewModel.contentLableFrame;
    
    self.selectionStyle = (viewModel.type == FSLMomentContentTypeComment)?UITableViewCellSelectionStyleDefault:UITableViewCellSelectionStyleNone;
    self.divider.hidden = viewModel.type == FSLMomentContentTypeComment;
}

#pragma mark - 初始化
- (void)_setup
{
    // 设置颜色
    self.contentView.backgroundColor = FSLRandomColor;
}

#pragma mark - 创建自控制器
- (void)_setupSubViews{
    /// 点击选中的颜色
    UIView *selectedView = [[UIView alloc] init];
    selectedView.backgroundColor = FSLRandomColor;
    self.selectedBackgroundView = selectedView;
    
    
    /// 正文
    YYLabel *contentLable = [[YYLabel alloc] init];
    contentLable.backgroundColor = self.contentView.backgroundColor;
    /// 垂直方向顶部对齐
    contentLable.textVerticalAlignment = YYTextVerticalAlignmentTop;
    /// 异步渲染和布局
    contentLable.displaysAsynchronously = NO;
    /// 利用textLayout来设置text、font、textColor...
    contentLable.ignoreCommonProperties = YES;
    contentLable.fadeOnAsynchronouslyDisplay = NO;
    contentLable.fadeOnHighlight = NO;
    contentLable.preferredMaxLayoutWidth = FSLMomentCommentViewWidth()-2*FSLMomentCommentViewContentLeftOrRightInset;
    [self.contentView addSubview:contentLable];
    self.contentLable = contentLable;
    
    /// 分割线 
    UIImageView *divider = [[UIImageView alloc] initWithImage:FSLImageNamed(@"wx_albumCommentHorizontalLine_33x1")];
    divider.backgroundColor = FSLRandomColor;
    self.divider = divider;
    [self.contentView addSubview:divider];
    
    
    /// 事件处理
    @weakify(self);
    contentLable.highlightTapAction = ^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
        @strongify(self);
        if (range.location >= text.length) return;
        YYTextHighlight *highlight = [text yy_attribute:YYTextHighlightAttributeName atIndex:range.location];
        NSDictionary *userInfo = highlight.userInfo;
        if (userInfo.count == 0) return;
        /// 回调数据
        [self.viewModel.attributedTapCommand execute:userInfo];
        
    };
    
    
    contentLable.highlightLongPressAction = ^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
        NSLog(@"高亮长按label事件");
    };
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    /// 这里的点击事件 由自己处理
    /// 先记录
    BOOL showKeyboard = FSLSharedAppDelegate.isShowKeyboard;
    /// 然后设置
    FSLSharedAppDelegate.showKeyboard = NO;
    [super touchesBegan:touches withEvent:event];
    FSLSharedAppDelegate.showKeyboard = showKeyboard;
}

#pragma mark - Override
/// PS:重写cell的尺寸 这是评论View关键
- (void)setFrame:(CGRect)frame{
    frame.origin.x = FSLMomentContentLeftOrRightInset+FSLMomentAvatarWH+FSLMomentContentInnerMargin;
    frame.size.width = FSLMomentCommentViewWidth();
    [super setFrame:frame];
}

#pragma mark - 布局
- (void)layoutSubviews{
    [super layoutSubviews];
    self.divider.frame =CGRectMake(0, self.height-WXGlobalBottomLineHeight, self.width, WXGlobalBottomLineHeight);
}



@end
