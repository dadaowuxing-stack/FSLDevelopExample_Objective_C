//
//  NSTimer+MExtension.m
//  Sales
//
//  Created by Fingal Liu on 2018/12/10.
//  Copyright © 2018 MJB. All rights reserved.
//

#import "NSTimer+MExtension.h"






@implementation MTimerProxy






-(void)timerTick {
    
    
    if (_callback) {
        
        
        _callback();
        
        
    }
    
    
}






+(instancetype)modelWithCallback:(MTimerTickCallback)callback


{
    
    
    MTimerProxy *model = [MTimerProxy new];
    
    
    model.callback = callback;
    
    
    return model;
    
    
}






- (void)dealloc {
    FSLLog(@"----- MTimerProxy dealloc");
}
@end






@implementation NSTimer (MExtension)






+(NSTimer *)m_timerWithTimeInterval:(NSTimeInterval)interval callback:(MTimerTickCallback)callback


{
    
    
    MTimerProxy *proxy = [MTimerProxy modelWithCallback:callback];
    
    
    NSTimer *_timer = [NSTimer timerWithTimeInterval:interval target:proxy selector:@selector(timerTick) userInfo:nil repeats:YES];
    
    
    [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSDefaultRunLoopMode];
    
    
    return _timer;
    
    
}






+(NSTimer *)m_scheduledTimerWithTimeInterval:(NSTimeInterval)ti callback:(MTimerTickCallback)callback


{
    
    
    MTimerProxy *proxy = [MTimerProxy modelWithCallback:callback];
    
    
    NSTimer *_timer = [NSTimer timerWithTimeInterval:ti target:proxy selector:@selector(timerTick) userInfo:nil repeats:YES];
    
    
    [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    
    
    return _timer;
    
    
}






@end
