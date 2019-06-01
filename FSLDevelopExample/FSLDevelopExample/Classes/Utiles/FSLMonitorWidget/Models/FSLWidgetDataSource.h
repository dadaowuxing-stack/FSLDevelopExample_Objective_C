//
//  FSLWidgetDataSource.h
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/5/31.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FSLDataSourceDelegate.h"

typedef NS_ENUM(NSInteger, FSLWidgetDSType) {
    
    FSLWidgetDSTypeNone = 0,
    FSLWidgetDSTypeCPU = 1,
    FSLWidgetDSTypeMomery,
    FSLWidgetDSTypeNetwork,
    FSLWidgetDSTypeLog
};

@interface FSLWidgetDataSource : NSObject

@property(nonatomic, strong, readonly) NSMutableArray *datasource;

@property(nonatomic, assign) NSTimeInterval timerInterval;  // default 1s  0则不开启计时器

@property(nonatomic, assign) int32_t maxNumberReserved;  // default 22 条数据

- (BOOL)autoStartMonitoring; // default YES;  model生成的时候 就自动开始

//@property(nonatomic, assign) BOOL autoStartMonitoring;
@property(nonatomic, strong) void(^timerTickCallback)(void);

@property(nonatomic, weak) id<FSLDataSourceDelegate> delegate;

@property(nonatomic, assign) FSLWidgetDSType datasourceType;

- (instancetype)initWithType:(FSLWidgetDSType)type;

- (void)addDataSource:(id)object;

- (void)startMonitor;

- (void)stopMonitor;

// timer tick and override in subclass
- (void)timerTick;

@end
