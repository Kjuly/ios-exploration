//
//  AppDelegate.h
//  NTC
//
//  Created by Kaijie Yu on 10/24/11.
//  Copyright (c) 2011 thePlant. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NTCNavController;
@class MyWorkoutsViewController;
@class ProgressViewController;
@class RewardsViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) IBOutlet UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (retain, nonatomic) IBOutlet UITabBarController *rootTabBarController;
@property (retain, nonatomic) IBOutlet NTCNavController *ntcNavController;
@property (retain, nonatomic) IBOutlet MyWorkoutsViewController *myWorkoutsNavController;
@property (retain, nonatomic) IBOutlet ProgressViewController *progressNavController;
@property (retain, nonatomic) IBOutlet RewardsViewController *rewardsNavController;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
