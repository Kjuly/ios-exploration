//
//  NavViewController.h
//  EffectTableViewPull
//
//  Created by Kaijie Yu on 11/1/11.
//  Copyright (c) 2011 thePlant. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TableViewController;

@interface NavViewController : UINavigationController
{
  TableViewController * rootTableViewController_;
}

@property (nonatomic, retain) TableViewController * rootTableViewController;

@end
