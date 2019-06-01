//
//  FSLDataSourceDelegate.h
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/5/31.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FSLDataSourceDelegate <NSObject>

@optional

- (void)willUpdateWithDataSource:(NSArray *)datasource;

- (void)didUpdateWithDataSource:(NSArray *)datasource;

- (void)didStartMonitor;

- (void)didStopMonitor;

@end
