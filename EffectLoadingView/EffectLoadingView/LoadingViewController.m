//
//  LoadingViewController.m
//  EffectLoadingView
//
//  Created by Kaijie Yu on 11/11/11.
//  Copyright (c) 2011 thePlant. All rights reserved.
//

#import "LoadingViewController.h"

#import <QuartzCore/QuartzCore.h>

@implementation LoadingViewController

@synthesize blackRect = blackRect_, spinner = spinner_;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    [self.view setBackgroundColor:[UIColor clearColor]];
    [self.view setFrame:CGRectMake(0.0f, 0.0f, 320.0f, 480.0f)];
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

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
  [super viewDidLoad];
  
  // Black Rect
  self.blackRect = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 200.0f, 120.0f)];
  [self.blackRect setCenter:CGPointMake(self.view.center.x, 100.0f)];
  [self.blackRect setAlpha:0.0f];
  [self.blackRect setBackgroundColor:[UIColor colorWithWhite:0.0f alpha:0.75f]];
  [[self.blackRect layer] setCornerRadius:10.0f];
  [self.view addSubview:self.blackRect];
  
  // Spinner
  self.spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
  [self.spinner setCenter:self.view.center];
  [self.spinner setAlpha:0.0f];
  [self.spinner startAnimating];
  [self.view addSubview:self.spinner];
  
  [UIView animateWithDuration:0.25f
                        delay:0.0f
                      options:UIViewAnimationOptionCurveEaseOut
                   animations:^{
                     [self.blackRect setCenter:self.view.center];
                     [self.blackRect setAlpha:1.0f];
                   }
                   completion:^(BOOL fin) {
                     [UIView animateWithDuration:0.15f
                                           delay:0.0f
                                         options:UIViewAnimationOptionCurveEaseIn
                                      animations:^{
                                        [self.spinner setAlpha:1.0f];
                                      }
                                      completion:nil];
                   }];
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

@end
