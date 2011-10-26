//
//  ViewController.h
//  EffectPicZoom
//
//  Created by Kaijie Yu on 10/26/11.
//  Copyright (c) 2011 thePlant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface ViewController : UIViewController
{
  BOOL imageEnlarged;
}

@property (nonatomic, retain) IBOutlet UIImageView *image;
@property (assign) BOOL imageEnlarged;

@end
