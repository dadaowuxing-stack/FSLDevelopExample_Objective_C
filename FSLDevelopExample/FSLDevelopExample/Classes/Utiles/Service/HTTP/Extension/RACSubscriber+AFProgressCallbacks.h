//
//  RACSubscriber+AFProgressCallbacks.h
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/6/1.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#ifdef RAFN_EXPERIMENTAL_PROGRESS_SUPPORT

#import <ReactiveCocoa/ReactiveCocoa.h>

@interface RACSubscriber (AFProgressCallbacks)

+ (instancetype)subscriberWithNext:(void (^)(id x))next progress:(void (^)(float progress))progress error:(void (^)(NSError *error))error completed:(void (^)(void))completed;

- (void)sendProgress:(float)p;

@end

@interface RACSignal (RAFNProgressSubscriptions)


// Convenience method to subscribe to the `progress` and `next` events.
- (RACDisposable *)subscribeProgress:(void (^)(float progress))progress next:(void (^)(id x))nextBlock ;

// Convenience method to subscribe to the `progress`, `next` and `completed` events.
- (RACDisposable *)subscribeProgress:(void (^)(float progress))progress next:(void (^)(id x))nextBlock completed:(void (^)(void))completedBlock;

// Convenience method to subscribe to the `progress`, `next`, `completed`, and `error` events.
- (RACDisposable *)subscribeProgress:(void (^)(float progress))progress next:(void (^)(id x))nextBlock error:(void (^)(NSError *error))errorBlock completed:(void (^)(void))completedBlock;


- (RACDisposable *)subscribeProgress:(void (^)(float progress))progress completed:(void (^)(void))completedBlock;

// Convenience method to subscribe to `progress`, `next` and `error` events.
- (RACDisposable *)subscribeProgress:(void (^)(float progress))progress next:(void (^)(id x))nextBlock error:(void (^)(NSError *error))errorBlock;

// Convenience method to subscribe to `progress`, `error` and `completed` events.
- (RACDisposable *)subscribeProgress:(void (^)(float progress))progress error:(void (^)(NSError *error))errorBlock completed:(void (^)(void))completedBlock;

@end

@interface RACSubject (RAFNProgressSending)

- (void)sendProgress:(float)value;

@end

#endif
