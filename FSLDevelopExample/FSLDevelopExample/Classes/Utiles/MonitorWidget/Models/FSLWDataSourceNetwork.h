//
//  FSLWDataSourceNetwork.h
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/5/31.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#import "FSLWidgetDataSource.h"

@interface MDSNetworkData:NSObject

@property(nonatomic, assign) float upSpeed;


@property(nonatomic, assign) float downSpeed;

- (instancetype)initWithUpSpeed:(float)upSpeed downSpeed:(float)downSpeed;


+ (instancetype)modelWithUpSpeed:(float)upSpeed downSpeed:(float)downSpeed;

@end

@interface FSLWDataSourceNetwork : FSLWidgetDataSource

@property(nonatomic, copy) NSString *usingValueKey;  // @"downSpeed"  @"upSpeed"

@end
