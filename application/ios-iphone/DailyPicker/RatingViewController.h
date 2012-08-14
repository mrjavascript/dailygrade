//
//  RatingViewController.h
//  DailyPicker
//
//  Created by Alexey T on 5/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RatingViewController;
@protocol DailyRatingDelegate
- (void)ratingWasSelected:(RatingViewController *)controller;
@end

@interface RatingViewController : UITableViewController {
    NSArray *stars;
}

@property (nonatomic, weak) id delegate;

@property (nonatomic, assign) NSUInteger selectedIndex;

@end
