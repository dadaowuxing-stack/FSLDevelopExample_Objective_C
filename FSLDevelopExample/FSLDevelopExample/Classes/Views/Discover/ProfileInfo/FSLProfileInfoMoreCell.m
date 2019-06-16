//
//  FSLProfileInfoMoreCell.m
//  WeChat
//
//  Created by Fingal Liu on 2018/1/29.
//  Copyright © 2018年 Fingal Liu. All rights reserved.
//

#import "FSLProfileInfoMoreCell.h"

@interface FSLProfileInfoMoreCell ()
/// 箭头
@property (nonatomic, readwrite, strong) UIImageView *rightArrow;
/// 三条分割线
@property (nonatomic, readwrite, weak) UIImageView *divider0;
@property (nonatomic, readwrite, weak) UIImageView *divider1;
@property (nonatomic, readwrite, weak) UIImageView *divider2;


@end

@implementation FSLProfileInfoMoreCell

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *ID = @"ProfileInfoMoreCell";
    FSLProfileInfoMoreCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) cell = [self fsl_viewFromXib];
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

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.accessoryView = self.rightArrow;
    
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
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

#pragma mark - 布局
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    /// 布局分割线
    self.divider0.frame = CGRectMake(0, 0, self.width, FSLGlobalBottomLineHeight);
    self.divider1.frame = CGRectMake(14, self.height-FSLGlobalBottomLineHeight, self.width-14, FSLGlobalBottomLineHeight);
    self.divider2.frame = CGRectMake(0, self.height-FSLGlobalBottomLineHeight, self.width, FSLGlobalBottomLineHeight);
}


#pragma mark - Setter Or Getter
- (UIImageView *)rightArrow{
    if (_rightArrow == nil) {
        _rightArrow = [[UIImageView alloc] initWithImage:FSLImageNamed(@"tableview_arrow_8x13")];
    }
    return _rightArrow;
}

@end
