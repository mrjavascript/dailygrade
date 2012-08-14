//
//  DailyDetailViewController.h
//  DailyPicker
//
//  Created by Alexey T on 6/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ColorViewController.h"
#import "MoodViewController.h"
#import "RatingViewController.h"

@interface DailyDetailViewController : UITableViewController <UITextViewDelegate, DailyColorDelegate, DailyMoodDelegate, DailyRatingDelegate> 

@property (strong, nonatomic) IBOutlet UIBarButtonItem *saveButton;

@property (strong, nonatomic) IBOutlet UITextView *noteText;

@property (weak, nonatomic) IBOutlet UIImageView *moodImageView;
@property (weak, nonatomic) IBOutlet UIImageView *ratingImageView;

@property (strong, nonatomic) UIColor *selectedColor;
@property (weak, nonatomic) IBOutlet UIView *colorView;
@property (nonatomic, assign) NSUInteger selectedMoodIndex;
@property (nonatomic, assign) NSUInteger selectedRatingIndex;
@property (strong, nonatomic) NSDate *selectedDate;

-(void) hideKeyboard;

@end
