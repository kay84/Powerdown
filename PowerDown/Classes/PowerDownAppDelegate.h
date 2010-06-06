//
//  PowerDownAppDelegate.h
//  PowerDown
//
//  Created by Alexander Kraicsich on 06.06.10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ChallengeViewController.h"
#import "ArenaViewController.h"
#import "AquariumViewController.h"
#import "ShopViewController.h"
#import "PlaceViewController.h"

@interface PowerDownAppDelegate : NSObject <UIApplicationDelegate, UIScrollViewDelegate> {
	
	UIWindow *window;
	UIScrollView *scrollView;
    NSMutableArray *viewControllers;
	
	ChallengeViewController *challengeViewController;
	ShopViewController *shopViewController;
	ArenaViewController *arenaViewController;
	PlaceViewController *placeViewController;
	AquariumViewController *aquariumViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;
@property (nonatomic, retain) NSMutableArray *viewControllers;

@end
