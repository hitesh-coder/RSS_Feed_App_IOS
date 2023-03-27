//
//  ThirdPageViewController.m
//  Testing
//
//  Created by Hitesh Kotecha on 27/03/23.
//

#import "ThirdPageViewController.h"
#import <WebKit/WebKit.h>

@interface ThirdPageViewController ()<WKNavigationDelegate>

@property (nonatomic, strong) WKWebView *webView;

@end

@implementation ThirdPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Create WKWebView and add it to the view hierarchy
    self.webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    self.webView.navigationDelegate = self;
    [self.view addSubview:self.webView];
    
    // Load a URL in the WKWebView
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.url]];
    [self.webView loadRequest:request];
}

#pragma mark - WKNavigationDelegate

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    // Web view finished loading
}

- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    // Web view failed to load
}

@end
