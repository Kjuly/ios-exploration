//
//  ViewController.h
//  EffectLoadingView
//
//  Created by Kaijie Yu on 11/11/11.
//  Copyright (c) 2011 thePlant. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
  UIButton * loadNewViewButton_;
  UIImageView * imageView_;
}

@property (nonatomic, retain) UIButton * loadNewViewButton;
@property (nonatomic, retain) UIImageView * imageView;

- (void)loadNewView:(id)sender;
- (void)replaceViewController:(id)sender;

@end
