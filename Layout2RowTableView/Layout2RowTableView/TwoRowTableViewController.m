//
//  TwoRowTableViewController.m
//  Layout2RowTableView
//
//  Created by Kaijie Yu on 11/9/11.
//  Copyright (c) 2011 thePlant. All rights reserved.
//

#import "TwoRowTableViewController.h"

@implementation TwoRowTableViewController

- (void)dealloc
{
  [unitArray_ release];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

//////////////////////////////////////////////////////////////////////////////
#pragma mark - View lifecycle
// ---------------------------------------------------------------------------
- (void)viewDidLoad
{
  [super viewDidLoad];

  // Uncomment the following line to preserve selection between presentations.
  // self.clearsSelectionOnViewWillAppear = NO;
 
  // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
  // self.navigationItem.rightBarButtonItem = self.editButtonItem;
  
  NSDictionary * unitDict = [NSDictionary dictionaryWithObjectsAndKeys:
                             @"Layout2RowTableView_145x60.jpg", @"image",
                             @"Little discription", @"text",
                             nil];
  unitArray_ = [[NSMutableArray alloc] initWithObjects:unitDict,
                unitDict, unitDict, unitDict, unitDict, unitDict, unitDict, nil];
}
// ---------------------------------------------------------------------------
- (void)viewDidUnload
{
  [super viewDidUnload];
  // Release any retained subviews of the main view.
  // e.g. self.myOutlet = nil;
}
// ---------------------------------------------------------------------------
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

//////////////////////////////////////////////////////////////////////////////
#pragma mark - Table view data source
// ---------------------------------------------------------------------------
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return [unitArray_ count] / 2.0f + 1.5f;
}

// ---------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *CellIdentifier;
  UITableViewCell *cell;
  
  // Top cell
  if ([indexPath row] == 0) {
    CellIdentifier = @"CellTop";
    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
      cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell
    UIView * cellView = [[UIView alloc] init];
    [cellView setBackgroundColor:[UIColor colorWithWhite:0.95f alpha:1.0f]];
    
    [cellView setFrame:CGRectMake(0.0f, 0.0f, 300.0f, 170.0f)];
    
    // Top image
    UIImage * image = [UIImage imageNamed:@"NTCInfoBg_300x120.jpg"];
    UIImageView * imageView = [[UIImageView alloc] initWithImage:image];
    [imageView setFrame:CGRectMake(10.0f, 10.0f, 300.0f, 120.0f)];
    [cellView addSubview:imageView];
    [imageView release];
    
    // Top text below image
    UILabel * textBelowImage = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 135.0f, 300.0f, 20.0f)];
    [textBelowImage setBackgroundColor:[UIColor clearColor]];
    [textBelowImage setFont:[UIFont systemFontOfSize:18.0f]];
    [textBelowImage setTextColor:[UIColor colorWithWhite:0.0f alpha:1.0f]];
    [textBelowImage setText:@"We recomment to you..."];
    [cellView addSubview:textBelowImage];
    [textBelowImage release];
    
    // Top View Button
    UIButton * viewButton = [[UIButton alloc] initWithFrame:CGRectMake(10.0f, 10.0f, 300.0f, 160.0f)];
    [viewButton setBackgroundColor:[UIColor colorWithWhite:0.0f alpha:0.0f]];
    [viewButton addTarget:self action:@selector(toggleStatusBar:) forControlEvents:UIControlEventTouchUpInside];
    [cell addSubview:viewButton];
    [viewButton release];
    
    [cell setBackgroundView:cellView];
    [cellView release];
  }
  // Two column unit cell
  else {
    CellIdentifier = @"Cell";
    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
      cell = [[[TableViewTwoColCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    TableViewTwoColCell * twoColCell = (TableViewTwoColCell *)cell;
    
    // Half width of cell unit
    NSInteger count = 2;
    for (NSInteger currUnitNum = ([indexPath row] - 1) * 2; count > 0; ++currUnitNum, --count) {
      if (currUnitNum < [unitArray_ count]) {
        if (!(currUnitNum % 2)) {
          [twoColCell setUnitLeftWithImage:[[unitArray_ objectAtIndex:currUnitNum] objectForKey:@"image"]
                                      text:[[unitArray_ objectAtIndex:currUnitNum] objectForKey:@"text"]
                                       tag:currUnitNum];
        } else {
          [twoColCell setUnitRightWithImage:[[unitArray_ objectAtIndex:currUnitNum] objectForKey:@"image"]
                                       text:[[unitArray_ objectAtIndex:currUnitNum] objectForKey:@"text"]
                                        tag:currUnitNum];
        }
        [twoColCell setDelegate:self];
      }
    }
  }
  
  // Cell Setting
  [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
  
  return cell;
}

// ---------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  if ([indexPath row] == 0) return 170.0f;
  else return 100.0f;
}

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

//////////////////////////////////////////////////////////////////////////////
#pragma mark - Table view delegate
// ---------------------------------------------------------------------------
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

//////////////////////////////////////////////////////////////////////////////
#pragma mark - TableViewTwoColCelDelegate
// ---------------------------------------------------------------------------
- (void)loadCategory:(id)sender
{
//  UIViewController * newViewController = [[UIViewController alloc] init];
//  [newViewController.view setBackgroundColor:[UIColor colorWithWhite:0.0f alpha:1.0f]];
//  [self.navigationController pushViewController:newViewController animated:YES];
  
  UIAlertView * alert = [[ UIAlertView alloc]
                        initWithTitle:@"Alert"
                        message:[NSString stringWithFormat:@"Button %d", [sender tag]]
                        delegate:nil
                        cancelButtonTitle:@"OK"
                        otherButtonTitles:nil];
  [alert show];
  [alert release];
}

//////////////////////////////////////////////////////////////////////////////
#pragma mark - Button Action
// ---------------------------------------------------------------------------
- (void)toggleStatusBar:(id)sender
{
  if ([[UIApplication sharedApplication] isStatusBarHidden])
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationSlide];
  else
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
}

@end
