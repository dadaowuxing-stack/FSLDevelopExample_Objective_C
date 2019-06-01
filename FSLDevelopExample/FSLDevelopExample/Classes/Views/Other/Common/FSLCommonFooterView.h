//
//  FSLCommonFooterView.h
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/6/1.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FSLReactiveView.h"

@interface FSLCommonFooterView : UITableViewHeaderFooterView<FSLReactiveView>
/// init
+ (instancetype)footerViewWithTableView:(UITableView *)tableView;

@end
