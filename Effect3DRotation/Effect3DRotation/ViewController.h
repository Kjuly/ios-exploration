//
//  ViewController.h
//  Effect3DRotation
//
//  Created by Kaijie Yu on 11/6/11.
//  Copyright (c) 2011 thePlant. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
  UILabel * textLabel_;
  
  BOOL rotated_;
}

@property (nonatomic, retain) UILabel * textLabel;
@property (nonatomic, assign) BOOL rotated;

- (void)doRotate:(id)sender;

@end
