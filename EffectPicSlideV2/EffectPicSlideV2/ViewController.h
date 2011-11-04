//
//  ViewController.h
//  EffectPicSlideV2
//
//  Created by Kaijie Yu on 10/27/11.
//  Copyright (c) 2011 thePlant. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kSmallImageHeight 160
#define kSmallImageMarginTop 100
#define kImageMargin 25

@interface ViewController : UIViewController <UIScrollViewDelegate>
{
  NSMutableArray * images_;
  BOOL scrollViewFullScreen_;
  
  UIScrollView *  scrollView_;
  UIView *        topbarView_;
  UIPageControl * pageControl_;
  UIButton *      buttonBack_;
  UIView *        backgroundView_;
}

@property (nonatomic, retain) NSMutableArray * images;
@property (nonatomic, retain) IBOutlet UIScrollView * scrollView;
@property (nonatomic, retain) IBOutlet UIView * topbarView;
@property (nonatomic, retain) IBOutlet UIPageControl * pageControl;
@property (nonatomic, retain) IBOutlet UIButton * buttonBack;
@property (nonatomic, retain) UIView * backgroundView;
@property (assign) BOOL scrollViewFullScreen;

- (void)setImageSlideView:(UIScrollView *)imageSlideView;
- (IBAction)changePage:(id)sender;
- (IBAction)scaleBackToSmall:(id)sender;

@end
