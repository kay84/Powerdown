//
//  ArenaViewController.h
//  PageControl
//
//  Created by David Zeller on 31.05.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ArenaApplicationCell.h"

@interface ArenaViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
	UIImageView *imageView;
	UIImage *image;
	
	UIImageView *myFishView; 
	UIImageView *enemyFischView;
	UIImage *myFischImage; 
	UIImage *enemyFischImage;
	
	UITableView *tableView;
	ArenaApplicationCell *tmpCell;
    NSArray *data;
	NSInteger selectedRow;
}

@property (nonatomic, assign) IBOutlet ArenaApplicationCell *tmpCell;
@property (nonatomic, retain) IBOutlet UIImageView *imageView;
@property (nonatomic, retain) IBOutlet UIImageView *myFishView; 
@property (nonatomic, retain) IBOutlet UIImageView *enemyFischView;
@property (nonatomic, assign) IBOutlet UITableView *tableView;
@property (nonatomic, retain) NSArray *data;
@property NSInteger selectedRow;

- (id)initWithImage:(NSString*)imagePath;

@end
