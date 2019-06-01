//
//  FSLWebViewController.h
//  FSLDevelopExample
//
//  Created by Fingal Liu on 2019/6/1.
//  Copyright © 2019 Fingal Liu. All rights reserved.
//

#import "FSLViewController.h"
#import "FSLWebViewModel.h"
#import <WebKit/WebKit.h>

@interface FSLWebViewController : FSLViewController<WKNavigationDelegate,WKUIDelegate,WKScriptMessageHandler>
/// webView
@property (nonatomic, weak, readonly) WKWebView *webView;
/// 内容缩进 (64,0,0,0)
@property (nonatomic, readonly, assign) UIEdgeInsets contentInset;

@end
