//
//  ViewController.m
//  EffectLoadingView
//
//  Created by Kaijie Yu on 11/11/11.
//  Copyright (c) 2011 thePlant. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

@synthesize loadNewViewButton = loadNewViewButton_;

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
  [super viewDidLoad];

  self.loadNewViewButton = [[UIButton alloc] initWithFrame:CGRectMake(10.0f, 360.0f, 300.0f, 30.0f)];
  [self.loadNewViewButton setBackgroundColor:[UIColor blackColor]];
  [self.loadNewViewButton setTintColor:[UIColor blackColor]];
  [self.loadNewViewButton setTitle:@"Load New View" forState:UIControlStateNormal];
  [self.loadNewViewButton addTarget:self action:@selector(loadNewView:) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:self.loadNewViewButton];
}

- (void)viewDidUnload
{
  [super viewDidUnload];
  self.loadNewViewButton = nil;
}

- (void)dealloc
{
  [loadNewViewButton_ release];
}

- (void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
  [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  // Return YES for supported orientations
  return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

///////////////////////////////////////////////////////////////////////////////
#pragma mark - Button Action
// ---------------------------------------------------------------------------
- (void)loadNewView:(id)sender
{
  NSLog(@"123");
}

@end
