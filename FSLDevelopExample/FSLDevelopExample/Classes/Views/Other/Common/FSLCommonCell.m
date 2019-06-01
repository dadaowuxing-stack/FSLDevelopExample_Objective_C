//
//  FSLCommonCell.m
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/6/1.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#import "FSLCommonCell.h"
#import "FSLCommonArrowItemViewModel.h"
#import "FSLCommonAvatarItemViewModel.h"
#import "FSLCommonQRCodeItemViewModel.h"
#import "FSLCommonLabelItemViewModel.h"
#import "FSLCommonSwitchItemViewModel.h"

@interface FSLCommonCell ()
/// viewModel
@property (nonatomic, readwrite, strong) FSLCommonItemViewModel *viewModel;

/// 箭头
@property (nonatomic, readwrite, strong) UIImageView *rightArrow;
/// 开光
@property (nonatomic, readwrite, strong) UISwitch *rightSwitch;
/// 标签
@property (nonatomic, readwrite, strong) UILabel *rightLabel;
/// avatar 头像
@property (nonatomic, readwrite, weak) UIImageView *avatarView;
/// QrCode
@property (nonatomic, readwrite, weak) UIImageView *qrCodeView;

/// 三条分割线
@property (nonatomic, readwrite, weak) UIImageView *divider0;
@property (nonatomic, readwrite, weak) UIImageView *divider1;
@property (nonatomic, readwrite, weak) UIImageView *divider2;

/// 中间偏左 view
@property (nonatomic, readwrite, weak) UIImageView *centerLeftView;
/// 中间偏右 view
@property (nonatomic, readwrite, weak) UIImageView *centerRightView;
@end


@implementation FSLCommonCell

#pragma mark - 公共方法
+ (instancetype)cellWithTableView:(UITableView *)tableView{
    return [self cellWithTableView:tableView style:UITableViewCellStyleValue1];
}

+ (instancetype)cellWithTableView:(UITableView *)tableView style:(UITableViewCellStyle)style{
    static NSString *ID = @"CommonCell";
    FSLCommonCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[self alloc] initWithStyle:style reuseIdentifier:ID];
    }
    return cell;
}

- (void)setIndexPath:(NSIndexPath *)indexPath rowsInSection:(NSInteger)rows{
    self.divider0.hidden = NO;
    self.divider1.hidden = NO;
    self.divider2.hidden = NO;
    if (rows == 1) {                      /// 一段
        self.divider1.hidden = YES;
    }else if(indexPath.row == 0) {        /// 首行
        self.divider2.hidden = YES;
    }else if(indexPath.row == rows-1) {   /// 末行
        self.divider1.hidden = YES;
        self.divider0.hidden = YES;
    }else{ /// 中间行
        self.divider1.hidden = NO;
        self.divider0.hidden = YES;
        self.divider2.hidden = YES;
    }
}


- (void)bindViewModel:(FSLCommonItemViewModel *)viewModel{
    self.viewModel = viewModel;
    
    self.avatarView.hidden = YES;
    self.qrCodeView.hidden = YES;
    
    self.selectionStyle = viewModel.selectionStyle;
    self.textLabel.text = viewModel.title;
    self.imageView.image = (FSLStringIsNotEmpty(viewModel.icon))?FSLImageNamed(viewModel.icon):nil;
    self.detailTextLabel.text = viewModel.subtitle;
    /// 设置全新
    if (FSLStringIsNotEmpty(viewModel.centerLeftViewName)) {
        self.centerLeftView.hidden = NO;
        self.centerLeftView.image = FSLImageNamed(viewModel.centerLeftViewName);
        self.centerLeftView.size = self.centerLeftView.image.size;
    }else{
        self.centerLeftView.hidden = YES;;
    }
    
    /// 设置锁
    if (FSLStringIsNotEmpty(viewModel.centerRightViewName)) {
        self.centerRightView.hidden = NO;
        self.centerRightView.image = FSLImageNamed(viewModel.centerRightViewName);
        self.centerRightView.size = self.centerRightView.image.size;
    }else{
        self.centerRightView.hidden = YES;;
    }
    
    if ([viewModel isKindOfClass:[FSLCommonArrowItemViewModel class]]) {  /// 纯带箭头
        self.accessoryView = self.rightArrow;
        if ([viewModel isKindOfClass:[FSLCommonAvatarItemViewModel class]]) { // 头像
            FSLCommonAvatarItemViewModel *avatarViewModel = (FSLCommonAvatarItemViewModel *)viewModel;
            self.avatarView.hidden = NO;
            [self.avatarView yy_setImageWithURL:[NSURL URLWithString:avatarViewModel.avatar] placeholder:FSLWebAvatarImagePlaceholder() options:FSLWebImageOptionAutomatic completion:NULL];
        }else if ([viewModel isKindOfClass:[FSLCommonQRCodeItemViewModel class]]){ // 二维码
            self.qrCodeView.hidden = NO;
        }
    }else if([viewModel isKindOfClass:[FSLCommonSwitchItemViewModel class]]){ /// 开关
        // 右边显示开关
        FSLCommonSwitchItemViewModel *switchViewModel = (FSLCommonSwitchItemViewModel *)viewModel;
        self.accessoryView = self.rightSwitch;
        self.rightSwitch.on = !switchViewModel.off;
    }else{
        self.accessoryView = nil;
    }
}
#pragma mark - 私有方法
- (void)awakeFromNib {
    [super awakeFromNib];
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
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
    self.contentView.backgroundColor = [UIColor whiteColor];
    self.detailTextLabel.textColor = FSLColorFromHexString(@"#888888");
    self.detailTextLabel.numberOfLines = 0;
    self.textLabel.font = FSLRegularFont_17;
    self.detailTextLabel.font = FSLRegularFont_16;
}

#pragma mark - 创建自控制器
- (void)_setupSubViews{
    
    /// CoderMikeHe Fixed : 这里需要把divider添加到self，而不是self.contentView ,由于添加了 accessView，导致self.contentView的宽度<self的宽度
    // 分割线
    UIImageView *divider0 = [[UIImageView alloc] init];
    self.divider0 = divider0;
    [self addSubview:divider0];
    UIImageView *divider1 = [[UIImageView alloc] init];
    self.divider1 = divider1;
    [self addSubview:divider1];
    UIImageView *divider2 = [[UIImageView alloc] init];
    self.divider2 = divider2;
    [self addSubview:divider2];
    divider0.backgroundColor = divider1.backgroundColor = divider2.backgroundColor = FSL_MAIN_LINE_COLOR_1;
    
    /// 添加用户头像
    UIImageView *avatarView = [[UIImageView alloc] init];
    self.avatarView = avatarView;
    avatarView.hidden = YES;
    [self.contentView addSubview:avatarView];
    /// 设置圆角+线宽
    [avatarView zy_attachBorderWidth:1.0f color:FSLColorFromHexString(@"#BFBFBF")];
    [avatarView zy_cornerRadiusAdvance:6.0f rectCornerType:UIRectCornerAllCorners];
    
    /// 二维码照片
    UIImageView *qrCodeView = [[UIImageView alloc] initWithImage:FSLImageNamed(@"setting_myQR_18x18")];
    qrCodeView.hidden = YES;
    self.qrCodeView = qrCodeView;
    [self.contentView addSubview:qrCodeView];
    
    /// 中间偏左的图片
    UIImageView *centerLeftView = [[UIImageView alloc] init];
    centerLeftView.hidden = YES;
    self.centerLeftView = centerLeftView;
    [self.contentView addSubview:centerLeftView];
    
    /// 中间偏左的图片
    UIImageView *centerRightView = [[UIImageView alloc] init];
    centerRightView.hidden = YES;
    self.centerRightView = centerRightView;
    [self.contentView addSubview:centerRightView];
}



#pragma mark - 布局子控件
- (void)_makeSubViewsConstraints{
    
    
}

#pragma mark - 布局
- (void)layoutSubviews{
    [super layoutSubviews];
    /// 设置
    if ((fabs(self.textLabel.right - self.detailTextLabel.right) <=.1f)) {
        /// SubTitle
        self.textLabel.bottom = self.detailTextLabel.top;
    }else{
        self.textLabel.centerY = self.height * .5f;
    }
    
    
    self.divider0.frame = CGRectMake(0, 0, self.width, FSLGlobalBottomLineHeight);
    self.divider1.frame = CGRectMake(14, self.height-FSLGlobalBottomLineHeight, self.width-14, FSLGlobalBottomLineHeight);
    self.divider2.frame = CGRectMake(0, self.height-FSLGlobalBottomLineHeight, self.width, FSLGlobalBottomLineHeight);
    
    /// 设置头像
    self.avatarView.size = CGSizeMake(66, 66);
    self.avatarView.right = self.accessoryView.left - 7;
    self.avatarView.centerY = self.height * .5f;
    
    /// 设置二维码
    self.qrCodeView.right = self.accessoryView.left - 11;
    self.qrCodeView.centerY = self.height * .5f;
    
    /// 配置Artboard
    self.centerLeftView.left = self.textLabel.right + 14;
    self.centerLeftView.centerY = self.height * .5f;
    
    /// 配置
    self.centerRightView.right = self.detailTextLabel.left - 5;
    self.centerRightView.centerY = self.height * .5f;
}

#pragma mark - 事件处理
- (void)_switchValueDidiChanged:(UISwitch *)sender{
    FSLCommonSwitchItemViewModel *switchViewModel = (FSLCommonSwitchItemViewModel *)self.viewModel;
    switchViewModel.off = !sender.isOn;
}



#pragma mark - Setter Or Getter
- (UIImageView *)rightArrow{
    if (_rightArrow == nil) {
        _rightArrow = [[UIImageView alloc] initWithImage:FSLImageNamed(@"tableview_arrow_8x13")];
    }
    return _rightArrow;
}

- (UISwitch *)rightSwitch{
    if (_rightSwitch == nil) {
        _rightSwitch = [[UISwitch alloc] init];
        [_rightSwitch addTarget:self action:@selector(_switchValueDidiChanged:) forControlEvents:UIControlEventValueChanged];
    }
    return _rightSwitch;
}


@end
