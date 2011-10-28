//
//  ViewController.m
//  EffectPicSlideV2
//
//  Created by Kaijie Yu on 10/27/11.
//  Copyright (c) 2011 thePlant. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

@synthesize scrollView;
@synthesize pageControl;

- (void)dealloc
{
  [scrollView release];
  [pageControl release];
  [_images release];
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
  [scrollView setBounds:CGRectMake(0, 0, 320, 480)];
  [self setImageSlideView:scrollView];
  
  // Add tap gesture recognizer for scroll view
  UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
  tapGestureRecognizer.numberOfTapsRequired = 1;
  [scrollView addGestureRecognizer:tapGestureRecognizer];
  [tapGestureRecognizer release];
}

- (void)viewDidUnload
{
  [super viewDidUnload];
  // Release any retained subviews of the main view.
  // e.g. self.myOutlet = nil;
  self.scrollView = nil;
  self.pageControl = nil;
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

#pragma mark - Custom

- (void)setImageSlideView:(UIScrollView *)imageSlideView
{
  _images = [NSMutableArray arrayWithObjects:
             [UIImage imageNamed:@"NTCInfoBg_320x480.jpg"],
             [UIImage imageNamed:@"NTCHomeMainPic_320x480.jpg"],
             [UIImage imageNamed:@"Eight_320x480.png"],
             [UIImage imageNamed:@"NTCInfoBg_320x480.jpg"],
             [UIImage imageNamed:@"NTCHomeMainPic_320x480.jpg"],
             [UIImage imageNamed:@"Eight_320x480.png"],
             [UIImage imageNamed:@"NTCInfoBg_320x480.jpg"],
             [UIImage imageNamed:@"NTCHomeMainPic_320x480.jpg"],
             [UIImage imageNamed:@"Eight_320x480.png"],
             nil];
  
  CGFloat imageMargin = 25.0f;
  CGRect thePageFrame = CGRectMake(0, 0, imageSlideView.bounds.size.width + imageMargin, imageSlideView.bounds.size.height);
  
  imageSlideView.contentSize = CGSizeMake(thePageFrame.size.width * [_images count], thePageFrame.size.height);
  imageSlideView.pagingEnabled = YES;
  imageSlideView.showsHorizontalScrollIndicator = NO;
  imageSlideView.showsVerticalScrollIndicator = NO;
  imageSlideView.delegate = self;
  imageSlideView.frame = thePageFrame;
  
  CGFloat offsetX = 0.0f;
  for (UIImage * image in _images) {
    thePageFrame.origin.x = offsetX - imageMargin / 2; // Set the offset of the next image for paging
    
    UIImageView *newPage = [[[UIImageView alloc] initWithImage:image] autorelease];
    [newPage setFrame:thePageFrame];
    [newPage setUserInteractionEnabled:YES];
    [newPage setContentMode:UIViewContentModeScaleAspectFit];
    [newPage setClipsToBounds:YES];
    [imageSlideView addSubview:newPage];
    
    offsetX += thePageFrame.size.width;
  }
  
  pageControl.numberOfPages = [_images count];
  pageControl.currentPage = 0;//_currPageIndex;
  [pageControl setBackgroundColor:[UIColor colorWithRed:0.0f
                                                  green:0.0f
                                                   blue:0.0f
                                                  alpha:0.5f]];
  [pageControl addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
  //[self.view addSubview:pageControl];
}

- (void)scrollViewDidScroll:(UIScrollView *)sender {
  // Update the page when more than 50% of the previous/next page is visible
  pageControl.currentPage = scrollView.contentOffset.x / scrollView.frame.size.width;
}

- (IBAction)changePage:(id)sender
{
  // update the scroll view to the appropriate page
  CGRect frame;
  frame.origin.x = scrollView.frame.size.width * pageControl.currentPage;
  frame.origin.y = 0;
  frame.size = scrollView.frame.size;
  [scrollView scrollRectToVisible:frame animated:YES];
}

#pragma mark - Gesture Handler

- (void)handleTapGesture:(id)sender
{
  [UIView beginAnimations:@"fade" context:nil];
  [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
  [UIView setAnimationDuration:0.3];
  
  //if ([pageControl isHidden]) [pageControl setHidden:NO];
  //else [pageControl setHidden:YES];
  if (pageControl.alpha > 0.5f) [pageControl setAlpha:0.0f];
  else [pageControl setAlpha:1.0f];
  
  [UIView commitAnimations];
}

@end
