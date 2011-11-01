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
  
  // Custom UI style setting
  [self setNavigationBarStyle];
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

- (void)setNavigationBarStyle
{
  UINavigationBar * topNavBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 75.0f)];
  [topNavBar setTintColor:[UIColor colorWithWhite:0.95f alpha:1.0f]];
  
  // Bottom border
  UIView * navBottomBorder = [[UIView alloc] initWithFrame:CGRectMake(0, topNavBar.frame.size.height - 1, topNavBar.frame.size.width, 1)];
  [navBottomBorder setBackgroundColor:[UIColor colorWithWhite:0.8f alpha:1.0f]];
  [topNavBar addSubview:navBottomBorder];
  [navBottomBorder release];
  
  // Icon Button
  UIButton * iconButton = [[UIButton alloc] initWithFrame:CGRectMake(10.0f, 30.0f, 35.0f, 35.0f)];
  [iconButton setBackgroundColor:[UIColor colorWithWhite:0.0f alpha:1.0f]];
  [[iconButton layer] setCornerRadius:18.0f];
  
  [topNavBar addSubview:iconButton];
  [iconButton release];
  
  // Label
  UILabel * viewTitleMain = [[UILabel alloc] initWithFrame:CGRectMake(50.0f, 20.0f, 270.0f, 45.0f)];
  [viewTitleMain setBackgroundColor:[UIColor clearColor]];
  [viewTitleMain setFont:[UIFont systemFontOfSize:26.0f]];
  [viewTitleMain setText:@"TableView Pull"];
  UILabel * viewSubtitle = [[UILabel alloc] initWithFrame:CGRectMake(50.0f, 55.0f, 270.0f, 15.0f)];
  [viewSubtitle setBackgroundColor:[UIColor clearColor]];
  [viewSubtitle setFont:[UIFont systemFontOfSize:12.0f]];
  [viewSubtitle setText:@"Just a Subtitle"];
  
  [topNavBar addSubview:viewTitleMain];
  [topNavBar addSubview:viewSubtitle];
  [viewTitleMain release];
  [viewSubtitle release];
  
  // Top view
  [self.view addSubview:topNavBar];
  [topNavBar release];
  //self.title = [[NSString alloc] initWithString:@"TableView Pull"];
}

@end
