//
//  MainPageTable.m
//  Testing
//
//  Created by Hitesh Kotecha on 26/03/23.
//

#import "MainPageTable.h"

@implementation MainPageTable

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
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    // Configure the cell...
    cell.textLabel.text = [NSString stringWithFormat:@"https://www.theguardian.com/international/rss"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *cellText = selectedCell.textLabel.text;
    
//    NSString *str = [NSString stringWithFormat:@" https://api.rss2json.com/v1/api.json?rss_url=%@",[cellText stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]];
    NSString *rssUrl = @"https://www.theguardian.com/international/rss";
    NSString *str = [NSString stringWithFormat:@"https://api.rss2json.com/v1/api.json?rss_url=%@", [cellText stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLHostAllowedCharacterSet]]];

    
//    NSLog(@"In tableview hehehe %@",cellText);
        
    NSURL *url = [NSURL URLWithString:str];

    // Create a URL request object with the URL
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"GET"];

    // Create a NSURLSession object
    NSURLSession *session = [NSURLSession sharedSession];

    // Create a data task with the request and a completion handler
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
//            NSLog(@"JSON: %@", json);
            dispatch_async(dispatch_get_main_queue(), ^{
                // UI update code here
                [self.viewControllerDelegate cellTapped:json];
            });
            
        }
    }];

    // Start the data task
    [dataTask resume];
}

@end
