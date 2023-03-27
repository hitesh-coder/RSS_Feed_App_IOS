//
//  SecondPageViewController.m
//  Testing
//
//  Created by Hitesh Kotecha on 26/03/23.
//

#import "SecondPageViewController.h"

@interface SecondPageViewController ()

@end

@implementation SecondPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILayoutGuide *safeGuide = self.view.safeAreaLayoutGuide;
    self.view.backgroundColor = [UIColor greenColor];
    
    SecondPageTable *table = [[SecondPageTable alloc] init];
    table.data = [self.tableData valueForKey:@"items"];
    table.translatesAutoresizingMaskIntoConstraints = NO;
    table.viewControllerDelegate = self;
    [self.view addSubview:table];
    
    [NSLayoutConstraint activateConstraints:@[
        [table.topAnchor constraintEqualToAnchor:safeGuide.topAnchor],
        [table.leadingAnchor constraintEqualToAnchor:safeGuide.leadingAnchor constant:10],
        [table.trailingAnchor constraintEqualToAnchor:safeGuide.trailingAnchor constant:-10],
        [table.bottomAnchor constraintEqualToAnchor:safeGuide.bottomAnchor],
    ]];
}

- (void)cellTapped:(nonnull NSString *)url {
    ThirdPageViewController *vc3 = [[ThirdPageViewController alloc] init];
    vc3.url = url;
    [self.navigationController pushViewController:vc3 animated:YES];
}

@end
