//
//  FSLMonitorChartView.m
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/5/31.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#import "FSLMonitorChartView.h"
#import "FSLWDataSourceNetwork.h"
#import "UIView+YGCommon.h"

#define mAxisColor        [[UIColor whiteColor] colorWithAlphaComponent:0.40]
#define mCurveColor       [UIColor greenColor]

#define mYStartOffset     10

@interface FSLMonitorChartView ()

//@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) NSArray *datas;

@property (nonatomic, strong) NSMutableArray *yValusArray;

@property (nonatomic, strong) UIView *chartView;

@property (nonatomic, assign) float scale;

@end

@implementation FSLMonitorChartView


- (void)reloadData {
    
    [self reDrawWithArray:self.datasource.datasource.copy];
}

- (void)didUpdateWithDataSource:(NSArray *)datasource {
    
    [self reloadData];
}

- (void)reDrawWithArray:(NSArray *)array {

    if (array.count < 2 || !self.superview) return;
    
    _datas = array;
    
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    [self drawYAxis];
    
    [self drawXAxis];
    
    [self drawCurve];
}

- (void)drawYAxis {
    
    CGFloat maxY = [self getMaxY];
    
    CGFloat minY = self.minimumValueBasedY ? [self getMinY] : 0.0;
 
    CGFloat stepValue = (maxY - minY) / 9.0;
    
    UIView *yAxisView = [[UIView alloc] initWithFrame:CGRectMake(0, mYStartOffset, 50, CGRectGetHeight(self.frame)-mYStartOffset*2)];
    
    [self addSubview:yAxisView];
    
    if (maxY == minY) {
        
        self.scale = CGRectGetHeight(yAxisView.frame) / 20;
    } else {
        
        self.scale = CGRectGetHeight(yAxisView.frame) / (maxY - minY);
    }
    
    self.yValusArray = [NSMutableArray array];

    //竖线
    UIBezierPath *yPath = [UIBezierPath bezierPath];
    
    CGFloat offset = 2;
    
    [yPath moveToPoint:CGPointMake(CGRectGetWidth(yAxisView.frame)-3+offset, 0)];
    
    [yPath addLineToPoint:CGPointMake(CGRectGetWidth(yAxisView.frame)-3+offset, CGRectGetHeight(yAxisView.frame))];
    //箭头
    UIBezierPath *arrowsPath = [UIBezierPath bezierPath];
    
    [arrowsPath moveToPoint:CGPointMake(CGRectGetWidth(yAxisView.frame) - 2 * 3+offset, 6)];
    
    [arrowsPath addLineToPoint:CGPointMake(CGRectGetWidth(yAxisView.frame) - 3+offset, 0)];
    
    [arrowsPath addLineToPoint:CGPointMake(CGRectGetWidth(yAxisView.frame)+offset, 6)];
    
    //刻度
    UIBezierPath *stepPath = [UIBezierPath bezierPath];
    
    for (int i = 0; i < 10 ; i++) {
        
        
        CGFloat yValue = CGRectGetHeight(yAxisView.frame) - (stepValue * i * self.scale);
        
        UILabel *label = [[UILabel alloc] init];
        
        label.textColor = mAxisColor;
        
        label.text = [NSString stringWithFormat:@"%.2f%@", (stepValue*i+minY), self.unit?:@""];
        
        label.font = [UIFont systemFontOfSize:10];
        
        CGSize size = [label.text sizeWithAttributes:@{NSFontAttributeName:label.font}];
        
        label.bounds = CGRectMake(0, 0, size.width, size.height);
        
        label.left = 0;
        
        label.centerY = yValue;
        
        [yAxisView addSubview:label];
        
        UIBezierPath *tmpPath = [UIBezierPath bezierPath];
        
        [tmpPath moveToPoint:CGPointMake(CGRectGetWidth(yAxisView.frame) - 3 - 6, yValue)];
        
        [tmpPath addLineToPoint:CGPointMake(CGRectGetWidth(yAxisView.frame) - 3, yValue)];
        
        [self.yValusArray addObject:@(yValue)];
        
        [stepPath appendPath:tmpPath];
    }
    
    
    
    
    
    [yPath appendPath:arrowsPath];
    
    
    [yPath appendPath:stepPath];
    
    
    
    
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    
    
    layer.frame = yAxisView.bounds;
    
    
    layer.path = yPath.CGPath;
    
    
    layer.lineWidth = 1.0;
    
    
    layer.strokeColor = mAxisColor.CGColor;
    
    
    layer.fillColor = [UIColor clearColor].CGColor;
    
    
    [yAxisView.layer addSublayer:layer];
    
    
    [self addSubview:yAxisView];
    
    
}






- (void)drawXAxis {
    
    
    UIView *chartView = [[UIView alloc] initWithFrame:CGRectMake(50, mYStartOffset, CGRectGetWidth(self.frame)-50, CGRectGetHeight(self.frame)-mYStartOffset*2)];
    
    
    [self addSubview:chartView];
    
    
    self.chartView = chartView;
    
    
    
    
    
    UIBezierPath *xAxisPath = [UIBezierPath bezierPath];
    
    
    [xAxisPath moveToPoint:CGPointMake(-3, CGRectGetHeight(chartView.frame))];
    
    
    [xAxisPath addLineToPoint:CGPointMake(CGRectGetWidth(chartView.frame), CGRectGetHeight(chartView.frame))];
    
    
    
    
    
    UIBezierPath *arrowPath = [UIBezierPath bezierPath];
    
    
    [arrowPath moveToPoint:CGPointMake(CGRectGetWidth(chartView.frame) - 6, CGRectGetHeight(chartView.frame) - 3)];
    
    
    [arrowPath addLineToPoint:CGPointMake(CGRectGetWidth(chartView.frame), CGRectGetHeight(chartView.frame))];
    
    
    [arrowPath addLineToPoint:CGPointMake(CGRectGetWidth(chartView.frame) - 6, CGRectGetHeight(chartView.frame) + 3)];
    
    
    
    
    
    UIBezierPath *paths = [UIBezierPath bezierPath];
    
    
    [paths appendPath:xAxisPath];
    
    
    [paths appendPath:arrowPath];
    
    
    
    
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    
    
    layer.frame = chartView.bounds;
    
    
    layer.path = paths.CGPath;
    
    
    layer.lineWidth = 1.0;
    
    
    layer.strokeColor = mAxisColor.CGColor;
    
    
    layer.fillColor = [UIColor clearColor].CGColor;
    
    
    [chartView.layer addSublayer:layer];
    
    
    
    
    
    //绘制格子
    
    
    UIBezierPath *horiLinePath = [UIBezierPath bezierPath];
    
    
    for (NSNumber *value in self.yValusArray) {
        
        
        UIBezierPath *linePath = [UIBezierPath bezierPath];
        
        
        [linePath moveToPoint:CGPointMake(-3, value.floatValue)];
        
        
        [linePath addLineToPoint:CGPointMake(CGRectGetWidth(chartView.frame), value.floatValue)];
        
        
        [horiLinePath appendPath:linePath];
        
        
    }
    
    
    
    
    
    UIBezierPath *vertiLinePath = [UIBezierPath bezierPath];
    
    
    CGFloat veriGridWidth = CGRectGetWidth(chartView.frame) / self.datas.count;
    
    
    
    
    
    CGFloat minY = [[self.yValusArray lastObject] floatValue];
    
    
    for (int i = 0; i < self.datas.count; i++) {
        
        
        UIBezierPath *linePath = [UIBezierPath bezierPath];
        
        
        [linePath moveToPoint:CGPointMake(veriGridWidth * i, CGRectGetHeight(chartView.frame))];
        
        
        [linePath addLineToPoint:CGPointMake(veriGridWidth * i, minY)];
        
        
        [vertiLinePath appendPath:linePath];
        
        
    }
    
    
    
    
    
    [horiLinePath appendPath:vertiLinePath];
    
    
    
    
    
    CAShapeLayer *horiLayer = [CAShapeLayer layer];
    
    
    horiLayer.frame = chartView.bounds;
    
    
    horiLayer.path = horiLinePath.CGPath;
    
    
    horiLayer.lineWidth = 0.5;
    
    
    horiLayer.strokeColor = mAxisColor.CGColor;
    
    
    horiLayer.fillColor = [UIColor clearColor].CGColor;
    
    
    [chartView.layer addSublayer:horiLayer];
    
    
}






- (void)drawCurve {
    
    
    CGFloat veriGridWidth = CGRectGetWidth(self.chartView.frame) / self.datas.count;
    
    
    UIBezierPath *curvePath = [UIBezierPath bezierPath];
    
    
    UIBezierPath *dots = [UIBezierPath bezierPath];
    
    
    for (int i = 0; i<self.datas.count; i++) {
        
        
        float value = [self.datas[i] floatValue];
        
        
        CGFloat x = veriGridWidth * i;
        
        
        
        
        
        CGFloat minY = self.minimumValueBasedY ? [self getMinY] : 0.0;
        
        
        CGFloat y = (CGRectGetHeight(self.chartView.frame) - (value - minY) * self.scale);
        
        
        
        
        
        UIBezierPath *dotPath = [UIBezierPath bezierPath];
        
        
        [dotPath addArcWithCenter:CGPointMake(x, y) radius:1.0 startAngle:0 endAngle:M_PI * 2 clockwise:NO];
        
        
        [dots appendPath:dotPath];
        
        
        
        
        
        if (i == 0) {
            
            
            [curvePath moveToPoint:CGPointMake(x, y)];
            
            
        } else {
            
            
            [curvePath addLineToPoint:CGPointMake(x, y)];
            
            
        }
        
        
    }
    
    
    
    
    
    [curvePath appendPath:dots];
    
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    
    
    layer.frame = self.chartView.bounds;
    
    
    layer.path = curvePath.CGPath;
    
    
    layer.lineWidth = 1.2;
    
    
    layer.strokeColor = mCurveColor.CGColor;
    
    
    layer.fillColor = [UIColor clearColor].CGColor;
    
    
    layer.lineJoin = kCALineJoinRound;
    
    
    [self.chartView.layer addSublayer:layer];
    
    
}






- (CGFloat)getMaxY {
    
    
    CGFloat temp = 0;
    
    
    for (int i = 0; i < _datas.count; i++) {
        
        
        CGFloat value = [_datas[i] floatValue];
        
        
        temp = temp > value ? temp : value;
        
        
    }
    
    
    return temp ? temp : 1;
    
    
}






- (CGFloat)getMinY {
    
    
    CGFloat temp = [[_datas firstObject] floatValue];
    
    
    for (int i = 0; i < _datas.count; i++) {
        
        
        CGFloat value = [_datas[i] floatValue];
        
        
        temp = temp < value ? temp : value;
        
        
    }
    
    
    return temp;
    
    
}
@end
