//
//  SlideView.m
//  EffectPicSlide
//
//  Created by Kaijie Yu on 10/27/11.
//  Copyright (c) 2011 thePlant. All rights reserved.
//

#import "SlideView.h"

@implementation SlideView

@synthesize currImageView = _currImageView;
@synthesize leftImageView = _leftImageView;
@synthesize rightImageView = _rightImageView;
@synthesize images = _images, currImage = _currImage, swiping = _swiping, swipeStart = _swipeStart;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)dealloc
{
  [_images release];
  [_leftImageView release];
  [_currImageView release];
  [_rightImageView release];
  [super dealloc];
}

- (UIImageView *)createImageView:(NSUInteger)theImageIndex
{
  if (theImageIndex >= [_images count]) return nil;
  
  UIImageView * result = [[UIImageView alloc] initWithImage:[_images objectAtIndex:theImageIndex]];
  result.opaque = YES;
  result.userInteractionEnabled = NO;
  result.backgroundColor = [UIColor blackColor];
  result.contentMode = UIViewContentModeScaleAspectFit;
  result.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  return result;
}

- (id)initWithImages:(NSArray *)theImages
{
  if (self == [super initWithFrame:CGRectZero]) {
    _images = [theImages retain];
    
    if ([theImages count] > 0) {
      _currImageView = [self createImageView:0];
      [self addSubview:_currImageView];
      
      if ([theImages count] > 1) {
        _rightImageView = [self createImageView:1];
        [self addSubview:_rightImageView];
      }
    }
  }
  self.opaque = YES;
  self.backgroundColor = [UIColor blackColor];
  self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  
  return self;
}

- (void)layoutSubviews
{
  if (_swiping) return;
  
  CGSize contentSize = self.frame.size;
  _leftImageView.frame = CGRectMake(-contentSize.width, 0.0f, contentSize.width, contentSize.height);
  _currImageView.frame = CGRectMake(0.0f, 0.0f, contentSize.width, contentSize.height);
  _rightImageView.frame = CGRectMake(contentSize.width, 0.0f, contentSize.width, contentSize.height);
}

#pragma mark - Touch

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
  if ([touches count] != 1) return;
  
  _swipeStart = [[touches anyObject] locationInView:self].x;
  _swiping = YES;
  
  _leftImageView.hidden = NO;
  _currImageView.hidden = NO;
  _rightImageView.hidden = NO;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
  if (!_swiping || [touches count] != 1) return;
  
  CGFloat swipeDistance = [[touches anyObject] locationInView:self].x - _swipeStart;
  CGSize contentSize = self.frame.size;
  
  _leftImageView.frame = CGRectMake(swipeDistance - contentSize.width, 0.0f, contentSize.width, contentSize.height);
  _currImageView.frame = CGRectMake(swipeDistance, 0.0f, contentSize.width, contentSize.height);
  _rightImageView.frame = CGRectMake(swipeDistance + contentSize.width, 0.0f, contentSize.width, contentSize.height);
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
  if (!_swiping) return;
  
  CGFloat swipeDistance = [[touches anyObject] locationInView:self].x - _swipeStart;
  
  // Swipe to show the left image
  if (_currImage > 0 && swipeDistance > 50.0f) {
    [_rightImageView removeFromSuperview];
    [_rightImageView release];
    
    _rightImageView = _currImageView;
    _currImageView = _leftImageView;
    --_currImage;
    
    if (_currImage > 0) {
      _leftImageView = [self createImageView:_currImage - 1];
      _leftImageView.hidden = YES;
      [self addSubview:_leftImageView];
    } else {
      _leftImageView = nil;
    }
  }
  // Swipe to show the right image
  else if (_currImage < [_images count] - 1 && swipeDistance < -50.0f) {
    [_leftImageView removeFromSuperview];
    [_leftImageView release];
    
    _leftImageView = _currImageView;
    _currImageView = _rightImageView;
    ++_currImage;
    
    if (_currImage < [_images count] - 1) {
      _rightImageView = [self createImageView:_currImage + 1];
      _rightImageView.hidden = YES;
      [self addSubview:_rightImageView];
    } else {
      _rightImageView = nil;
    }
  }
  
  // Slide the view to show the full image
  [UIView beginAnimations:@"swipe" context:nil];
  [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
  [UIView setAnimationDuration:0.3f];
  
  CGSize contentSize = self.frame.size;
  _leftImageView.frame = CGRectMake(-contentSize.width, 0.0f, contentSize.width, contentSize.height);
  _currImageView.frame = CGRectMake(0.0f, 0.0f, contentSize.width, contentSize.height);
  _rightImageView.frame = CGRectMake(contentSize.width, 0.0F, contentSize.width, contentSize.height);
  
  [UIView commitAnimations];
  
  _swiping = NO;
}

@end
