//
//  ViewController.m
//  EffectPicSlide
//
//  Created by Kaijie Yu on 10/27/11.
//  Copyright (c) 2011 thePlant. All rights reserved.
//

#import "ViewController.h"
#import "SlideView.h"

@implementation ViewController

- (id)init
{
  if (self = [super initWithNibName:nil bundle:nil]) {
    NSArray * images = [NSArray arrayWithObjects:
                        [UIImage imageNamed:@"NTCInfoBg_320x480.jpg"],
                        [UIImage imageNamed:@"NTCHomeMainPic_320x480.jpg"],
                        [UIImage imageNamed:@"Eight_320x480.png"],
                        nil];
    self.view = [[[SlideView alloc] initWithImages:images] autorelease];
  }
  return self;
}

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
}

- (void)viewDidUnload
{
  [super viewDidUnload];
  // Release any retained subviews of the main view.
  // e.g. self.myOutlet = nil;
  self.view = nil;
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

@end
