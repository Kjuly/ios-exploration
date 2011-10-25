//
//  NTCTableLevelViewController.h
//  NTC
//
//  Created by Kaijie Yu on 10/24/11.
//  Copyright (c) 2011 thePlant. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NTCTableLevelViewController;

@interface NTCTableLevelViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>
{
  IBOutlet UITableViewController *tableViewController;
  NSMutableArray *levelArray;
}

@property (retain, nonatomic) NSMutableArray *levelArray;

@end
