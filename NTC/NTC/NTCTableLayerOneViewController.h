//
//  NTCTableLayerOneViewController.h
//  NTC
//
//  Created by Kaijie Yu on 10/24/11.
//  Copyright (c) 2011 thePlant. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NTCTableLevelViewController;

@interface NTCTableLayerOneViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>
{
  IBOutlet UITableView *tableLayerOneViewController;
  NSMutableArray *styleArray;
}

@property (retain, nonatomic) NSMutableArray *styleArray;
@property (retain, nonatomic) NTCTableLevelViewController *ntcTableLevelViewController;

@end
