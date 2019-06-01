//
//  FSLWDataSourceMomery.m
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/5/31.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#import "FSLWDataSourceMomery.h"
#import <mach/mach.h>

@implementation FSLWDataSourceMomery

- (void)timerTick {
    
    float usage = [self getMemoryUsage];
    [self addDataSource:@(usage)];
}

- (float)getMemoryUsage {
    
    task_basic_info_data_t taskInfo;
    
    mach_msg_type_number_t infoCount = TASK_BASIC_INFO_COUNT;
    
    kern_return_t kernReturn = task_info(mach_task_self(), TASK_BASIC_INFO, (task_info_t)&taskInfo, &infoCount);
    
    if(kernReturn != KERN_SUCCESS) {
        
        return 0;
    }
    
    return taskInfo.resident_size / 1024.0 / 1024.0;
}

@end
