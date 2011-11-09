//
//  AppDelegate.h
//  Layout2RowTableView
//
//  Created by Kaijie Yu on 11/9/11.
//  Copyright (c) 2011 thePlant. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootNavigationController;
@class TwoRowTableViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (nonatomic, retain) RootNavigationController * rootNavController;
@property (nonatomic, retain) TwoRowTableViewController * tableViewController;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
