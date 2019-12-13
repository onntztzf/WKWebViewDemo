//
//  CustomUAViewController.m
//  WKWebViewDemo
//
//  Created by zhangpeng on 2019/12/13.
//  Copyright © 2019 zhangpeng. All rights reserved.
//

#import "CustomUAViewController.h"
#import <WebKit/WebKit.h>

@interface CustomUAViewController ()

@end

@implementation CustomUAViewController

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
    wkWebView.customUserAgent = newAgent;
    [self.view addSubview:wkWebView];
    
    NSString *file = [[NSBundle mainBundle] pathForResource:@"DisplayUA" ofType:@"html"];
    [wkWebView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:file]]];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
