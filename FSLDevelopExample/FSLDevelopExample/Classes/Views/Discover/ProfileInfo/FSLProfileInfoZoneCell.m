//
//  FSLProfileInfoZoneCell.m
//  WeChat
//
//  Created by Fingal Liu on 2018/1/29.
//  Copyright © 2018年 Fingal Liu. All rights reserved.
//

#import "FSLProfileInfoZoneCell.h"

@implementation FSLProfileInfoZoneCell
+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *ID = @"ProfileInfoZoneCell";
    FSLProfileInfoZoneCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) cell = [self fsl_viewFromXib];
    return cell;
}
- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
