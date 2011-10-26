//
//  NTCNavController.m
//  NTC
//
//  Created by Kaijie Yu on 10/24/11.
//  Copyright (c) 2011 thePlant. All rights reserved.
//

#import "NTCNavController.h"

@implementation NTCNavController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    
  }
  return self;
}

- (void)didReceiveMemoryWarning
{
  // Releases the view if it doesn't have a superview.
  [super didReceiveMemoryWarning];
    
  // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
  [super viewDidLoad];
  // Do any additional setup after loading the view from its nib.
  self.title = NSLocalizedString(@"NTC", @"NTC");
  /*self.tabBarItem.image = [UIImage imageNamed:@"TabNTCIcon"];
  self.navigationController.navigationBar.tintColor = [UIColor
                                                       colorWithRed:102.0/255
                                                       green:52.0/255
                                                       blue:133.0/255
                                                       alpha:1];*/
  [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackTranslucent];
}

- (void)viewDidUnload
{
  [super viewDidUnload];
  // Release any retained subviews of the main view.
  // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - IBAction

- (IBAction)showInfo:(id)sender
{
  AppInfo *appInfoViewController = [[AppInfo alloc] initWithNibName:@"AppInfo" bundle:nil];
  appInfoViewController.delegate = self;
  appInfoViewController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
  [self presentModalViewController:appInfoViewController animated:YES];
  
  [appInfoViewController release];
}

#pragma mark - AppInfoViewControllerDelegate

- (void)appInfoViewControllerDidFinish:(AppInfo *)controller
{
  [self dismissModalViewControllerAnimated:YES];
}

@end
