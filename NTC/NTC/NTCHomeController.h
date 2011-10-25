//
//  NTCHomeController.h
//  NTC
//
//  Created by Kaijie Yu on 10/24/11.
//  Copyright (c) 2011 thePlant. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NTCHomeController : UIViewController
{
  BOOL ntcHomeImgIsEnlarged;
}

- (IBAction)startTrainingPlan:(id)sender;

@property (nonatomic, retain) IBOutlet UIImageView *ntcHomeImg;
@property (assign) BOOL ntcHomeImgIsEnlarged;

@end
