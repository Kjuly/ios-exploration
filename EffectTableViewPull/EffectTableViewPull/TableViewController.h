//
//  TableViewController.h
//  EffectTableViewPull
//
//  Created by Kaijie Yu on 10/31/11.
//  Copyright (c) 2011 thePlant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGORefreshTableHeaderView.h"

@interface TableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource, EGORefreshTableHeaderDelegate>
{
  EGORefreshTableHeaderView * rootTableView_;
  BOOL reloading_;
}

@property (nonatomic, retain) EGORefreshTableHeaderView * rootTableView;
@property (nonatomic, assign) BOOL reloading;

- (void)reloadTableViewDataSource;
- (void)doneLoadingTableViewData;

@end
