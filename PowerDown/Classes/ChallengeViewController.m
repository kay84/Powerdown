//
//  ChallengeViewController.m
//  PageControl
//
//  Created by David Zeller on 31.05.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "ChallengeViewController.h"
#import "IndividualSubviewsBasedApplicationCell.h"

//#define DARK_BACKGROUND  [UIColor colorWithRed:151.0/255.0 green:152.0/255.0 blue:155.0/255.0 alpha:1.0]
//#define LIGHT_BACKGROUND [UIColor colorWithRed:172.0/255.0 green:173.0/255.0 blue:175.0/255.0 alpha:1.0]

@implementation ChallengeViewController

@synthesize tmpCell, imageView, tableView, data, selectedRow, tapRecognizer, swipeLeftRecognizer;

#pragma mark View controller methods

// Load the view nib and initialize the pageNumber ivar.
- (id)initWithImage:(NSString*)imagePath
{
    if (self = [super initWithNibName:@"ChallengeView" bundle:nil]) {		
		image = [UIImage imageNamed:imagePath];
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
	
	//***********************
	/*
	 Create and configure the four recognizers. Add each to the view as a gesture recognizer.
	 */
	//UIGestureRecognizer *recognizer;
//	
//	/*
//	 Create a tap recognizer and add it to the view.
//	 Keep a reference to the recognizer to test in gestureRecognizer:shouldReceiveTouch:.
//	 */
//	recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapFrom:)];
//	[self.view addGestureRecognizer:recognizer];
//	self.tapRecognizer = (UITapGestureRecognizer *)recognizer;
//	recognizer.delegate = self;
//	[recognizer release];
//	
//	/*
//	 Create a swipe gesture recognizer to recognize right swipes (the default).
//	 We're only interested in receiving messages from this recognizer, and the view will take ownership of it, so we don't need to keep a reference to it.
//	 */
//	recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom:)];
//	[self.view addGestureRecognizer:recognizer];
//	[recognizer release];
//	
//	/*
//	 Create a swipe gesture recognizer to recognize left swipes.
//	 Keep a reference to the recognizer so that it can be added to and removed from the view in takeLeftSwipeRecognitionEnabledFrom:.
//	 Add the recognizer to the view if the segmented control shows that left swipe recognition is allowed.
//	 */
//	recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom:)];
//	self.swipeLeftRecognizer = (UISwipeGestureRecognizer *)recognizer;
//	
//	swipeLeftRecognizer.direction = UISwipeGestureRecognizerDirectionUp || UISwipeGestureRecognizerDirectionDown;
//	
//	self.swipeLeftRecognizer = (UISwipeGestureRecognizer *)recognizer;
//	[recognizer release];
//	
//	/*
//	 Create a rotation gesture recognizer.
//	 We're only interested in receiving messages from this recognizer, and the view will take ownership of it, so we don't need to keep a reference to it.
//	 */
////	recognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(handleRotationFrom:)];
////	[self.view addGestureRecognizer:recognizer];
////	[recognizer release];
	
	//***********************
	
	imageView.image = image;
	self.view.backgroundColor = [UIColor clearColor];
	
	// Configure the table view.
    self.tableView.backgroundColor = [UIColor clearColor];
//	self.tableView.backgroundView = nil;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
	// Load the data.
    NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"Data" ofType:@"plist"];
    self.data = [NSArray arrayWithContentsOfFile:dataPath];
	
	selectedRow = -1;
}

/*
 In response to a tap gesture, show the image view appropriately then make it fade out in place.
 */
- (void)handleTapFrom:(UITapGestureRecognizer *)recognizer {
	NSLog(@"handleTopFrom");
}

/*
 In response to a swipe gesture, show the image view appropriately then move the image view in the direction of the swipe as it fades out.
 */
- (void)handleSwipeFrom:(UISwipeGestureRecognizer *)recognizer {
	if (recognizer.direction == UISwipeGestureRecognizerDirectionLeft) {
		NSLog(@"swipe left");
	}else {
		NSLog(@"swipe reight");
	}

	
	
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
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
    cell.icon = [UIImage imageNamed:@"square.png"]; //[UIImage imageNamed:[dataItem objectForKey:@"Icon"]];
    cell.name = [dataItem objectForKey:@"Name"];
	cell.detailString = [dataItem objectForKey:@"Detail"];
	
	//rahmen zeichnen
	
	//cell.nameLabel.layer.borderColor = [UIColor greenColor].CGColor;
//	cell.nameLabel.layer.borderWidth = 3.0;;
	
	//cell.detailLabel.layer.borderColor = [UIColor greenColor].CGColor;
	//cell.detailLabel.layer.borderWidth = 3.0;;
	
	//elemente verstecken
	
	if (indexPath.row != selectedRow) {
		[[cell detailLabel] setHidden:YES];
		[[cell doButton] setHidden:YES];
		[cell rotateAccesoryArrow:0];
	}	
    return cell;
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	IndividualSubviewsBasedApplicationCell *cell = (IndividualSubviewsBasedApplicationCell *) [self.tableView cellForRowAtIndexPath:indexPath]; 
	
	if ([cell detailLabel].hidden) {
		[[cell detailLabel] setHidden:NO];
		[[cell doButton] setHidden:NO];
		[cell rotateAccesoryArrow:-90];
		selectedRow = indexPath.row;		
	} else {
		[[cell detailLabel] setHidden:YES];
		[[cell doButton] setHidden:YES];
		[cell rotateAccesoryArrow:0];
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
	//cell.backgroundColor = ((IndividualSubviewsBasedApplicationCell *)cell).useDarkBackground ? DARK_BACKGROUND : LIGHT_BACKGROUND;
//	if (indexPath == selectedRow) {
//		cell.backgroundColor = LIGHT_BACKGROUND;
//	} else {
//		cell.backgroundColor = DARK_BACKGROUND;
//	}
	
	cell.backgroundColor = [UIColor clearColor];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return (indexPath.row==selectedRow)? 250:73;	
}

- (void)dealloc {
	[data release];
    [super dealloc];
}

@end
