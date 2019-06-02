//
//  UITextField+Extension.h
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/6/2.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (Extension)

/// 限制最大长度
- (void)fsl_limitMaxLength:(NSInteger)maxLength;

@end

NS_ASSUME_NONNULL_END
