//
//  ViewController.h
//  EffectLoadingView
//
//  Created by Kaijie Yu on 11/11/11.
//  Copyright (c) 2011 thePlant. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LoadingViewController;

@interface ViewController : UIViewController
{
  LoadingViewController * loadingViewController_;
  
  UIButton * loadNewViewButton_;
  UIImageView * imageView_;
}

@property (nonatomic, retain) LoadingViewController * loadingViewController;
@property (nonatomic, retain) UIButton * loadNewViewButton;
@property (nonatomic, retain) UIImageView * imageView;

- (void)loadNewView:(id)sender;
- (void)replaceViewController:(id)sender;

@end
