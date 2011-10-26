//
//  NTCHomeController.m
//  NTC
//
//  Created by Kaijie Yu on 10/24/11.
//  Copyright (c) 2011 thePlant. All rights reserved.
//

#import "NTCHomeController.h"
#import "NTCTableLayerOneViewController.h"
#import "AppDelegate.h"

@implementation NTCHomeController

@synthesize ntcHomeImg;
@synthesize ntcHomeImgIsEnlarged;

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

- (void)viewDidLoad
{
  [super viewDidLoad];
  // Do any additional setup after loading the view from its nib.
  [ntcHomeImg setBounds:CGRectMake(0, 75, 320, 159)];
  [ntcHomeImg setClipsToBounds:YES];
  [self.view bringSubviewToFront:ntcHomeImg];
  
  self.ntcHomeImgIsEnlarged = NO;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
  ntcHomeImg = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - IBAction

- (IBAction)startTrainingPlan:(id)sender
{
  NTCTableLayerOneViewController *ntcTableLayerOneViewController = [[NTCTableLayerOneViewController alloc] initWithNibName:@"NTCTableLayerOneViewController" bundle:nil];
  [self.navigationController pushViewController:ntcTableLayerOneViewController animated:YES];
  [ntcTableLayerOneViewController release];
}

#pragma mark - UIImageView

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
  UITouch *touch = [touches anyObject];
  if ([touch view] == ntcHomeImg) {
    CGContextRef context = UIGraphicsGetCurrentContext();
    [UIView beginAnimations:nil context:context];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationDuration:0.5];
    
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    
    if (self.ntcHomeImgIsEnlarged) {
      [delegate.window setRootViewController:delegate.rootTabBarController];
      
      [ntcHomeImg setBounds:CGRectMake(0, 0, 320, 159)];
      [ntcHomeImg setCenter:CGPointMake(160, 154)];
      [self.navigationController.navigationBar setAlpha:1.0];
      [self.tabBarController.tabBar setAlpha:1.0];
    } else {
      [delegate.window setRootViewController:self];
      [delegate.window addSubview:self.view];
      
      [delegate.window makeKeyAndVisible];
      [self.view addSubview:ntcHomeImg];
      [ntcHomeImg setBounds:CGRectMake(0, 200, 320, 480)];
      [ntcHomeImg setCenter:CGPointMake(160, 240)];
      [self.navigationController.navigationBar setAlpha:0.0];
      [self.tabBarController.tabBar setAlpha:0.0];
    }
    
    [UIView commitAnimations];
    self.ntcHomeImgIsEnlarged = !self.ntcHomeImgIsEnlarged;
  }
  //[touch release];
}

- (void)dealloc
{
  [ntcHomeImg release];
}

@end
