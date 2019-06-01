//
//  FSLWidgetDataSource.m
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/5/31.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#import "FSLWidgetDataSource.h"
#import "FSLWDataSourceCPU.h"
#import "FSLWDataSourceLog.h"
#import "FSLWDataSourceMomery.h"
#import "FSLWDataSourceNetwork.h"
#import "NSTimer+MExtension.h"

@interface FSLWidgetDataSource() {
    
}

@property(nonatomic, strong) NSTimer *timer;

@end

@implementation FSLWidgetDataSource

- (instancetype)initWithType:(FSLWidgetDSType)type {
    
    
    Class clazz = [self getSpecificClassWithType:type];
    
    if (clazz) {
        
        FSLWidgetDataSource *object = [[clazz alloc] init];
        
        object.datasourceType = type;
        
        return object;
    }
    
    return nil;
}






- (Class)getSpecificClassWithType:(FSLWidgetDSType)type {
    
    
    switch (type) {
        case FSLWidgetDSTypeCPU:
            return FSLWDataSourceCPU.class;
            break;
        case FSLWidgetDSTypeLog:
            return FSLWDataSourceLog.class;
            break;
        case FSLWidgetDSTypeMomery:
            return FSLWDataSourceMomery.class;
            break;
        case FSLWidgetDSTypeNetwork:
            return FSLWDataSourceNetwork.class;
            break;
        default:
            break;
    }
    return nil;
}

- (instancetype)init {
    
    self = [super init];
    
    if (self) {
        _maxNumberReserved = 22;
        
        _datasource = @[].mutableCopy;
        
        _timerInterval = 1;
    }
    return self;
}

- (BOOL)autoStartMonitoring {  return YES;  }

- (void)timerTick {
    
}

- (void)startTimer {
    if (_timer) {
        [self stopTimer];
    }
    if (_timerInterval <= 0) {
        return;
    }
    
    __weak __typeof(self) weakSelf = self;
    
    _timer = [NSTimer m_scheduledTimerWithTimeInterval:_timerInterval callback:^{
        
        if (weakSelf.timerTickCallback) {
            
            weakSelf.timerTickCallback();
        }
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [weakSelf timerTick];
            
        });
    }];
    
    [_timer fire];
}

- (void)stopTimer {
    
    if (_timer) {
        
        [_timer invalidate];
        _timer = nil;
    }
}

- (void)addDataSource:(id)object {
    
    m_dispatch_on_main_thread_safe(^{
        
        if ([self.delegate respondsToSelector:@selector(willUpdateWithDataSource:)]) {
            [self.delegate willUpdateWithDataSource:self.datasource.copy];
        }
        if (object) {
            if (self.maxNumberReserved && self.datasource.count > self.maxNumberReserved) {
                [self.datasource removeObjectAtIndex:0];
            }
            [self.datasource addObject:object];
        }
        if ([self.delegate respondsToSelector:@selector(didUpdateWithDataSource:)]) {
            
            [self.delegate didUpdateWithDataSource:self.datasource.copy];
        }
    });
}

- (void)dealloc {
    
    [self stopTimer];
}

- (void)stopMonitor {
    
    [self stopTimer];
    
    if ([self.delegate respondsToSelector:@selector(didStopMonitor)]) {
        
        [self.delegate didStopMonitor];
        
    }
}

- (void)startMonitor {
    
    [self startTimer];
    
    if ([self.delegate respondsToSelector:@selector(didStartMonitor)]) {
        
        [self.delegate didStartMonitor];
    }
}

@end
