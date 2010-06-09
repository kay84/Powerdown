//
//  ArenaViewController.h
//  PageControl
//
//  Created by David Zeller on 31.05.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IndividualSubviewsBasedApplicationCell.h"s

@interface ArenaViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
	UIImageView *imageView;
	UIImage *image;
	
	UITableView *tableView;
	IndividualSubviewsBasedApplicationCell *tmpCell;
    NSArray *data;
	NSInteger selectedRow;
}

@property (nonatomic, assign) IBOutlet IndividualSubviewsBasedApplicationCell *tmpCell;
@property (nonatomic, retain) IBOutlet UIImageView *imageView;
@property (nonatomic, assign) IBOutlet UITableView *tableView;
@property (nonatomic, retain) NSArray *data;
@property NSInteger selectedRow;

- (id)initWithImage:(NSString*)imagePath;

@end
