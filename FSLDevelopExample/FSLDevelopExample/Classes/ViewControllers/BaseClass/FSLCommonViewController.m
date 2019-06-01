//
//  FSLCommonViewController.m
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/6/1.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#import "FSLCommonViewController.h"
#import "FSLCommonHeaderView.h"
#import "FSLCommonFooterView.h"
#import "FSLCommonCell.h"

@interface FSLCommonViewController ()
/// viewModel
@property (nonatomic, readwrite, strong) FSLCommonViewModel *viewModel;

@end

@implementation FSLCommonViewController

@dynamic viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Override
- (void)bindViewModel{
    [super bindViewModel];
}

- (UIEdgeInsets)contentInset{
    return UIEdgeInsetsMake(FSL_APPLICATION_TOP_BAR_HEIGHT+16, 0, 0, 0);
}

- (void)configureCell:(FSLCommonCell *)cell atIndexPath:(NSIndexPath *)indexPath withObject:(id)object{
    [cell bindViewModel:object];
}

- (UITableViewCell *)tableView:(UITableView *)tableView dequeueReusableCellWithIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath{
    return [FSLCommonCell cellWithTableView:tableView];
}

#pragma mark - UITableViewDelegate & UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.viewModel.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    FSLCommonGroupViewModel *groupViewModel = self.viewModel.dataSource[section];
    return groupViewModel.itemViewModels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    /// fetch cell
    FSLCommonCell *cell = (FSLCommonCell *)[self tableView:tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    FSLCommonGroupViewModel *groupViewModel = self.viewModel.dataSource[indexPath.section];
    id object = groupViewModel.itemViewModels[indexPath.row];
    /// bind model
    [self configureCell:cell atIndexPath:indexPath withObject:(id)object];
    [cell setIndexPath:indexPath rowsInSection:groupViewModel.itemViewModels.count];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    FSLCommonFooterView *footerView = [FSLCommonFooterView footerViewWithTableView:tableView];
    FSLCommonGroupViewModel *groupViewModel = self.viewModel.dataSource[section];
    [footerView bindViewModel:groupViewModel];
    return footerView;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    FSLCommonHeaderView *headerView = [FSLCommonHeaderView headerViewWithTableView:tableView];
    FSLCommonGroupViewModel *groupViewModel = self.viewModel.dataSource[section];
    [headerView bindViewModel:groupViewModel];
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    FSLCommonGroupViewModel *groupViewModel = self.viewModel.dataSource[indexPath.section];
    FSLCommonItemViewModel *itemViewModel = groupViewModel.itemViewModels[indexPath.row];
    return itemViewModel.rowHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    FSLCommonGroupViewModel *groupViewModel = self.viewModel.dataSource[section];
    return groupViewModel.headerHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    FSLCommonGroupViewModel *groupViewModel = self.viewModel.dataSource[section];
    return groupViewModel.footerHeight;
}

@end
