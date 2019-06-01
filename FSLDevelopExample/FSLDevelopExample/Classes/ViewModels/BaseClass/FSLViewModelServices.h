//
//  FSLViewModelServices.h
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/6/1.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FSLNavigationProtocol.h"
#import "FSLHTTPService.h"
@protocol FSLViewModelServices <NSObject,FSLNavigationProtocol>
/// A reference to FSLHTTPService instance.
/// 全局通过这个Client来请求数据，处理用户信息
@property (nonatomic, readonly, strong) FSLHTTPService *client;
@end
