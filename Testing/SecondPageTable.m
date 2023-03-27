//
//  SecondPageTable.m
//  Testing
//
//  Created by Hitesh Kotecha on 26/03/23.
//

#import "SecondPageTable.h"

@implementation SecondPageTable

- (instancetype)init {
    self = [super init];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section
//    NSLog(@"in 2nd page table HEHEH %ld", (long)self.data.count);
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    NSDictionary *dict = self.data[indexPath.row];
//    cell.textLabel.text = [NSString stringWithFormat:@"%@", [dict valueForKey:@"title"]];
    
    UIImageView *myImageView = [[UIImageView alloc] init];
    myImageView.translatesAutoresizingMaskIntoConstraints = NO;
    NSDictionary *endict = [dict valueForKey:@"enclosure"];
    NSString *encodedString = [endict valueForKey:@"link"];
    NSAttributedString *decodedString = [[NSAttributedString alloc] initWithData:[encodedString dataUsingEncoding:NSUTF8StringEncoding] options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType} documentAttributes:nil error:nil];
    NSString *normalString = decodedString.string;
    
    NSURL *url = [NSURL URLWithString:normalString];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (!error) {
            UIImage *image = [UIImage imageWithData:data];
//            NSLog(@"GOt Image hehe %@",url);
            dispatch_async(dispatch_get_main_queue(), ^{
                myImageView.image = image;
            });
        }
    }];
    [dataTask resume];
    [cell.contentView addSubview: myImageView];
    
    UILabel *myLabel = [[UILabel alloc] init];
    myLabel.translatesAutoresizingMaskIntoConstraints = NO;
    myLabel.text = [NSString stringWithFormat:@"%@", [dict valueForKey:@"title"]];
    [cell.contentView addSubview:myLabel];
    
    [NSLayoutConstraint activateConstraints:@[
        // Position the image view on the left with a fixed height and width
        [myImageView.leadingAnchor constraintEqualToAnchor:cell.contentView.leadingAnchor constant:10],
        [myImageView.topAnchor constraintEqualToAnchor:cell.contentView.topAnchor constant:10],
        [myImageView.bottomAnchor constraintEqualToAnchor:cell.contentView.bottomAnchor constant:-10],
        [myImageView.widthAnchor constraintEqualToConstant:75],
        [myImageView.heightAnchor constraintEqualToConstant:50],
        
        // Position the label to the right of the image view with a 10 point gap
        [myLabel.leadingAnchor constraintEqualToAnchor:myImageView.trailingAnchor constant:10],
        [myLabel.topAnchor constraintEqualToAnchor:cell.contentView.topAnchor constant:10],
        [myLabel.trailingAnchor constraintEqualToAnchor:cell.contentView.trailingAnchor constant:-10],
        [myLabel.bottomAnchor constraintEqualToAnchor:cell.contentView.bottomAnchor constant:-10]
    ]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
//    NSString *cellText = selectedCell.textLabel.text;
    NSDictionary *dict = self.data[indexPath.row];
    
    [self.viewControllerDelegate cellTapped:[dict valueForKey:@"link"]];
}

@end
