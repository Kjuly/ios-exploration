//
//  SlideView.h
//  EffectPicSlide
//
//  Created by Kaijie Yu on 10/27/11.
//  Copyright (c) 2011 thePlant. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SlideView : UIView
{
  UIImageView * _leftImageView;
  UIImageView * _currImageView;
  UIImageView * _rightImageView;
  
  NSArray * _images;    // All images
  NSUInteger _currImage;// Current image view number
  
  BOOL _swiping;        // doing swiping
  CGFloat _swipeStart;  // Value of the starting touch point's x location
}

@property (assign) NSArray * images;
@property (nonatomic, retain) UIImageView * leftImageView;
@property (nonatomic, retain) UIImageView * currImageView;
@property (nonatomic, retain) UIImageView * rightImageView;
@property (assign) NSUInteger currImage;
@property (assign) BOOL swiping;
@property (assign) CGFloat swipeStart;

- (id)initWithImages:(NSArray *)theImages;

@end
