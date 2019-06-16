//
//  FSLProfileInfoFooterView.m
//  WeChat
//
//  Created by Fingal Liu on 2018/1/29.
//  Copyright © 2018年 Fingal Liu. All rights reserved.
//

#import "FSLProfileInfoFooterView.h"
#import "FSLProfileInfoViewModel.h"
@interface FSLProfileInfoFooterView ()

/// 发消息
@property (weak, nonatomic) IBOutlet UIButton *chatBtn;

/// 视频聊天
@property (weak, nonatomic) IBOutlet UIButton *videoBtn;

/// viewModel
@property (nonatomic, readwrite, strong) FSLProfileInfoViewModel *viewModel;

@end


@implementation FSLProfileInfoFooterView

- (void)bindViewModel:(FSLProfileInfoViewModel *)viewModel{
    self.viewModel = viewModel;
    self.videoBtn.hidden = viewModel.currentUser;
    
    /// 配置一些cmd
}

+ (instancetype)footerView{
    return [self fsl_viewFromXib];
}


- (void)awakeFromNib{
    [super awakeFromNib];
    
    UIImage * imageNor = nil;
    UIImage * imageHigh = nil;
    
    CGSize size = CGSizeMake((FSL_SCREEN_WIDTH - 40), 48);
    
    /// 基础配置
    imageNor = [UIImage yy_imageWithColor:FSLColorFromHexString(@"#51AA38") size:size];
    imageNor = [imageNor yy_imageByRoundCornerRadius:6 borderWidth:1 borderColor:FSLColorFromHexString(@"#489931")];
    //
    imageHigh = [UIImage yy_imageWithColor:FSLColorFromHexString(@"#489931") size:size];
    imageHigh = [imageHigh yy_imageByRoundCornerRadius:6 borderWidth:1 borderColor:FSLColorFromHexString(@"#40892C")];
    [self.chatBtn setBackgroundImage:imageNor  forState:UIControlStateNormal];
    [self.chatBtn setBackgroundImage:imageHigh forState:UIControlStateHighlighted];
    
    
    imageNor = [[UIImage yy_imageWithColor:FSLColorFromHexString(@"#f8f8f8") size:size] yy_imageByRoundCornerRadius:6 borderWidth:1 borderColor:FSLColorFromHexString(@"#DFDFDF")];
    imageHigh = [[UIImage yy_imageWithColor:FSLColorFromHexString(@"#DFDFDF") size:size] yy_imageByRoundCornerRadius:6 borderWidth:1 borderColor:FSLColorFromHexString(@"#C9C9C9")];
    [self.videoBtn setBackgroundImage:imageNor  forState:UIControlStateNormal];
    [self.videoBtn setBackgroundImage:imageHigh forState:UIControlStateHighlighted];
    
}

#pragma mark - 事件处理
- (IBAction)_btnDidClicked:(UIButton *)sender {
    if (sender == self.chatBtn) { /// 发消息
        NSLog(@"-------发消息------");
    }else{ /// 视频聊天
        LCActionSheet *sheet = [LCActionSheet sheetWithTitle:nil cancelButtonTitle:@"取消" clicked:^(LCActionSheet * _Nonnull actionSheet, NSInteger buttonIndex) {
            if (buttonIndex == 0) return ;
        } otherButtonTitles:@"视频聊天",@"语言聊天", nil];
        [sheet show];
    }
    
    
    
}

@end
