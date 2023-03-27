//
//  ViewController.m
//  Testing
//
//  Created by Hitesh Kotecha on 26/03/23.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILayoutGuide *safeGuide = self.view.safeAreaLayoutGuide;
    self.view.backgroundColor = [UIColor systemPinkColor];
    
    MainPageTopView *topView = [[MainPageTopView alloc] init];
    topView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:topView];
    
    UIBarButtonItem *nextButton = [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStylePlain target:self action:@selector(pushNextViewController)];
        
    // Add the button to the navigation bar
    self.navigationItem.rightBarButtonItem = nextButton;
    
    MainPageTable *mainPageTable = [[MainPageTable alloc] init];
    mainPageTable.translatesAutoresizingMaskIntoConstraints = NO;
    mainPageTable.viewControllerDelegate = self;
    [self.view addSubview:mainPageTable];
    
    [NSLayoutConstraint activateConstraints:@[
        [topView.leadingAnchor constraintEqualToAnchor:safeGuide.leadingAnchor constant:10],
        [topView.trailingAnchor constraintEqualToAnchor:safeGuide.trailingAnchor constant:-10],
        [topView.topAnchor constraintEqualToAnchor:safeGuide.topAnchor],
        
        [mainPageTable.topAnchor constraintEqualToAnchor:topView.bottomAnchor constant:10],
        [mainPageTable.leadingAnchor constraintEqualToAnchor:safeGuide.leadingAnchor constant:10],
        [mainPageTable.trailingAnchor constraintEqualToAnchor:safeGuide.trailingAnchor constant:-10],
        [mainPageTable.bottomAnchor constraintEqualToAnchor:safeGuide.bottomAnchor]
    ]];
}

- (void)pushNextViewController {
    // Create a new view controller to push to
    UIViewController *nextViewController = [[UIViewController alloc] init];
    nextViewController.title = @"Next View";
    nextViewController.view.backgroundColor = [UIColor whiteColor];
    
    // Create a new navigation controller with the new view controller as its root view controller
//    UINavigationController *nextNavigationController = [[UINavigationController alloc] initWithRootViewController:nextViewController];
    
    // Push the new navigation controller onto the navigation stack
    [self.navigationController pushViewController:nextViewController animated:YES];
}

- (void)cellTapped:(NSDictionary *)data {
    NSLog(@"EHEHHE cell tapped");
    SecondPageViewController *vc2 = [[SecondPageViewController alloc] init];
    vc2.title = @"HEHEH controller";
    vc2.tableData = data;
    [self.navigationController pushViewController:vc2 animated:YES];
}

@end
