//
//  MoodViewController.h
//  DailyPicker
//
//  Created by Alexey T on 6/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MoodViewController;
@protocol DailyMoodDelegate
- (void)moodWasSelected:(MoodViewController *)controller;
@end

@interface MoodViewController : UITableViewController {
    NSArray *stars;
}

@property (nonatomic, weak) id  delegate;

@property (nonatomic, assign) NSUInteger selectedIndex;
//@property (strong, nonatomic) UIColor *selectedColor;

@end
