//
//  AquariumViewController.h
//  PageControl
//
//  Created by David Zeller on 31.05.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface AquariumViewController : UIViewController
{
	UIImageView *imageView;
	UIImage *image;
}

@property (nonatomic, retain) IBOutlet UIImageView *imageView;

- (id)initWithImage:(NSString*)imagePath;

@end
