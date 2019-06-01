//
//  NSObject+PLExtension.h
//  Sales
//
//  Created by Fingal Liu on 2018/12/10.
//  Copyright © 2018 MJB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (PLExtension_)

@property(nonatomic, copy) NSString *m_tag;

@end

#if DEBUG

@interface NSDictionary (PLExtension_)

@end

@interface NSArray (PLExtension_)

@end

#endif
