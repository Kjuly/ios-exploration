//
//  ViewController.m
//  EffectPicSlideV2
//
//  Created by Kaijie Yu on 10/27/11.
//  Copyright (c) 2011 thePlant. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

@synthesize images = images_;
@synthesize scrollView = scrollView_;
@synthesize topbarView = topbarView_;
@synthesize pageControl = pageControl_;
@synthesize buttonBack = buttonBack_;
@synthesize scrollViewFullScreen = scrollViewFullScreen_;
@synthesize backgroundView = backgroundView_;

// ---------------------------------------------------------------------------
- (void)dealloc
{
  [scrollView_ release];
  [topbarView_ release];
  [pageControl_ release];
  [buttonBack_ release];
  [images_ release];
  [backgroundView_ release];
}

// ---------------------------------------------------------------------------
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}


//////////////////////////////////////////////////////////////////////////////
#pragma mark - View lifecycle
// ---------------------------------------------------------------------------
- (void)viewDidLoad
{
  [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  [scrollView_ setBounds:CGRectMake(0, 0, 320, 480)];
  [self setImageSlideView:scrollView_];
  
  // Add tap gesture recognizer for scroll view
  UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
  tapGestureRecognizer.numberOfTapsRequired = 1;
  [scrollView_ addGestureRecognizer:tapGestureRecognizer];
  [tapGestureRecognizer release];
  
  [scrollView_ setShowsHorizontalScrollIndicator:NO];
  [scrollView_ setShowsVerticalScrollIndicator:NO];
  [scrollView_ setAutoresizesSubviews:NO];
  [scrollView_ setDelegate:self];
  [scrollView_ setContentMode:UIViewContentModeTop];
  
  // Setting background transparent view
  backgroundView_ = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 480.0f)];
  [backgroundView_ setBackgroundColor:[UIColor colorWithWhite:0.0f alpha:1.0f]];
  [self.view insertSubview:backgroundView_ belowSubview:scrollView_];
  
  scrollViewFullScreen_ = YES;
}

// ---------------------------------------------------------------------------
- (void)viewDidUnload
{
  [super viewDidUnload];
  // Release any retained subviews of the main view.
  // e.g. self.myOutlet = nil;
  self.scrollView = nil;
  self.topbarView = nil;
  self.pageControl = nil;
  self.buttonBack = nil;
  self.backgroundView = nil;
}

// ---------------------------------------------------------------------------
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


//////////////////////////////////////////////////////////////////////////////
#pragma mark - Interface Orientation
// ---------------------------------------------------------------------------
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  // Return YES for supported orientations
  //return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
  return NO; // Lock landscape
}

/*- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
  [_scrollView setBounds:CGRectMake(0, 0, 320, 480)];
  [self updateImageSlideView:_scrollView];
}*/


//////////////////////////////////////////////////////////////////////////////
#pragma mark - Custom
// ---------------------------------------------------------------------------
- (void)setImageSlideView:(UIScrollView *)imageSlideView
{
  images_ = [[NSMutableArray alloc] initWithObjects:
             [UIImage imageNamed:@"NTCInfoBg_640x960.jpg"],
             [UIImage imageNamed:@"NTCHomeMainPic_640x960.jpg"],
             [UIImage imageNamed:@"Eight_640x960.png"],
             [UIImage imageNamed:@"NTCInfoBg_640x960.jpg"],
             [UIImage imageNamed:@"NTCHomeMainPic_640x960.jpg"],
             [UIImage imageNamed:@"Eight_640x960.png"],
             [UIImage imageNamed:@"NTCInfoBg_640x960.jpg"],
             [UIImage imageNamed:@"NTCHomeMainPic_640x960.jpg"],
             [UIImage imageNamed:@"Eight_640x960.png"],
             nil];
  
  [imageSlideView setContentSize:CGSizeMake((imageSlideView.bounds.size.width + kImageMargin) * [images_ count], imageSlideView.bounds.size.height)];
  [imageSlideView setPagingEnabled:YES];
  [imageSlideView setFrame:CGRectMake(0.0f, 0.0f, 320.0f + kImageMargin, 480.0f)];
  
  NSInteger i = -1;
  for (UIImage * image in images_) {
    UIImageView *newPage = [[[UIImageView alloc] initWithImage:image] autorelease];
    [newPage setFrame:CGRectMake((320.0f + kImageMargin) * ++i, 0.0f, 320.0f, 480.0f)];
    
    [newPage setUserInteractionEnabled:YES];
    [newPage setContentScaleFactor:1.0f];
    //[newPage setContentMode:UIViewContentModeScaleAspectFit];
    [newPage setContentMode:UIViewContentModeScaleAspectFill];
    //[newPage setContentMode:UIViewContentModeCenter];
    [newPage setClipsToBounds:YES];
    [imageSlideView addSubview:newPage];
  }
  
  pageControl_.numberOfPages = [images_ count];
  pageControl_.currentPage = 0;//_currPageIndex;
  [pageControl_ addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
}

// ---------------------------------------------------------------------------
- (void)scrollViewDidScroll:(UIScrollView *)sender {
  // Update the page number
  CGFloat pageWidth = scrollView_.frame.size.width;
  pageControl_.currentPage = floor((scrollView_.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
}

// ---------------------------------------------------------------------------
- (IBAction)changePage:(id)sender
{
  // update the scroll view to the appropriate page
  CGRect frame;
  frame.origin.x = scrollView_.frame.size.width * pageControl_.currentPage;
  frame.origin.y = 0;
  frame.size = scrollView_.frame.size;
  [scrollView_ scrollRectToVisible:frame animated:YES];
}


//////////////////////////////////////////////////////////////////////////////
#pragma mark - Gesture Handler
// ---------------------------------------------------------------------------
- (void)handleTapGesture:(id)sender
{
  if (scrollViewFullScreen_) {
    [UIView animateWithDuration:0.3f
                          delay:0.0f
                        options:UIViewAnimationCurveEaseInOut
                     animations:^{
                       if (topbarView_.alpha < 0.5f) [topbarView_ setAlpha:1.0f];
                       else [topbarView_ setAlpha:0.0f];
                     }
                     completion:nil];
  } else {
    NSInteger currPage = pageControl_.currentPage;
    
    [UIView beginAnimations:@"scale" context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:0.3];
    
    [scrollView_ setFrame:CGRectMake(0.0f, 0.0f, 320.0f + kImageMargin, 480.0f)];
    
    NSInteger i = -1;
    for (UIImageView * thePage in [scrollView_ subviews]) {
      [thePage setBounds:CGRectMake(0.0f, 0.0f, 320.0f, 480.0f)];
      [thePage setFrame:CGRectMake((320.0f + kImageMargin) * ++i, 0.0f, 320.0f, 480.0f)];
      //[thePage setContentScaleFactor:1.0f];
      //[thePage setContentMode:UIViewContentModeCenter];
    }
    
    [topbarView_ setAlpha:1.0f];
    [backgroundView_ setBackgroundColor:[UIColor colorWithWhite:0.0f alpha:1.0f]];
    [UIView commitAnimations];
    
    // Reset the content of scroll view
    pageControl_.currentPage = currPage;
    [scrollView_ setContentSize:CGSizeMake(
                                           scrollView_.contentSize.width + (kImageMargin + 20) * [images_ count], 
                                           scrollView_.contentSize.height )];
    [scrollView_ setContentOffset:CGPointMake(scrollView_.frame.size.width * pageControl_.currentPage, 0.0f)];
    
    scrollViewFullScreen_ = YES;
  }
}


//////////////////////////////////////////////////////////////////////////////
#pragma mark - Button IBAcion
// ---------------------------------------------------------------------------
- (IBAction)scaleBackToSmall:(id)sender
{
  [UIView animateWithDuration:0.15f
                        delay:0.0f
                      options:UIViewAnimationCurveEaseInOut
                   animations:^{
                     // Set top bar to hidden
                     [topbarView_ setAlpha:0.0f];
                   }
                   completion:^(BOOL fin) {
                     [UIView animateWithDuration:0.3f
                                           delay:0.0f
                                         options:UIViewAnimationCurveEaseInOut
                                      animations:^{
                                        // Set the current image size to small
                                        NSInteger i = -1;
                                        for (UIImageView * thePage in [scrollView_ subviews]) {
                                          if (++i == pageControl_.currentPage) {
                                            [thePage setFrame:CGRectMake(thePage.frame.origin.x, 0.0f, 300.0f, kSmallImageHeight)];
                                            break;
                                          }
                                        }
                                        [scrollView_ setFrame:CGRectMake(10.0f, kSmallImageMarginTop, 300.0f, 480.0f)];
                                        [backgroundView_ setBackgroundColor:[UIColor colorWithWhite:0.0f alpha:0.0f]];
                                      }
                                      completion:^(BOOL fin) {
                                        // Set all image size to small
                                        NSInteger i = -1;
                                        for (UIImageView * thePage in [scrollView_ subviews]) {
                                          //[thePage setBounds:CGRectMake(0.0f, (480.0f - kSmallImageHeight) / 2.0f, 300.0f, kSmallImageHeight)];
                                          [thePage setFrame:CGRectMake(300.0f * ++i, 0.0f, 300.0f, kSmallImageHeight)];
                                        }
                                        // Reset the current image's offset in view's content
                                        [scrollView_ setContentOffset:CGPointMake(scrollView_.frame.size.width * pageControl_.currentPage, 0.0f)];

                                        // Reset the content width of scroll view
                                        [scrollView_ setContentSize:CGSizeMake(
                                                                               scrollView_.contentSize.width - (kImageMargin + 20) * [images_ count], 
                                                                               scrollView_.contentSize.height )];
                                      }];
                   }];
  
  scrollViewFullScreen_ = NO;
}

@end
