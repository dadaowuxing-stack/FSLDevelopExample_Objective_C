//
//  FSLMonitorBaseView.m
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/5/31.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#import "FSLMonitorBaseView.h"

@implementation FSLMonitorBaseView

- (void)setDatasource:(FSLWidgetDataSource *)datasource {
    
    _datasource = datasource;
    
    _datasource.delegate = self;
    
    if (_datasource.autoStartMonitoring) {
        
        [_datasource startMonitor];
    }
}

- (void)reloadData {
    
}






- (void)removeFromSuperview {
    [super removeFromSuperview];
    
    [_datasource stopMonitor];
}






-(void)willMoveToSuperview:(UIView *)newSuperview


{
    
    
    [super willMoveToSuperview:newSuperview];
    
    
    if (newSuperview && _datasource.autoStartMonitoring) {
        
        
        [_datasource startMonitor];
        
        
        self.frame = newSuperview.bounds;
        
        
        [self reloadData];
        
        
    }
    
    
}

@end
