//
//  ViewController.m
//  EffectPicZoom
//
//  Created by Kaijie Yu on 10/26/11.
//  Copyright (c) 2011 thePlant. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

@synthesize image;
@synthesize imageEnlarged;

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
  [self.view bringSubviewToFront:image];
  imageEnlarged = NO;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
  self.image = nil;
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

#pragma mark - Image

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
  UITouch *touch = [touches anyObject];
  if ([touch view] == image) {
    CATransition *animation = [CATransition animation];
    //CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.delegate = self;
    animation.duration = 1.0f;
    if (imageEnlarged) {
      animation.timingFunction = UIViewAnimationCurveEaseInOut;
      animation.type = kCATransitionFromTop;
      animation.subtype = kCATransitionFromTop;
      //[image contentScaleFactor:0.9375];
      [image setFrame:CGRectMake(10, 85, 300, 159)];
    } else {
      //animation.timingFunction = UIViewAnimationCurveEaseInOut;
      //animation.timingFunction = UIViewAnimationCurveLinear;
      animation.timingFunction = UIViewAnimationCurveEaseInOut;
      //animation.type = kCATransitionFromTop;
      //animation.type = kCATransitionFade;
      animation.type = kCAValueFunctionScale;
      animation.subtype = kCATruncationStart;
      //[image contentScaleFactor:1.0];
      //[image sizeToFit];
      [[image layer] setFrame:CGRectMake(0, 0, 320, 480)];
      //[[image layer] setPosition:CGPointMake(0, 300)];
      image.contentScaleFactor = 1.0;
    }
    [self.view.layer addAnimation:animation forKey:@"Scale"];
    self.imageEnlarged = !self.imageEnlarged;
  }
}

- (void)dealloc
{
  [image release];
}

@end
