//
//  PowerDownAppDelegate.m
//  PowerDown
//
//  Created by Alexander Kraicsich on 06.06.10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "PowerDownAppDelegate.h"
#import "MyViewController.h"

static NSUInteger kNumberOfPages = 5;

@interface PowerDownAppDelegate (PrivateMethods)

-(void)loadViews;
- (void)loadScrollViewWithPage:(int)page;
- (void)scrollViewDidScroll:(UIScrollView *)sender;

@end

@implementation PowerDownAppDelegate

@synthesize window, scrollView, viewControllers;

- (void)dealloc {
    [viewControllers release];
    [scrollView release];
    [window release];
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(UIApplication *)application {
	
    // view controllers are created lazily
    // in the meantime, load the array with placeholders which will be replaced on demand
    NSMutableArray *controllers = [[NSMutableArray alloc] init];
    for (unsigned i = 0; i < kNumberOfPages; i++) {
        [controllers addObject:[NSNull null]];
    }
    self.viewControllers = controllers;
    [controllers release];
	
    // a page is the width of the scroll view
    scrollView.pagingEnabled = YES;
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, scrollView.frame.size.height * kNumberOfPages);
    scrollView.showsHorizontalScrollIndicator = YES;
    scrollView.showsVerticalScrollIndicator = YES;
    scrollView.scrollsToTop = NO;
    scrollView.delegate = self;
	
	[self loadViews];
}

-(void)loadViews
{
	viewControllers = [[NSMutableArray alloc] init];
	
	challengeViewController = [[ChallengeViewController alloc] initWithImage: @"challenges.png"];
	[viewControllers addObject: challengeViewController];
	[challengeViewController release];
	
	if (nil == challengeViewController.view.superview) {
        CGRect frame = scrollView.frame;
        frame.origin.x = frame.size.width * 0;
        frame.origin.y = 0;
        challengeViewController.view.frame = frame;
        [scrollView addSubview:challengeViewController.view];
    }
	
	
	shopViewController = [[ShopViewController alloc] initWithImage: @"shop.png"];
	[viewControllers addObject: shopViewController];
	[shopViewController release];
	
	if (nil == shopViewController.view.superview) {
        CGRect frame = scrollView.frame;
        frame.origin.x = 0;
        frame.origin.y = frame.size.height * 1;
        shopViewController.view.frame = frame;
        [scrollView addSubview:shopViewController.view];
    }
	
	arenaViewController = [[ArenaViewController alloc] initWithImage: @"arena.png"];
	[viewControllers addObject: arenaViewController];
	[arenaViewController release];
	
	if (nil == arenaViewController.view.superview) {
        CGRect frame = scrollView.frame;
        frame.origin.x = 0;
        frame.origin.y = frame.size.height * 2;
        arenaViewController.view.frame = frame;
        [scrollView addSubview:arenaViewController.view];
    }
	
	placeViewController = [[PlaceViewController alloc] initWithImage: @"place.png"];
	[viewControllers addObject: placeViewController];
	[placeViewController release];
	
	if (nil == placeViewController.view.superview) {
        CGRect frame = scrollView.frame;
        frame.origin.x = 0;
        frame.origin.y = frame.size.height * 3;
        placeViewController.view.frame = frame;
        [scrollView addSubview:placeViewController.view];
    }
	
	aquariumViewController = [[AquariumViewController alloc] initWithImage: @"aquarium.png"];
	[viewControllers addObject: aquariumViewController];
	[aquariumViewController release];
	
	if (nil == aquariumViewController.view.superview) {
        CGRect frame = scrollView.frame;
        frame.origin.x = 0;
        frame.origin.y = frame.size.height * 4;
        aquariumViewController.view.frame = frame;
        [scrollView addSubview:aquariumViewController.view];
    }
}

- (void)loadScrollViewWithPage:(int)page {
    if (page < 0) return;
    if (page >= kNumberOfPages) return;
	
    // replace the placeholder if necessary
    MyViewController *controller = [viewControllers objectAtIndex:page];
    if ((NSNull *)controller == [NSNull null]) {
        controller = [[MyViewController alloc] initWithPageNumber:page];
        [viewControllers replaceObjectAtIndex:page withObject:controller];
        [controller release];
    }
	
    // add the controller's view to the scroll view
    if (nil == controller.view.superview) {
        CGRect frame = scrollView.frame;
        frame.origin.x = frame.size.width * page;
        frame.origin.y = 0;
        controller.view.frame = frame;
        [scrollView addSubview:controller.view];
    }
}

//- (void)scrollViewDidScroll:(UIScrollView *)sender
//{
//    // Switch the indicator when more than 50% of the previous/next page is visible
//    CGFloat pageWidth = scrollView.frame.size.width;
//    int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
//
//    // load the visible page and the page on either side of it (to avoid flashes when the user starts scrolling)
//    [self loadScrollViewWithPage:page - 1];
//    [self loadScrollViewWithPage:page];
//    [self loadScrollViewWithPage:page + 1];
//
//    // A possible optimization would be to unload the views+controllers which are no longer visible
//}
//
//// At the begin of scroll dragging, reset the boolean used when scrolls originate from the UIPageControl
//- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
//    pageControlUsed = NO;
//}
//
//// At the end of scroll animation, reset the boolean used when scrolls originate from the UIPageControl
//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
//    pageControlUsed = NO;
//}

@end
