//
//  ChallengeViewController.m
//  PageControl
//
//  Created by David Zeller on 31.05.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ChallengeViewController.h"
#import "IndividualSubviewsBasedApplicationCell.h"

#define DARK_BACKGROUND  [UIColor colorWithRed:151.0/255.0 green:152.0/255.0 blue:155.0/255.0 alpha:1.0]
#define LIGHT_BACKGROUND [UIColor colorWithRed:172.0/255.0 green:173.0/255.0 blue:175.0/255.0 alpha:1.0]

@implementation ChallengeViewController

@synthesize tmpCell, tableView, data, selectedRow;

#pragma mark View controller methods


// Load the view nib and initialize the pageNumber ivar.
- (id)initWithImage:(NSString*)imagePath
{
    if (self = [super initWithNibName:@"ChallengeView" bundle:nil]) {
		
		//image = [UIImage imageNamed:imagePath];
    }
    return self;
}

/*
 // The designated initializer. Override to perform setup that is required before the view is loaded.
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
 if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
 // Custom initialization
 }
 return self;
 }
 */

/*
 // Implement loadView to create a view hierarchy programmatically, without using a nib.
 - (void)loadView {
 }
 */



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	// Configure the table view.
    self.tableView.backgroundColor = DARK_BACKGROUND;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
	// Load the data.
    NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"Data" ofType:@"plist"];
    self.data = [NSArray arrayWithContentsOfFile:dataPath];
	
	selectedRow = -1;
}



// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	
	[[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationLandscapeLeft];
	return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

#pragma mark Table view methods

- (NSInteger) tableView: (UITableView *) tableView numberOfRowsInSection: (NSInteger) section {
	return [self.data count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *) tableView : (UITableView *) tableView cellForRowAtIndexPath: (NSIndexPath *) indexPath {
	
    static NSString *CellIdentifier = @"ApplicationCell";
    
    IndividualSubviewsBasedApplicationCell *cell = (IndividualSubviewsBasedApplicationCell *)[self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
    if (cell == nil)
    {
		[[NSBundle mainBundle] loadNibNamed:@"IndividualSubviewsBasedApplicationCell" owner:self options:nil];
        cell = tmpCell;
        self.tmpCell = nil;
    }
    
	// Display dark and light background in alternate rows -- see tableView:willDisplayCell:forRowAtIndexPath:.
    cell.useDarkBackground = (indexPath.row % 2 == 0);
	
	// Configure the data for the cell.
	
	NSDictionary *dataItem = [data objectAtIndex:indexPath.row];
    cell.icon = [UIImage imageNamed:[dataItem objectForKey:@"Icon"]];
    cell.name = [dataItem objectForKey:@"Name"];
	cell.detailString = [dataItem objectForKey:@"Detail"];
	
	if (indexPath.row != selectedRow) {
		[cell setDetailLabelHidden:YES];
	}
	
    return cell;
	
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	IndividualSubviewsBasedApplicationCell *cell = (IndividualSubviewsBasedApplicationCell *) [self.tableView cellForRowAtIndexPath:indexPath]; 
	
	if ([cell getDetailLabelHidden]) {
		[cell setDetailLabelHidden:NO];
		selectedRow = indexPath.row;
	} else {
		[cell setDetailLabelHidden:YES];
		selectedRow = -1;
		[self.tableView reloadData];
		
	}
	
	return indexPath;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
	[self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
	[self.tableView reloadData];
}

/*
 - (NSIndexPath *)tableView:(UITableView *)tableView willDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
 NSLog(@"will deselect");
 
 return indexPath;
 }
 
 - (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
 NSLog(@"deselct");
 }*/


- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
	cell.backgroundColor = ((IndividualSubviewsBasedApplicationCell *)cell).useDarkBackground ? DARK_BACKGROUND : LIGHT_BACKGROUND;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return (indexPath.row==selectedRow)? 250:73;	
}

- (void)dealloc {
	[data release];
    [super dealloc];
}

@end
