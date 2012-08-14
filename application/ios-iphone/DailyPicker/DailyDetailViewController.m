//
//  DailyDetailViewController.m
//  DailyPicker
//
//  Created by Alexey T on 6/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DailyDetailViewController.h"

@interface DailyDetailViewController ()
    @property (strong, nonatomic) NSArray *starImageNames;

@end

@implementation DailyDetailViewController

@synthesize saveButton = _saveButton;
@synthesize noteText = _noteText;
@synthesize moodImageView = _moodImageView;
@synthesize ratingImageView = _ratingImageView;
@synthesize selectedColor = _selectedColor;
@synthesize colorView = _colorView;
@synthesize selectedMoodIndex = _selectedMoodIndex;
@synthesize selectedRatingIndex = _selectedRatingIndex;
@synthesize starImageNames = _starImageNames;
@synthesize selectedDate = _selectedDate;

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
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init]; 
    //[dateFormatter setDateFormat:@"MM.dd.yyyy"]; 
    //[dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeZone:[NSTimeZone systemTimeZone]];
    
    NSLog(@"zone - %@", [NSTimeZone systemTimeZone]);
    NSString *dateString = [dateFormatter stringFromDate:self.selectedDate];
    
    self.navigationItem.title = dateString;
    
    self.noteText.delegate = self;
    self.saveButton.enabled = FALSE;
    
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    [self.tableView addGestureRecognizer:gestureRecognizer];
    gestureRecognizer.cancelsTouchesInView = NO;
    
    self.starImageNames = [NSArray arrayWithObjects:@"5StarsSmall.png", @"4StarsSmall.png", @"3StarsSmall.png", @"2StarsSmall.png", @"1StarSmall.png", nil];
}

- (void)viewDidUnload
{
    [self setSaveButton:nil];
    [self setNoteText:nil];
    [self setSelectedColor:nil];
    [self setColorView:nil];
    [self setMoodImageView:nil];
    [self setRatingImageView:nil];
    [self setStarImageNames:nil];
    [self setSelectedDate:nil];
    
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

-(void)viewWillAppear:(BOOL)animated {
    
    if (!self.selectedColor) {
        self.selectedColor = [UIColor whiteColor];
    }
    
    self.colorView.backgroundColor = self.selectedColor;
    
    if (!self.selectedMoodIndex) {
        self.selectedMoodIndex = 0;
    }
    NSLog(@"selectedMoodIndex1 - %d", self.selectedMoodIndex);
    self.moodImageView.image = [UIImage imageNamed:[self.starImageNames objectAtIndex:self.selectedMoodIndex]];
    
    //self.moodImageView.image = [UIImage imageWithContentsOfFile:[self.starImageNames objectAtIndex:self.selectedMoodIndex]];
    
    if (!self.selectedRatingIndex) {
        self.selectedRatingIndex = 0;
    }
    NSLog(@"selectedRatingIndex1 - %d %@", self.selectedRatingIndex, [self.starImageNames objectAtIndex:self.selectedMoodIndex]);
    self.ratingImageView.image = [UIImage imageNamed:[self.starImageNames objectAtIndex:self.selectedRatingIndex]];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

-(void) hideKeyboard {
    [self.noteText resignFirstResponder];
}

//#pragma mark - Table view data source
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//#warning Incomplete method implementation.
//    // Return the number of rows in the section.
//    return 0;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *CellIdentifier = @"Cell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    
//    // Configure the cell...
//    
//    return cell;
//}

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
    
    if (indexPath.section == 1) {
        [self.noteText becomeFirstResponder];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender  // !
{
    if ([segue.identifier isEqualToString:@"PickColorSegue"])
	{
        NSLog(@"Setting daily detail as a delegate of color controller");
        ColorViewController *colorVC = segue.destinationViewController;
        colorVC.delegate = self;
        colorVC.selectedColor = self.selectedColor;
        //colorVC.managedObjectContext = self.managedObjectContext;
	} else if ([segue.identifier isEqualToString:@"PickMoodSegue"])
	{
        NSLog(@"Setting daily detail as a delegate of mood controller");
        MoodViewController *moodVC = segue.destinationViewController;
        moodVC.delegate = self;
        moodVC.selectedIndex = self.selectedMoodIndex;
        //colorVC.managedObjectContext = self.managedObjectContext;
    } else if ([segue.identifier isEqualToString:@"PickRatingSegue"])
	{
        NSLog(@"Setting daily detail as a delegate of rating controller");
        RatingViewController *ratingVC = segue.destinationViewController;
        ratingVC.delegate = self;
        ratingVC.selectedIndex = self.selectedRatingIndex;
        //colorVC.managedObjectContext = self.managedObjectContext;
	}
    else {
        NSLog(@"Unidentified Segue Attempted!");
    }
}

- (void)colorWasSelected:(ColorViewController *)controller 
{
    //self.personRoleTableViewCell.textLabel.text = controller.selectedColor;
    self.selectedColor = controller.selectedColor;
    [controller.navigationController popViewControllerAnimated:YES];
}

-(void)moodWasSelected:(MoodViewController *)controller {
    self.selectedMoodIndex = controller.selectedIndex;
}

-(void)ratingWasSelected:(RatingViewController *)controller {
    self.selectedRatingIndex = controller.selectedIndex;
}

@end
