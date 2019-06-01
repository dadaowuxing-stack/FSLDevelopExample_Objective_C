//
//  NSTimer+MExtension.h
//  Sales
//
//  Created by Fingal Liu on 2018/12/10.
//  Copyright © 2018 MJB. All rights reserved.
//

#import <UIKit/UIKit.h>






typedef void(^MTimerTickCallback)(void);






@interface MTimerProxy : NSObject






@property(nonatomic, copy) MTimerTickCallback callback;


+(instancetype)modelWithCallback:(MTimerTickCallback)callback;






-(void)timerTick;






@end






@interface NSTimer (MExtension)










/**
 
 
 added to NSDefaultRunLoopMode
 
 
 */


+(NSTimer *)m_timerWithTimeInterval:(NSTimeInterval)interval callback:(MTimerTickCallback)callback;






/**
 
 
 added to NSRunLoopCommonModes
 
 
 */


+(NSTimer *)m_scheduledTimerWithTimeInterval:(NSTimeInterval)ti callback:(MTimerTickCallback)callback;






@end
