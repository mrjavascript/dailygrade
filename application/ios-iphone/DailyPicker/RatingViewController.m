//
//  RatingViewController.m
//  DailyPicker
//
//  Created by Alexey T on 5/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RatingViewController.h"

@interface RatingViewController ()

@end

@implementation RatingViewController

@synthesize selectedIndex = _selectedIndex;
@synthesize delegate;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    stars = [NSArray arrayWithObjects:[UIImage imageNamed:@"5Stars"], [UIImage imageNamed:@"4Stars"],
             [UIImage imageNamed:@"3Stars"], [UIImage imageNamed:@"2Stars"], [UIImage imageNamed:@"1Star"], nil];
    //self.selectedIndex = 1;
    // implement later
    //self.selectedIndex = [stars indexOfObject:self.myRating];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    stars = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [stars count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    static NSString *CellIdentifier = @"Cell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RatingCell"];
	//cell.textLabel.text = [stars objectAtIndex:indexPath.row];
    
    UIImageView *tmpRating = (UIImageView *) [cell viewWithTag:101];
    tmpRating.image = [stars objectAtIndex:indexPath.row];
    
	if (indexPath.row == self.selectedIndex)
		cell.accessoryType = UITableViewCellAccessoryCheckmark;
	else
		cell.accessoryType = UITableViewCellAccessoryNone;
        
    return cell;
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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
	if (self.selectedIndex != NSNotFound)
	{
		UITableViewCell *cell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:self.selectedIndex inSection:0]];
		cell.accessoryType = UITableViewCellAccessoryNone;
	}
    
	self.selectedIndex = indexPath.row;
	UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
	cell.accessoryType = UITableViewCellAccessoryCheckmark;
    
    NSLog(@"reports that the %d rating was selected", self.selectedIndex);
	[self.delegate ratingWasSelected:self];
    
//	NSString *theGame = [games objectAtIndex:indexPath.row];
//	[self.delegate gamePickerViewController:self didSelectGame:theGame];
}


@end
