//
//  TableViewController.m
//  EffectTableViewPull
//
//  Created by Kaijie Yu on 10/31/11.
//  Copyright (c) 2011 thePlant. All rights reserved.
//

#import "TableViewController.h"

@implementation TableViewController

@synthesize rootTableView = rootTableView_;
@synthesize reloading = reloading_;

- (id)initWithStyle:(UITableViewStyle)style
{
  self = [super initWithStyle:style];
  if (self) {
  }
  
  return self;
}

- (void)didReceiveMemoryWarning
{
  // Releases the view if it doesn't have a superview.
  [super didReceiveMemoryWarning];
  
  // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
  [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
  
  if (rootTableView_ == nil) {
    EGORefreshTableHeaderView * newView = [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0.0f, 0.0f - self.tableView.bounds.size.height, self.view.frame.size.width, self.tableView.bounds.size.height)];
    [newView setDelegate:self];
    [self.tableView addSubview:newView];
    rootTableView_ = newView;
    [newView release];
  }
  
  // Update the last update time
  [rootTableView_ refreshLastUpdatedDate];
  
  
}

- (void)viewDidUnload
{
  [super viewDidUnload];
  
  rootTableView_ = nil;
}

- (void)dealloc
{
  [rootTableView_ release];
  [super release];
}

- (void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
  [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
  [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
  [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  // Return YES for supported orientations
  return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *CellIdentifier = @"Cell";
  
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (cell == nil) {
    cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
  }
  
  // Configure the cell...
  UIView * cellView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 300.0f, 165.0f)];
  [cellView setBackgroundColor:[UIColor colorWithWhite:0.95f alpha:1.0f]];
  
  // Image View
  UIImage * image;
  switch ([indexPath row] % 3) {
    case 0:
      image = [UIImage imageNamed:@"NTCInfoBg_300x120.jpg"];
      break;
    case 1:
      image = [UIImage imageNamed:@"NTCHomeMainPic_300x120.jpg"];
      break;
    case 2:
      image = [UIImage imageNamed:@"Eight_300x120.png"];
      break;
    default:
      break;
  }
  UIImageView * imageView = [[UIImageView alloc] initWithImage:image];
  [imageView setFrame:CGRectMake(10.0f, 10.0f, 300.0f, 120.0f)];
  
  [cellView addSubview:imageView];
  [imageView release];
  
  // Label below ImageView
  UILabel * textBelow = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 135.0f, 300.0f, 20.0f)];
  [textBelow setBackgroundColor:[UIColor clearColor]];
  [textBelow setFont:[UIFont systemFontOfSize:12.0f]];
  [textBelow setTextColor:[UIColor colorWithWhite:0.0f alpha:1.0f]];
  [textBelow setText:@"Textbelow Image View"];
  
  [cellView addSubview:textBelow];
  [textBelow release];
  
  // Cell Setting
  [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
  [cell setBackgroundView:cellView];
  [cellView release];
  
  return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  return 165.0f;
}

/*- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
  return [NSString stringWithFormat:@"Section %i", section];
}*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  // Navigation logic may go here. Create and push another view controller.
  /*
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
    // ...
    // Pass the selected object to the new view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
    [detailViewController release];
  */
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
  UIView * sectionTop = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 5.0f)];
  [sectionTop setBackgroundColor:[UIColor colorWithWhite:0.95f alpha:1.0f]];
  
  /*if (section == 0) {
    [[sectionTop layer] setCornerRadius:2.0f];
  }*/
  
  return sectionTop;
}

#pragma mark - Pull table view data

- (void)reloadTableViewDataSource
{
  reloading_ = YES;
}

- (void)doneLoadingTableViewData
{
  reloading_ = NO;
  [rootTableView_ egoRefreshScrollViewDataSourceDidFinishedLoading:self.tableView];
}

#pragma mark - EGORefreshTableHeaderDelegate Methods

- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView *)view
{
  [self reloadTableViewDataSource];
  [self performSelector:@selector(doneLoadingTableViewData) withObject:nil afterDelay:3.0];
}

- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView *)view
{
  return reloading_;
}

// Return date data source that was last changed
- (NSDate *)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView *)view
{
  return [NSDate date];
}

#pragma mark - UIScrollViewDelegate methods

// Table view do action when scrollview did scroll
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
  [rootTableView_ egoRefreshScrollViewDidScroll:scrollView];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
  [rootTableView_ egoRefreshScrollViewDidEndDragging:scrollView];
}

#pragma mark - Custom UI

@end
