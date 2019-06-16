//
//  FSLMomentViewModel.m
//  WeChat
//
//  Created by Fingal Liu on 2017/12/20.
//  Copyright © 2017年 Fingal Liu. All rights reserved.
//

#import "FSLMomentViewModel.h"
#import "FSLProfileInfoViewModel.h"
#import "FSLWebViewModel.h"
@interface FSLMomentViewModel ()
/// 个人信息头部视图模型
@property (nonatomic, readwrite, strong) FSLMomentProfileViewModel *profileViewModel;

/// 刷新某一个section的 事件回调
@property (nonatomic, readwrite, strong) RACSubject *reloadSectionSubject;

/// 电话号码回调
@property (nonatomic, readwrite, strong) RACSubject *phoneSubject;

/// 评论回调
@property (nonatomic, readwrite, strong) RACSubject *commentSubject;
/// 发送评论内容
@property (nonatomic, readwrite, strong) RACCommand *commentCommand;
/// 删除当前用户的评论
@property (nonatomic, readwrite, strong) RACCommand *delCommentCommand;
/// 删除当前用户的发的说说
@property (nonatomic, readwrite, strong) RACCommand *delMomentCommand;

//// 跳转用户信息的命令
@property (nonatomic, readwrite, strong) RACCommand *profileInfoCommand;

/// 富文本文字上的事件处理
@property (nonatomic, readwrite, strong) RACCommand *attributedTapCommand;
/// 分享view上的点击事件处理
@property (nonatomic, readwrite, strong) RACCommand *shareTapCommand;
@end


@implementation FSLMomentViewModel

- (void)initialize{
    [super initialize];
    
    @weakify(self);
    
    /// 设置tableView的样式
    self.style = UITableViewStyleGrouped;
    /// 隐藏导航栏的细线
    self.prefersNavigationBarBottomLineHidden = YES;
    
    /// 允许下拉刷新+上拉加载
    self.shouldPullDownToRefresh = NO;
    self.shouldPullUpToLoadMore = YES;
    
    /// 显示的数据是每页八条说说
    self.perPage = 8;
    
    /// 允许多段显示
    self.shouldMultiSections = YES;
    self.shouldEndRefreshingWithNoMoreData = YES;
    
    /// 个人信息头部视图
    self.profileViewModel = [[FSLMomentProfileViewModel alloc] initWithUser:self.services.client.currentUser];
    
    /// 事件操作
    //// 初始化一系列subject
    self.reloadSectionSubject = [RACSubject subject];
    self.commentSubject = [RACSubject subject];
    self.phoneSubject = [RACSubject subject];
    
    /// 评论
    self.commentCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(FSLMomentReplyItemViewModel * itemViewModel) {
        @strongify(self);
        /// 配置评论内容
        FSLComment *comment = [[FSLComment alloc] init];
        comment.text = itemViewModel.text;
        /// 搞个随机字符串
        comment.idstr = [NSString stringWithFormat:@"%ld",[NSObject fsl_randomNumberWithFrom:10000000 to:99999999]];
        comment.momentIdstr = itemViewModel.momentIdstr;
        comment.createdAt = [NSDate date];
        comment.fromUser = self.services.client.currentUser;
        comment.toUser = itemViewModel.toUser;
        
        /// 根据 comment 获取到 commentItemViewModel
        FSLMomentCommentItemViewModel *commentItemViewModel = [[FSLMomentCommentItemViewModel alloc] initWithComment:comment];
        commentItemViewModel.attributedTapCommand = self.attributedTapCommand;
        
        /// 根据section 获取到 momentItemViewModel
        FSLMomentItemViewModel *momentItemViewModel = self.dataSource[itemViewModel.section];
        
        /// 插入数据
        [momentItemViewModel.dataSource addObject:commentItemViewModel];
        [momentItemViewModel.moment.commentsList addObject:comment];
        momentItemViewModel.moment.commentsCount += 1;
        
        /// 更新headerView的upArrow
        [momentItemViewModel updateUpArrow];
        
        /// 刷新数据源
        [self.reloadSectionSubject sendNext:@(itemViewModel.section)];
        return [RACSignal empty];
    }];
    
    /// 删除评论
    self.delCommentCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(NSIndexPath * indexPath) {
        @strongify(self);
        /// 根据indexPath.section 获取到 momentItemViewModel
        FSLMomentItemViewModel *momentItemViewModel = self.dataSource[indexPath.section];
        FSLMomentCommentItemViewModel *commentItemViewModel = momentItemViewModel.dataSource[indexPath.row];
        /// 删除数据
        [momentItemViewModel.dataSource removeObjectAtIndex:indexPath.row];
        /// 这个数据源 这里使用 removeObject来删除，一次来避免索引引起的Bug
        [momentItemViewModel.moment.commentsList removeObject:commentItemViewModel.comment];
        momentItemViewModel.moment.commentsCount -= 1;
        
        /// 更新headerView的upArrow
        [momentItemViewModel updateUpArrow];
        /// 刷新数据源
        [self.reloadSectionSubject sendNext:@(indexPath.section)];
        
        return [RACSignal empty];
    }];
    
    /// 跳转到用户信息
    self.profileInfoCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(FSLUser * user) {
        @strongify(self);
        FSLProfileInfoViewModel *viewModel = [[FSLProfileInfoViewModel alloc] initWithServices:self.services params:@{FSLViewModelUtilKey:user}];
        [self.services pushViewModel:viewModel animated:YES];
        return [RACSignal empty];
    }];
    
    /// 内容文本上高亮点击事件
    self.attributedTapCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(NSDictionary * userInfo) {
        @strongify(self);
        if (userInfo[FSLMomentUserInfoKey]) { /// 用户
            [self.profileInfoCommand execute:userInfo[FSLMomentUserInfoKey]];
            return [RACSignal empty];
        }
        
        if (userInfo[FSLMomentLinkUrlKey]) { /// 链接
            NSURL *url = [NSURL URLWithString:userInfo[FSLMomentLinkUrlKey]];
            NSURLRequest *request = [NSURLRequest requestWithURL:url];
            FSLWebViewModel *viewModel = [[FSLWebViewModel alloc] initWithServices:self.services params:@{FSLViewModelRequestKey:request}];
            [self.services pushViewModel:viewModel animated:YES];
            return [RACSignal empty];
        }
        
        if (userInfo[FSLMomentLocationNameKey]) { /// 地理位置
            
            return [RACSignal empty];
        }
        
        if (userInfo[FSLMomentPhoneNumberKey]) { /// 电话号码
            /// 由于这个 需要弹出 ActionSheet
            [self.phoneSubject sendNext:userInfo[FSLMomentPhoneNumberKey]];
            return [RACSignal empty];
        }
        
        return [RACSignal empty];
    }];
    
    self.shareTapCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(FSLMomentShareInfo *shareInfo) {
        @strongify(self);
        NSURL *url = [NSURL URLWithString:shareInfo.url];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        FSLWebViewModel *viewModel = [[FSLWebViewModel alloc] initWithServices:self.services params:@{FSLViewModelRequestKey:request}];
        [self.services pushViewModel:viewModel animated:YES];
        return [RACSignal empty];
    }];
}

/// 请求指定页的网络数据
- (RACSignal *)requestRemoteDataSignalWithPage:(NSUInteger)page{
    @weakify(self);
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        @strongify(self);
        /// config param
        NSMutableDictionary *param = [NSMutableDictionary dictionary];
        [param setValue:@(page) forKey:@"page"];
        /// 请求商品数据
        /// 请求商品数据 模拟网络请求
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.75 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            /// 获取数据
            NSData *data = [NSData dataNamed:[NSString stringWithFormat:@"WeChat_Moments_%zd.json",page]];
            FSLMoments *momentsData = [FSLMoments modelWithJSON:data];
            /// config data
            
            
            NSLog(@"----已经加载第%zd页的数据----",self.page);
            NSArray *viewModels = @[];
            /// 转化数据
            if (momentsData && momentsData.moments.count) { ///做个判断
                viewModels = [momentsData.moments.rac_sequence map:^FSLMomentItemViewModel *(FSLMoment * momment) {
                    @strongify(self);
                    FSLMomentItemViewModel *itemViewModel = [[FSLMomentItemViewModel alloc] initWithMoment:momment];
                    /// 传递命令
                    itemViewModel.reloadSectionSubject = self.reloadSectionSubject;
                    itemViewModel.commentSubject = self.commentSubject;
                    itemViewModel.profileInfoCommand = self.profileInfoCommand;
                    itemViewModel.attributedTapCommand = self.attributedTapCommand;
                    itemViewModel.shareTapCommand = self.shareTapCommand;
                    return itemViewModel;
                }].array;
            }
            
            
            if (page==1) {
                self.dataSource = viewModels ?:@[];
            }else{
                //// 类似于拼接
                self.dataSource = @[ (self.dataSource ?:@[]).rac_sequence , viewModels.rac_sequence].rac_sequence.flatten.array;
            }
            [subscriber sendNext:nil];
            [subscriber sendCompleted];
        });
        return nil;
    }];
}
@end
