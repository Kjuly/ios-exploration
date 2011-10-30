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
  NSMutableArray * _images;
  BOOL _scrollViewFullScreen;
}

@property (nonatomic, retain) NSMutableArray * _images;
@property (nonatomic, retain) IBOutlet UIScrollView * _scrollView;
@property (nonatomic, retain) IBOutlet UIView * _topbarView;
@property (nonatomic, retain) IBOutlet UIPageControl * _pageControl;
@property (nonatomic, retain) IBOutlet UIButton * _buttonBack;
@property (assign) BOOL _scrollViewFullScreen;

- (void)setImageSlideView:(UIScrollView *)imageSlideView;
- (IBAction)changePage:(id)sender;
- (IBAction)scaleBackToSmall:(id)sender;

@end
