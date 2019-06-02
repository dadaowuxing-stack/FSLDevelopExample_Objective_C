//
//  NSAttributedString+Size.m
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/6/2.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#import "NSAttributedString+Size.h"

@implementation NSAttributedString (Size)

- (CGSize)fsl_sizeWithLimitSize:(CGSize)limitSize
{
    CGSize theSize;
    CGRect rect = [self boundingRectWithSize:limitSize options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil];
    theSize.width = ceil(rect.size.width);
    theSize.height = ceil(rect.size.height);
    return theSize;
}

- (CGSize)fsl_sizeWithLimitWidth:(CGFloat)limitWidth
{
    return [self fsl_sizeWithLimitSize:CGSizeMake(limitWidth, MAXFLOAT)];
}

@end
