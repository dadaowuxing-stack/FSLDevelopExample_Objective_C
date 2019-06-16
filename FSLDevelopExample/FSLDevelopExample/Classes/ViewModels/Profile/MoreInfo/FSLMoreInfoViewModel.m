//
//  FSLMoreInfoViewModel.m
//  WeChat
//
//  Created by senba on 2017/9/21.
//  Copyright © 2017年 Fingal Liu. All rights reserved.
//

#import "FSLMoreInfoViewModel.h"
#import "FSLCommonArrowItemViewModel.h"
#import "FSLFeatureSignatureViewModel.h"
#import "FSLLocationViewModel.h"
#import "FSLGenderViewModel.h"
@interface FSLMoreInfoViewModel ()
/// The current ‘User’
@property (nonatomic, readwrite, strong) FSLUser *user;
@end

@implementation FSLMoreInfoViewModel

- (void)initialize{
    [super initialize];
    @weakify(self);
    self.title = nil;
    
    self.user = [self.services client].currentUser;
    
    /// 第一组
    FSLCommonGroupViewModel *group0 = [FSLCommonGroupViewModel groupViewModel];
    /// 性别
    FSLCommonArrowItemViewModel *gender = [FSLCommonArrowItemViewModel itemViewModelWithTitle:@"性别"];
    gender.subtitle = (self.user.gender == FSLUserGenderTypeMale)?@"男":@"女";
    @weakify(gender);
    gender.operation = ^{
        @strongify(self);
        @strongify(gender);
        FSLGenderViewModel *viewModel = [[FSLGenderViewModel alloc] initWithServices:self.services params:@{FSLViewModelIDKey:[NSString stringWithFormat:@"%zd",self.user.gender]}];
        [self.services presentViewModel:viewModel animated:YES completion:NULL];
        
        /// 设置block
        @weakify(self);
        @weakify(gender);
        viewModel.callback = ^(NSString *output) {
            @strongify(self);
            @strongify(gender);
            self.user.gender = output.integerValue;
            [[self.services client] saveUser:self.user];
            gender.subtitle = (self.user.gender == FSLUserGenderTypeMale)?@"男":@"女";
            // “手动触发self.dataSource的KVO”，必写。
            [self willChangeValueForKey:@"dataSource"];
            // “手动触发self.now的KVO”，必写。
            [self didChangeValueForKey:@"dataSource"];
        };
    };
    
    /// 区域
    FSLCommonArrowItemViewModel *location = [FSLCommonArrowItemViewModel itemViewModelWithTitle:@"地区"];
    location.subtitle = @"广东 深圳";
    location.operation = ^{
        @strongify(self);
        FSLLocationViewModel *viewModel = [[FSLLocationViewModel alloc] initWithServices:self.services params:nil];
        [self.services presentViewModel:viewModel animated:YES completion:NULL];
    };
    /// 个性签名
    FSLCommonArrowItemViewModel *featureSignature = [FSLCommonArrowItemViewModel itemViewModelWithTitle:@"个性签名"];
    featureSignature.subtitle = self.user.featureSignature;
    CGFloat limitWidth = FSL_SCREEN_WIDTH - 123.0f - 35.0f;
    CGFloat rowHeight = [featureSignature.subtitle fsl_sizeWithFont:FSLRegularFont_16 limitWidth:limitWidth].height + 22.0f;
    featureSignature.rowHeight = (rowHeight > 44.0f)?rowHeight:44.0f;
    @weakify(featureSignature);
    featureSignature.operation = ^{
        @strongify(self);
        @strongify(featureSignature);
        NSString *value = FSLStringIsNotEmpty(self.user.featureSignature)?self.user.featureSignature:@"";
        FSLFeatureSignatureViewModel *viewModel = [[FSLFeatureSignatureViewModel alloc] initWithServices:self.services params:@{FSLViewModelUtilKey:value}];
        [self.services presentViewModel:viewModel animated:YES completion:NULL];
        /// 设置block
        @weakify(self);
        @weakify(featureSignature);
        viewModel.callback = ^(NSString *output) {
            @strongify(self);
            @strongify(featureSignature);
            self.user.featureSignature = output;
            [[self.services client] saveUser:self.user];
            featureSignature.subtitle = output;
            CGFloat rowHeight = [featureSignature.subtitle fsl_sizeWithFont:FSLRegularFont_16 limitWidth:limitWidth].height + 22.0f;
            featureSignature.rowHeight = (rowHeight > 44.0f)?rowHeight:44.0f;
            // “手动触发self.dataSource的KVO”，必写。
            [self willChangeValueForKey:@"dataSource"];
            // “手动触发self.now的KVO”，必写。
            [self didChangeValueForKey:@"dataSource"];
        };
    };
    
    
    /// 更多
    group0.itemViewModels = @[gender , location , featureSignature];
    self.dataSource = @[group0];
}
@end
