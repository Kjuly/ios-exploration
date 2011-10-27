//
//  ViewController.h
//  EffectPicSlideV2
//
//  Created by Kaijie Yu on 10/27/11.
//  Copyright (c) 2011 thePlant. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIScrollViewDelegate>
{
  NSMutableArray * _images;
  //NSUInteger _currPageIndex;
}

@property (nonatomic, retain) IBOutlet UIScrollView * scrollView;
@property (nonatomic, retain) IBOutlet UIPageControl * pageControl;
//@property (assign) NSUInteger _currPageIndex;

- (void)setImageSlideView:(UIScrollView *)imageSlideView;
- (IBAction)changePage;

@end
