//
//  FSLProfileInfoMoreCell.h
//  WeChat
//
//  Created by Fingal Liu on 2018/1/29.
//  Copyright © 2018年 Fingal Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FSLProfileInfoMoreCell : UITableViewCell
/// titleLabel
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

+ (instancetype)cellWithTableView:(UITableView *)tableView;
- (void)setIndexPath:(NSIndexPath *)indexPath rowsInSection:(NSInteger)rows;
@end
