//
//  ColorViewController.h
//  DailyPicker
//
//  Created by Alexey T on 6/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ColorViewController;
@protocol DailyColorDelegate
- (void)colorWasSelected:(ColorViewController *)controller;
@end

@interface ColorViewController : UITableViewController {
    NSArray *colors;
    NSArray *colorNames;
}

@property (nonatomic, weak) id  delegate;

@property (nonatomic, assign) NSUInteger selectedIndex;
@property (strong, nonatomic) UIColor *selectedColor;

@end
