//
//  ViewController.m
//  Effect3DRotation
//
//  Created by Kaijie Yu on 11/6/11.
//  Copyright (c) 2011 thePlant. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
  [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  [self.view setBackgroundColor:[UIColor whiteColor]];
  
  // Text label
  UILabel * textLabel = [[UILabel alloc] initWithFrame:CGRectMake(20.0f, 80.0f, 320.0f, 100.0f)];
  [textLabel setBackgroundColor:[UIColor clearColor]];
  [textLabel setText:@"Effect 3D Rotation"];
  [textLabel setFont:[UIFont systemFontOfSize:24.0f]];
  
  [self.view addSubview:textLabel];
  [textLabel release];
  
  // Button
  UIButton * actionButton = [[UIButton alloc] initWithFrame:CGRectMake(20.0f, 200.0f, 160.0f, 30.0f)];
  [actionButton setBackgroundColor:[UIColor blackColor]];
  [actionButton setTitle:@"Run" forState:UIControlStateNormal];
  [actionButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
  [actionButton addTarget:self action:@selector(doRotate:) forControlEvents:UIControlEventTouchUpInside];
  
  [self.view addSubview:actionButton];
  [actionButton release];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
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

//////////////////////////////////////////////////////////////////////////////
#pragma mark - Action
// ---------------------------------------------------------------------------
- (void)doRotate:(id)sender
{
  NSLog(@"*** Clicked");
}

@end
