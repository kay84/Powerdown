//
//  AquariumViewController.m
//  PageControl
//
//  Created by David Zeller on 31.05.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "AquariumViewController.h"


@implementation AquariumViewController

@synthesize imageView;

// Load the view nib and initialize the pageNumber ivar.
- (id)initWithImage:(NSString*)imagePath
{
    if (self = [super initWithNibName:@"AquariumView" bundle:nil]) {
		
		image = [UIImage imageNamed:imagePath];
    }
    return self;
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {	
	[[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationLandscapeLeft];
	return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}

- (void)dealloc
{
	
	[imageView release];
	[image release];
    [super dealloc];
}

// Set the label and background color when the view has finished loading.
- (void)viewDidLoad
{
	imageView.image = image;
	self.view.backgroundColor = [UIColor yellowColor];
}

@end
