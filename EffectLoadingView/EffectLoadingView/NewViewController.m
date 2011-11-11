//
//  NewViewController.m
//  EffectLoadingView
//
//  Created by Kaijie Yu on 11/11/11.
//  Copyright (c) 2011 thePlant. All rights reserved.
//

#import "NewViewController.h"

@implementation NewViewController

@synthesize imageView = imageView_;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    // Custom initialization
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
  
  // ImageView
  self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image_02_640x960.jpg"]];
  [self.imageView setFrame:CGRectMake(0.0f, 0.0f, 320.0f, 480.0f)];
  [self.imageView setContentMode:UIViewContentModeScaleAspectFit];
  [self.view addSubview:self.imageView];
}

- (void)viewDidUnload
{
  [super viewDidUnload];
  self.imageView = nil;
}

- (void)dealloc
{
  [imageView_ release];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  // Return YES for supported orientations
  return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
