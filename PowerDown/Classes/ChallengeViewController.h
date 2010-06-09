//
//  ChallengeViewController.h
//  PageControl
//
//  Created by David Zeller on 31.05.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "IndividualSubviewsBasedApplicationCell.h"


@interface ChallengeViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate> {
	
	UIImageView *imageView;
	UIImage *image;
	
	UITableView *tableView;
	IndividualSubviewsBasedApplicationCell *tmpCell;
    NSArray *data;
	NSInteger selectedRow;
	
	UITapGestureRecognizer *tapRecognizer;
	UISwipeGestureRecognizer *swipeLeftRecognizer;
}

@property (nonatomic, assign) IBOutlet IndividualSubviewsBasedApplicationCell *tmpCell;
@property (nonatomic, retain) IBOutlet UIImageView *imageView;
@property (nonatomic, assign) IBOutlet UITableView *tableView;
@property (nonatomic, retain) NSArray *data;
@property NSInteger selectedRow;

@property (nonatomic, retain) UITapGestureRecognizer *tapRecognizer;
@property (nonatomic, retain) UISwipeGestureRecognizer *swipeLeftRecognizer;

- (id)initWithImage:(NSString*)imagePath;

@end
