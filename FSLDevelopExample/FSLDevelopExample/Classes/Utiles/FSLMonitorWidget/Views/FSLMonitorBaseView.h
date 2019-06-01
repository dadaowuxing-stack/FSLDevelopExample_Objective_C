//
//  FSLMonitorBaseView.h
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/5/31.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FSLWidgetDataSource.h"
#import "FSLDataSourceDelegate.h"

@interface FSLMonitorBaseView : UIView<FSLDataSourceDelegate>

@property (nonatomic, copy) NSString *title;


@property (nonatomic, copy) NSString *unit;

// y 以数据中最低值开始
@property(nonatomic, assign) BOOL minimumValueBasedY;

@property(nonatomic, strong) FSLWidgetDataSource *datasource;

- (void)reloadData;

@end
