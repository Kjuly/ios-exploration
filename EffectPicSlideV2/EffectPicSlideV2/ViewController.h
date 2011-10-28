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
}

@property (nonatomic, retain) IBOutlet UIScrollView * scrollView;
@property (nonatomic, retain) IBOutlet UIPageControl * pageControl;

- (void)setImageSlideView:(UIScrollView *)imageSlideView;
- (IBAction)changePage:(id)sender;

@end
