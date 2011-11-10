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
  UIButton * buttonLeft_;
  UIButton * buttonRight_;
  
  UIImageView * imageViewLeft_;
  UIImageView * imageViewRight;
  
  UILabel * labelLeft_;
  UILabel * labelRight_;
}

@end
