//
//  FSLWDataSourceLog.m
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/5/31.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#import "FSLWDataSourceLog.h"
#import <asl.h>

@interface FSLWDataSourceLog()

@property(nonatomic, copy) NSString *lastMsgId;

@property(nonatomic, assign) BOOL isFetchingLogs;

@end

@implementation FSLWDataSourceLog

- (instancetype)init {
    
    self = [super init];
    
    if (self) {
        
        self.timerInterval = 0;
        
        self.maxNumberReserved = 50;
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(redirectLogNotification:) name:M__LOG__NOTIFICATION object:nil] ;
    }
    return self;
}

- (void)redirectLogNotification:(NSNotification *)nf {
    
    NSString *str = nf.object;
    
    NSString *data = [NSString stringWithFormat:@"%@----%@", NSDate.date, str];
    
    m_dispatch_on_main_thread_safe(^{
        
        if ([str isKindOfClass:NSString.class] && str.length) {
            
            [self addDataSource:data];
        }
    });
}

/*
- (void)redirectNotificationHandle:(NSNotification *)nf {

    NSData *data = [[nf userInfo] objectForKey:NSFileHandleNotificationDataItem];
    NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];

    [self addDataSource:str];
//    NSString *log = [NSString stringWithFormat:@"%@\n%@",self.logTextView.text, str];
//    NSRange range;
//    range.location = [self.logTextView.text length] - 1;
//    range.length = 0;
//    [self.logTextView scrollRangeToVisible:range];

    [[nf object] readInBackgroundAndNotify];
}
 */

/*
- (void)redirectSTD:(int )fd {

    NSPipe * pipe = [NSPipe pipe] ;
    NSFileHandle *pipeReadHandle = [pipe fileHandleForReading] ;
    dup2([[pipe fileHandleForWriting] fileDescriptor], fd) ;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(redirectNotificationHandle:) name:NSFileHandleReadCompletionNotification object:pipeReadHandle];
    [pipeReadHandle readInBackgroundAndNotify];
}
 */

/*
- (void)fetchMessagesForCurrentProcess {
    if (_isFetchingLogs) {
        return;
    }
    _isFetchingLogs = YES;

    asl_object_t query = asl_new(ASL_TYPE_QUERY);
    // Filter for messages from the current process.
    // Note that this appears to happen by default on device, but is required in the simulator.
    NSString *pidString = [NSString stringWithFormat:@"%d", [[NSProcessInfo processInfo] processIdentifier]];
    asl_set_query(query, ASL_KEY_PID, [pidString UTF8String], ASL_QUERY_OP_EQUAL);
    if (_lastMsgId.length) {
        asl_set_query(query, ASL_KEY_MSG_ID, [_lastMsgId UTF8String], ASL_QUERY_OP_GREATER);
    }
    aslresponse response = asl_search(NULL, query);
    aslmsg aslMessage = NULL;
    while ((aslMessage = asl_next(response))) {
        NSString *msg = [self messageFromASLMessage:aslMessage];
        [self addDataSource:msg];
    }
    asl_release(response);
    _isFetchingLogs = NO;
}
*/

/*
- (NSString *)messageFromASLMessage:(aslmsg)aslMessage {
    const char *messageText = asl_get(aslMessage, ASL_KEY_MSG); //NSLog 写入的文本内容
    const char *messageId = asl_get(aslMessage, ASL_KEY_MSG_ID);
    _lastMsgId = [NSString stringWithUTF8String:messageId];  //NSLog Id for next set of log query
    return [NSString stringWithUTF8String:messageText];
}
 */

@end
