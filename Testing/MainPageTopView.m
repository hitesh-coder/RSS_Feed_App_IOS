//
//  MainPageTopView.m
//  Testing
//
//  Created by Hitesh Kotecha on 26/03/23.
//

#import "MainPageTopView.h"

@implementation MainPageTopView

- (instancetype)init {
    self = [super init];
//    self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44);
    // Text field
    self.textField = [[UITextField alloc] init];
    self.textField.translatesAutoresizingMaskIntoConstraints = NO;
    self.textField.placeholder = @"Enter text here";
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    [self addSubview:self.textField];
    
    // Add button
    self.addButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.addButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.addButton.backgroundColor = [UIColor blackColor];
    [self.addButton setTitle:@"Add" forState:UIControlStateNormal];
    [self addSubview:self.addButton];
    
    [NSLayoutConstraint activateConstraints:@[
        [self.textField.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
        [self.textField.trailingAnchor constraintEqualToAnchor:self.trailingAnchor],
        [self.textField.topAnchor constraintEqualToAnchor:self.topAnchor],

        [self.addButton.topAnchor constraintEqualToAnchor:self.textField.bottomAnchor constant:10],
        [self.addButton.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
        [self.addButton.trailingAnchor constraintEqualToAnchor:self.trailingAnchor],
        
        [self.bottomAnchor constraintEqualToAnchor:self.addButton.bottomAnchor],
    ]];
    
    return self;
}

@end
