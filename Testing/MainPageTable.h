//
//  MainPageTable.h
//  Testing
//
//  Created by Hitesh Kotecha on 26/03/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MainPageTableDelegate <NSObject>

- (void)cellTapped:(NSDictionary *)data;

@end

@interface MainPageTable : UITableView <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) id<MainPageTableDelegate> viewControllerDelegate;

@end

NS_ASSUME_NONNULL_END
