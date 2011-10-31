//
//  AppDelegate.h
//  EffectTableViewPull
//
//  Created by Kaijie Yu on 10/31/11.
//  Copyright (c) 2011 thePlant. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TableViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
  TableViewController * rootTableViewController_;
}

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (nonatomic, retain) TableViewController * rootTableViewController;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
