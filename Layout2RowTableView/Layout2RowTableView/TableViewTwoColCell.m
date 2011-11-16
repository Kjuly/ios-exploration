//
//  TableViewTwoColCell.m
//  Layout2RowTableView
//
//  Created by Kaijie Yu on 11/10/11.
//  Copyright (c) 2011 thePlant. All rights reserved.
//

#import "TableViewTwoColCell.h"

@implementation TableViewTwoColCell

@synthesize delegate = delegate_;
@synthesize cellBgView = cellBgView_;
@synthesize buttonLeft = buttonLeft_, buttonRight = buttonRight_;
@synthesize imageViewLeft = imageViewLeft_, imageViewRight = imageViewRight_;
@synthesize labelLeft = labelLeft_, labelRight = labelRight_;

// ---------------------------------------------------------------------------
- (void)dealloc
{
  self.cellBgView = nil;
  self.buttonLeft = nil;
  self.buttonRight = nil;
  self.imageViewLeft = nil;
  self.imageViewRight = nil;
  self.labelLeft = nil;
  self.labelRight = nil;
  
  [cellBgView_ release];
  [buttonLeft_ release];
  [buttonRight_ release];
  [imageViewLeft_ release];
  [imageViewRight_ release];
  [labelLeft_ release];
  [labelRight_ release];
  [super dealloc];
}

// ---------------------------------------------------------------------------
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  if (self) {
    self.cellBgView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 300.0f, 100.0f)];
    [self.cellBgView setBackgroundColor:[UIColor colorWithWhite:0.95f alpha:1.0f]];
    
    // Center vertical seperate line in cell
    UIView * virtSeperateLine = [[UIView alloc] initWithFrame:CGRectMake(159.5f, 0.0f, 1.0f, self.cellBgView.frame.size.height)];
    [virtSeperateLine setBackgroundColor:[UIColor colorWithWhite:0.8f alpha:1.0f]];
    [self.cellBgView addSubview:virtSeperateLine];
    [virtSeperateLine release];
    
    // Unit Image
    self.imageViewLeft = [[UIImageView alloc] initWithFrame:CGRectMake(10.0f, 10.0f, 145.0f, 60.0f)];
    [self.cellBgView addSubview:self.imageViewLeft];
    self.imageViewRight = [[UIImageView alloc] initWithFrame:CGRectMake(165.0f, 10.0f, 145.0f, 60.0f)];
    [self.cellBgView addSubview:self.imageViewRight];
    
    // Unit Text
    self.labelLeft = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 70.0f, 145.0f, self.cellBgView.frame.size.height - 60.0f - 10.0f)];
    [self.labelLeft setBackgroundColor:[UIColor clearColor]];
    [self.labelLeft setFont:[UIFont systemFontOfSize:12.0f]];
    [self.labelLeft setTextColor:[UIColor colorWithWhite:0.0f alpha:1.0f]];
    [self.cellBgView addSubview:self.labelLeft];
    
    self.labelRight = [[UILabel alloc] initWithFrame:CGRectMake(165.0f, 70.0f, 145.0f, self.cellBgView.frame.size.height - 60.0f - 10.0f)];
    [self.labelRight setBackgroundColor:[UIColor clearColor]];
    [self.labelRight setFont:[UIFont systemFontOfSize:12.0f]];
    [self.labelRight setTextColor:[UIColor colorWithWhite:0.0f alpha:1.0f]];
    [self.cellBgView addSubview:self.labelRight];
    
    // Unit Button
    self.buttonLeft = [[UIButton alloc] initWithFrame:CGRectMake(10.0f, 0.0f, 145.0f, 100.0f)];
    [self.buttonLeft setBackgroundColor:[UIColor colorWithWhite:0.0f alpha:0.0f]];
    [self.buttonLeft addTarget:self.delegate action:@selector(loadCategory:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.buttonLeft];
    
    self.buttonRight = [[UIButton alloc] initWithFrame:CGRectMake(165.0f, 0.0f, 145.0f, 100.0f)];
    [self.buttonRight setBackgroundColor:[UIColor colorWithWhite:0.0f alpha:0.0f]];
    [self.buttonRight addTarget:self.delegate action:@selector(loadCategory:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.buttonRight];
    
    [self setBackgroundView:self.cellBgView];
  }
  return self;
}

// ---------------------------------------------------------------------------
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
  [super setSelected:selected animated:animated];

  // Configure the view for the selected state
}

//////////////////////////////////////////////////////////////////////////////
#pragma mark - Setting
// ---------------------------------------------------------------------------
- (void)setUnitLeftWithImage:(NSString *)imageName text:(NSString *)text tag:(NSInteger)tagID
{
  [self.imageViewLeft setImage:[UIImage imageNamed:imageName]];
  [self.labelLeft setText:text];
  [self.buttonLeft setTag:tagID];
}

// ---------------------------------------------------------------------------
- (void)setUnitRightWithImage:(NSString *)imageName text:(NSString *)text tag:(NSInteger)tagID
{
  [self.imageViewRight setImage:[UIImage imageNamed:imageName]];
  [self.labelRight setText:text];
  [self.buttonRight setTag:tagID];
}

@end
