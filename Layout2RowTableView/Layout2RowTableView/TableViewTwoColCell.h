//
//  TableViewTwoColCell.h
//  Layout2RowTableView
//
//  Created by Kaijie Yu on 11/10/11.
//  Copyright (c) 2011 thePlant. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewTwoColCell : UITableViewCell
{
  UIView * cellBgView_;
  
  UIButton * buttonLeft_;
  UIButton * buttonRight_;
  
  UIImageView * imageViewLeft_;
  UIImageView * imageViewRight;
  
  UILabel * labelLeft_;
  UILabel * labelRight_;
}

@property (nonatomic, retain) UIView * cellBgView;
@property (nonatomic, retain) UIButton * buttonLeft;
@property (nonatomic, retain) UIButton * buttonRight;
@property (nonatomic, retain) UIImageView * imageViewLeft;
@property (nonatomic, retain) UIImageView * imageViewRight;
@property (nonatomic, retain) UILabel * labelLeft;
@property (nonatomic, retain) UILabel * labelRight;

- (void)setUnitLeftWithImage:(NSString *)imageName text:(NSString *)text tag:(NSInteger)tagID;
- (void)setUnitRightWithImage:(NSString *)imageName text:(NSString *)text tag:(NSInteger)tagID;

@end
