//
//  TableViewTwoColCell.m
//  Layout2RowTableView
//
//  Created by Kaijie Yu on 11/10/11.
//  Copyright (c) 2011 thePlant. All rights reserved.
//

#import "TableViewTwoColCell.h"

@implementation TableViewTwoColCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  if (self) {
    // Initialization code
    NSLog(@"***");
  }
  return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
  [super setSelected:selected animated:animated];

  // Configure the view for the selected state
}

@end
