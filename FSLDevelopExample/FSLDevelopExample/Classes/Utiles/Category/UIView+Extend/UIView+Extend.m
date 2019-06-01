//
//  UIView+Extend.m
//  Sales
//
//  Created by Fingal Liu on 2018/12/11.
//  Copyright © 2018 MJB. All rights reserved.
//

#import "UIView+Extend.h"
#import <objc/runtime.h>



@implementation UIView (Extend)

- (UIImage *)screenshot {
    return [self screenshotWithRect:self.bounds];
}

- (UIImage *)screenshotWithRect:(CGRect)rect {
    // 下面方法，第一个参数表示区域大小。第二个参数表示是否是非透明的。如果需要显示半透明效果，需要传NO，否则传YES。第三个参数就是屏幕密度了，关键就是第三个参数 [UIScreen mainScreen].scale。
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, [UIScreen mainScreen].scale);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UITapGestureRecognizer *)m_addTapGestureWithTarget:(id)target selector:(SEL)sel {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:target action:sel];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:tap];
    return tap;
}

// Corner Radius
- (void)setM_cornerRadius:(UIEdgeInsets)m_cornerRadius {
    NSValue *value = [NSValue valueWithUIEdgeInsets:m_cornerRadius];
    objc_setAssociatedObject(self, @selector(m_cornerRadius), value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIEdgeInsets)m_cornerRadius {
    NSValue *value = objc_getAssociatedObject(self, @selector(m_cornerRadius));
    if (value == nil) {
        return UIEdgeInsetsZero;
    }
    UIEdgeInsets edges;
    [value getValue:&edges];
    return edges;
}

- (UIView *)m_topLeftCorner {
    UIEdgeInsets edges = self.m_cornerRadius;
    edges.left = 1;
    self.m_cornerRadius = edges;
    return self;
}

- (UIView *)m_bottomLeftCorner {
    UIEdgeInsets edges = self.m_cornerRadius;
    edges.bottom = 1;
    self.m_cornerRadius = edges;
    return self;
}


- (UIView *)m_topRightCorner {
    UIEdgeInsets edges = self.m_cornerRadius;
    edges.top = 1;
    self.m_cornerRadius = edges;
    return self;
}


- (UIView *)m_bottomRightCorner {
    UIEdgeInsets edges = self.m_cornerRadius;
    
    edges.right = 1;
    
    self.m_cornerRadius = edges;
    
    return self;
}

- (UIView *)m_allRoundCorner {
    
    UIEdgeInsets edges = UIEdgeInsetsMake(1, 1, 1, 1);
    self.m_cornerRadius = edges;
    return self;
}

- (void) m_resetAllRoundCorner {
    self.layer.mask = nil;
    
    self.m_cornerRadius = UIEdgeInsetsZero;
}

- (void) m_withRadius:(CGFloat)radius {
    UIEdgeInsets edges = self.m_cornerRadius;
    
    UIRectCorner corner = UIRectCornerAllCorners;
    
    if (edges.top == 1) {
        
        corner = UIRectCornerTopRight;
    }
    
    if (edges.left == 1) {
        if (corner){
            corner |= UIRectCornerTopLeft;
        }
        else {
            corner = UIRectCornerTopLeft;
        }
    }
    
    
    if (edges.bottom == 1) {
        
        if (corner) {
            
            corner |= UIRectCornerBottomLeft;
        } else {
            corner = UIRectCornerBottomLeft;
        }
    }
    
    if (edges.right == 1) {
        
        if (corner) {
            corner |= UIRectCornerBottomRight;
        }
        else {
            corner = UIRectCornerBottomRight;
        }
    }
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                              
                              
                                                   byRoundingCorners:corner
                              
                              
                                                         cornerRadii:CGSizeMake(radius/2.0, radius/2.0)];
    
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    
    maskLayer.frame = self.bounds;
    
    maskLayer.path = maskPath.CGPath;
    
    self.layer.mask = maskLayer;
    
    self.m_cornerRadius = UIEdgeInsetsZero;
}

+ (instancetype) m_instance {
    NSString *clazz = NSStringFromClass([self class]);
    
    NSString *path = [[NSBundle mainBundle] pathForResource:clazz ofType:@"nib"];
    
    if (path.length) {
        
        return [NSBundle.mainBundle loadNibNamed:clazz owner:nil options:nil].firstObject;
    }
    return [[self class] new];
}

- (void)m_endEditing {
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}

@end
