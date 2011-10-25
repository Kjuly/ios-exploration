//
//  NTCTablePlanSelectionViewController.h
//  NTC
//
//  Created by Kaijie Yu on 10/25/11.
//  Copyright (c) 2011 thePlant. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NTCTablePlanSelectionViewController;

@interface NTCTablePlanSelectionViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>
{
  IBOutlet UITableViewController *tableViewController;
  NSMutableArray *beginnerPlanArray;
  NSMutableArray *intermediatePlanArray;
  NSMutableArray *advancedPlanArray;
}

@property (retain, nonatomic) NSMutableArray *beginnerPlanArray;
@property (retain, nonatomic) NSMutableArray *intermediatePlanArray;
@property (retain, nonatomic) NSMutableArray *advancedPlanArray;

@end
