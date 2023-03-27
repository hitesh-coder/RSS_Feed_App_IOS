//
//  SecondPageTable.h
//  Testing
//
//  Created by Hitesh Kotecha on 26/03/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol SecondPageTableDelegate <NSObject>

- (void)cellTapped:(NSString *)url;

@end

@interface SecondPageTable : UITableView <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) id<SecondPageTableDelegate> viewControllerDelegate;

@property (nonatomic, strong) NSArray *data;

@end

NS_ASSUME_NONNULL_END
