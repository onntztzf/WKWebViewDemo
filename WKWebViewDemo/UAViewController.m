//
//  UAViewController.m
//  WKWebViewDemo
//
//  Created by zhangpeng on 2019/12/13.
//  Copyright © 2019 zhangpeng. All rights reserved.
//

#import "UAViewController.h"
#import <WebKit/WebKit.h>

@interface UAViewController ()

@end

@implementation UAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectZero];
    NSString *oldAgent = [webView stringByEvaluatingJavaScriptFromString:@"navigator.userAgent"];
    
    NSString *agentAppend = @"testUserAgent";
    NSString *newAgent = [oldAgent stringByAppendingString:agentAppend];
    [[NSUserDefaults standardUserDefaults] registerDefaults:@{@"UserAgent":newAgent}];
    
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    WKWebView *wkWebView = [[WKWebView alloc] initWithFrame:self.view.bounds configuration:config];
    [self.view addSubview:wkWebView];
    
    NSString *file = [[NSBundle mainBundle] pathForResource:@"DisplayUA" ofType:@"html"];
    [wkWebView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:file]]];
}


@end
