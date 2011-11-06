//
//  ViewController.m
//  Effect3DRotation
//
//  Created by Kaijie Yu on 11/6/11.
//  Copyright (c) 2011 thePlant. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation ViewController

@synthesize textLabel = textLabel_;
@synthesize rotated = rotated_;

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
  self.textLabel = [[UILabel alloc] initWithFrame:CGRectMake(20.0f, 80.0f, 400.0f, 100.0f)];
  [textLabel_ setBackgroundColor:[UIColor clearColor]];
  [textLabel_ setText:@"Effect 3D Rotation"];
  [textLabel_ setFont:[UIFont systemFontOfSize:24.0f]];
  
  [self.view addSubview:textLabel_];
  
  // Button
  UIButton * actionButton = [[UIButton alloc] initWithFrame:CGRectMake(20.0f, 200.0f, 160.0f, 30.0f)];
  [actionButton setBackgroundColor:[UIColor blackColor]];
  [actionButton setTitle:@"Run" forState:UIControlStateNormal];
  [actionButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
  [actionButton addTarget:self action:@selector(doRotate:) forControlEvents:UIControlEventTouchUpInside];
  
  [self.view addSubview:actionButton];
  [actionButton release];
  
  // Set class members
  self.rotated = NO;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
  self.textLabel = nil;
}

- (void)dealloc
{
  [textLabel_ release];
  [super dealloc];
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
  [UIView beginAnimations:@"transform" context:nil];
  [UIView setAnimationCurve:UIViewAnimationCurveLinear];
  [UIView setAnimationBeginsFromCurrentState:YES];
  [UIView setAnimationDuration:0.2f];
  
  CATransform3D rotation = CATransform3DIdentity;
  if (rotated_) {
    [textLabel_ setAlpha:1.0f];
  } else {
    rotation.m34 = - 1.0f / 300.0f;
    rotation = CATransform3DRotate(rotation, 60.0f * M_PI / 180.0f, 0.0f, 1.0f, 0.0f);
    
    [textLabel_ setAlpha:0.0f];
  }
  [[textLabel_ layer] setTransform:rotation];
  
  [UIView commitAnimations];
  
  rotated_ = !rotated_;
}

@end
