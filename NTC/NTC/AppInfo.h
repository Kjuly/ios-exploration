//
//  AppInfo.h
//  NTC
//
//  Created by Kaijie Yu on 10/24/11.
//  Copyright (c) 2011 thePlant. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AppInfo;

@protocol AppInfoViewControllerDelegate

- (void)appInfoViewControllerDidFinish:(AppInfo *)controller;

@end

@interface AppInfo : UIViewController

@property (retain, nonatomic) id <AppInfoViewControllerDelegate> delegate;

- (IBAction)backToPrevView:(id)sender;

@end
