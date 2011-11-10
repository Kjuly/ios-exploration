//
//  TwoRowTableViewController.h
//  Layout2RowTableView
//
//  Created by Kaijie Yu on 11/9/11.
//  Copyright (c) 2011 thePlant. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TwoRowTableViewController : UITableViewController
{
  NSMutableArray * unitArray_;
}

- (void)loadCategory:(id)sender;
- (void)toggleStatusBar:(id)sender;

@end
