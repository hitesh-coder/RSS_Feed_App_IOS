//
//  SecondPageViewController.h
//  Testing
//
//  Created by Hitesh Kotecha on 26/03/23.
//

#import <UIKit/UIKit.h>
#import "SecondPageTable.h"
#import "ThirdPageViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface SecondPageViewController : UIViewController <SecondPageTableDelegate>

@property (nonatomic, strong) NSDictionary *tableData;

@end

NS_ASSUME_NONNULL_END
