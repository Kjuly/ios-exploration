//
//  ViewController.m
//  EffectLoadingView
//
//  Created by Kaijie Yu on 11/11/11.
//  Copyright (c) 2011 thePlant. All rights reserved.
//

#import "ViewController.h"

#import "LoadingViewController.h"
#import "NewViewController.h"

@implementation ViewController

@synthesize loadingViewController = loadingViewController_;
@synthesize imageView = imageView_;
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

  [self.view setBackgroundColor:[UIColor whiteColor]];
  
  // Image view
  self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image_01_640x960.jpg"]];
  [self.imageView setFrame:CGRectMake(0.0f, 0.0f, 320.0f, 480.0f)];
  [self.imageView setContentMode:UIViewContentModeScaleAspectFit];
  [self.view addSubview:self.imageView];
  
  // Button to load new view
  self.loadNewViewButton = [[UIButton alloc] initWithFrame:CGRectMake(10.0f, 360.0f, 300.0f, 30.0f)];
  [self.loadNewViewButton setBackgroundColor:[UIColor blackColor]];
  [self.loadNewViewButton setTintColor:[UIColor blackColor]];
  [self.loadNewViewButton setTitle:@"Load New View" forState:UIControlStateNormal];
  [self.loadNewViewButton addTarget:self action:@selector(loadNewView:) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:self.loadNewViewButton];
  
  // Loading view
  self.loadingViewController = [[LoadingViewController alloc] initWithNibName:nil bundle:nil];
}

- (void)viewDidUnload
{
  [super viewDidUnload];
  self.loadingViewController = nil;
  self.loadNewViewButton = nil;
  self.imageView = nil;
}

- (void)dealloc
{
  [loadingViewController_ release];
  [loadNewViewButton_ release];
  [imageView_ release];
  [super release];
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
  [self.view addSubview:self.loadingViewController.view];
  [self.loadingViewController showLoadingView];

  [self performSelectorInBackground:@selector(replaceViewController:) withObject:sender];
}

// ---------------------------------------------------------------------------
- (void)didLoadNewView:(id)sender
{
  [self.loadingViewController hideLoadingView];
}

// ---------------------------------------------------------------------------
- (void)replaceViewController:(id)sender
{
  sleep(1);
  NewViewController * newViewController = [[NewViewController alloc] init];
  [newViewController.view setFrame:CGRectMake(320.0f, 0.0f, 320.0f, 480.0f)];
  [self.view insertSubview:newViewController.view atIndex:2];
  [UIView animateWithDuration:0.3f
                        delay:0.0f
                      options:UIViewAnimationOptionCurveEaseInOut
                   animations:^{
                     [newViewController.view setFrame:CGRectMake(0.0f, 0.0f, 320.0f, 480.0f)];
                   }
                   completion:^(BOOL finished) {
                     [self didLoadNewView:sender];
                   }];
  [newViewController release];
}

@end
