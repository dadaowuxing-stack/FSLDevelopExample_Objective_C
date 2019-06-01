//
//  FSLMonitorLogView.m
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/5/31.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#import "FSLMonitorLogView.h"
#import "UIView+YGCommon.h"

@interface FSLMonitorLogView()

@property(nonatomic, strong) UITextView *logTextView;

@property(nonatomic, strong) UIButton *clearDataButton;

@end

@implementation FSLMonitorLogView

- (instancetype)init {
    
    self = [super init];
    
    if (self) {
        
        [self setupData];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self setupData];
    }
    
    return self;
}






- (void)setupData {
    
    if (!_logTextView) {
        
        _logTextView = [UITextView new];
        
        _logTextView.text = @"";
        
        _logTextView.backgroundColor = [UIColor clearColor];
        
        _logTextView.editable = NO;
        
        _logTextView.userInteractionEnabled = YES;
        
        _logTextView.textColor = [UIColor whiteColor];
        
        _logTextView.layoutManager.allowsNonContiguousLayout = NO;
        
        _logTextView.selectable = YES;
    }
    if (!_clearDataButton) {
        _clearDataButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_clearDataButton setTitle:@"清除" forState:UIControlStateNormal];
        _clearDataButton.titleLabel.font = [UIFont systemFontOfSize:10];
        _clearDataButton.size = CGSizeMake(34, 25);
        _clearDataButton.backgroundColor = UIColor.clearColor;
        [_clearDataButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        _clearDataButton.layer.borderColor = UIColor.whiteColor.CGColor;
        _clearDataButton.layer.borderWidth = 0.5;
        _clearDataButton.layer.cornerRadius = 3;
    }
    
    [self addSubview:_logTextView];
    [self addSubview:_clearDataButton];
    [_clearDataButton addTarget:self action:@selector(onClickClearButton:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];
    
    if (newSuperview) {
        
        _logTextView.frame = self.bounds;
        _clearDataButton.left = self.width - _clearDataButton.width - 10;
        _clearDataButton.top = 10;
    }
}

- (void)didMoveToSuperview {
    
    
    [super didMoveToSuperview];
    
    [self reloadData];
}

- (void)reloadData {
    
    [self didUpdateWithDataSource:self.datasource.datasource.copy];
}

- (void)didUpdateWithDataSource:(NSArray *)datasource {
    
    if (!datasource.count || !self.superview) {
        
        return;
    }
    
    BOOL scrollBottom = self.logTextView.contentSize.height <= (self.logTextView.contentOffset.y + self.logTextView.height + 50);
    
    self.logTextView.text = [datasource componentsJoinedByString:@"\n"];
    
    if (scrollBottom) {
        
        [_logTextView scrollRangeToVisible:NSMakeRange(_logTextView.text.length, 1)];
    }
}






- (void)onClickClearButton:(UIButton *)sender {
    
    sender.userInteractionEnabled = NO;
    
    [self.datasource.datasource removeAllObjects];
    
    self.logTextView.text = @"";
    
    sender.userInteractionEnabled = YES;
}






- (void)dealloc {
    
    if(self.logTextView.superview) [self.logTextView removeFromSuperview];
    
    if(self.clearDataButton.superview) [self.clearDataButton removeFromSuperview];
    
    self.logTextView = nil;
    
    self.clearDataButton = nil;
}

@end
