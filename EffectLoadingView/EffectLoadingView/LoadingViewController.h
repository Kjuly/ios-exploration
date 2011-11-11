//
//  LoadingViewController.h
//  EffectLoadingView
//
//  Created by Kaijie Yu on 11/11/11.
//  Copyright (c) 2011 thePlant. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoadingViewController : UIViewController
{
  UIView * blackRect_;
  UIActivityIndicatorView * spinner_;
}

@property (nonatomic, retain) UIView * blackRect;
@property (nonatomic, retain) UIActivityIndicatorView * spinner;

@end
