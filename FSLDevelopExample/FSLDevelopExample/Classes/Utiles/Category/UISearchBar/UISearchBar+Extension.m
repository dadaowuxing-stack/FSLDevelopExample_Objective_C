//
//  UISearchBar+Extension.m
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/6/2.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#import "UISearchBar+Extension.h"

@implementation UISearchBar (Extension)

+ (void)load{
    // 修改按钮标题文字属性( 颜色, 大小, 字体)
    [[UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[UISearchBar class]]] setTitleTextAttributes:@{NSForegroundColorAttributeName: FSL_MAIN_TINTCOLOR, NSFontAttributeName: [UIFont systemFontOfSize:16]} forState:UIControlStateNormal];
    // 将searchBar的cancel按钮改成中文的
    [[UIBarButtonItem appearanceWhenContainedIn:[UISearchBar class], nil] setTitle:@"取消"];
}

- (void)fsl_configureSearchBar{
    self.searchBarStyle = UISearchBarStyleProminent;
    self.barStyle = UIBarStyleDefault;
    
    self.barTintColor = FSL_MAIN_BACKGROUNDCOLOR;
    self.tintColor = FSL_MAIN_TINTCOLOR;
    
    /// 去掉SearchBar的上下的黑色细线
    UIImageView *view = [[[self.subviews objectAtIndex:0] subviews] firstObject];
    view.layer.borderColor = FSLColorFromHexString(@"#DFDFDD").CGColor;
    view.layer.borderWidth = 1;
    
    self.backgroundImage = FSLImageNamed(@"widget_searchbar_cell_bg_5x44");
    [self setSearchFieldBackgroundImage:FSLImageNamed(@"widget_searchbar_textfield_17x28") forState:UIControlStateNormal];
    [self setImage:FSLImageNamed(@"SearchContactsBarIcon_20x20") forSearchBarIcon:UISearchBarIconSearch state:UIControlStateNormal];
    
    self.searchTextPositionAdjustment = UIOffsetMake(5, 0);
    self.placeholder = @"搜索";
}


@end
