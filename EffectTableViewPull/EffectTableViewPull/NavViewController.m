//
//  NavViewController.m
//  EffectTableViewPull
//
//  Created by Kaijie Yu on 11/1/11.
//  Copyright (c) 2011 thePlant. All rights reserved.
//

#import "NavViewController.h"
#import "TableViewController.h"

@implementation NavViewController

@synthesize rootTableViewController = rootTableViewController_;

- (void)dealloc {
  [rootTableViewController_ release];
  [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    rootTableViewController_ = [[TableViewController alloc] initWithStyle:UITableViewStylePlain];
    [[rootTableViewController_ view] setFrame:CGRectMake(0.0f, 75.0f, 320.0f, self.view.frame.size.height - 75.0f)];
    [self.view addSubview:[rootTableViewController_ view]];
  }
  return self;
}

- (void)viewDidLoad
{
  if (rootTableViewController_ == nil) {
    rootTableViewController_ = [[TableViewController alloc] initWithStyle:UITableViewStylePlain];
    [self.view addSubview:[rootTableViewController_ view]];
  }
  UINavigationBar * topNavBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 75.0f)];
  [self.view addSubview:topNavBar];
  [topNavBar release];
  self.title = [[NSString alloc] initWithString:@"TableView Pull"];
  
}

- (void)didReceiveMemoryWarning
{
  // Releases the view if it doesn't have a superview.
  [super didReceiveMemoryWarning];
  
  // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
  [super viewDidUnload];
  self.rootTableViewController = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  // Return YES for supported orientations
  return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Custom UI

@end
