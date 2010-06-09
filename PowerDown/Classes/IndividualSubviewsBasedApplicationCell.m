#import "IndividualSubviewsBasedApplicationCell.h"

@implementation IndividualSubviewsBasedApplicationCell

@synthesize detailLabel, nameLabel, doButton;

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
    [super setBackgroundColor:backgroundColor];

    iconView.backgroundColor = backgroundColor;
    nameLabel.backgroundColor = backgroundColor;
	detailLabel.backgroundColor = backgroundColor;
}

- (void)setIcon:(UIImage *)newIcon
{
    [super setIcon:newIcon];
    iconView.image = newIcon;
}

- (void)setName:(NSString *)newName
{
    [super setName:newName];
    nameLabel.text = newName;
}

- (void)setDetailString:(NSString *)newDetailString
{
	detailLabel.numberOfLines = 0;
	detailLabel.lineBreakMode = UILineBreakModeWordWrap; 	
    [super setDetailString:newDetailString];
	[detailLabel setText:newDetailString];
}

- (void) rotateAccesoryArrow:(float)grad {
	CGAffineTransform rotate = CGAffineTransformMakeRotation( (grad / 180) * 3.14 );
	[iconView setTransform:rotate];
}

- (void) drawRect:(CGRect)rect {
	//NSLog(@"draw");
	
	[super drawRect:rect];
	
	CGRect cellRect;
	cellRect = CGRectMake(rect.origin.x + 2, rect.origin.y + 2, rect.size.width - 4, rect.size.height - 4);
	
	[self drawBackground:rect];
	[self drawCell:(CGRect)cellRect];
	
	//draw borders
	CGRect tmp;
	tmp = detailLabel.frame;
	[self drawBackground:tmp];
	[self drawCell:tmp];

	
}

- (void)drawCell:(CGRect)rect
{
    static const CGFloat kRoundRectRadius = 8;
    CGContextRef c = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(c, [UIColor lightGrayColor].CGColor);

	CGFloat minx = CGRectGetMinX(rect) , midx = CGRectGetMidX(rect), maxx = CGRectGetMaxX(rect) ;
	CGFloat miny = CGRectGetMinY(rect) , midy = CGRectGetMidY(rect) , maxy = CGRectGetMaxY(rect) ;
	CGContextMoveToPoint(c, minx, midy);
	CGContextAddArcToPoint(c, minx, miny, midx, miny, kRoundRectRadius);
	CGContextAddArcToPoint(c, maxx, miny, maxx, midy, kRoundRectRadius);
	CGContextAddArcToPoint(c, maxx, maxy, midx, maxy, kRoundRectRadius);
	CGContextAddArcToPoint(c, minx, maxy, minx, midy, kRoundRectRadius);
	CGContextClosePath(c);
	CGContextDrawPath(c, kCGPathFill);
}


- (void)drawBackground:(CGRect)rect
{
    static const CGFloat kRoundRectRadius = 10;
    static const CGFloat kFillColor [] = { 1, 1, 1, 0.15f };
	
    CGContextRef c = UIGraphicsGetCurrentContext();
    CGContextSetFillColor(c, kFillColor);
	
    
	CGFloat minx = CGRectGetMinX(rect) , midx = CGRectGetMidX(rect), maxx = CGRectGetMaxX(rect) ;
	CGFloat miny = CGRectGetMinY(rect) , midy = CGRectGetMidY(rect) , maxy = CGRectGetMaxY(rect) ;
	CGContextMoveToPoint(c, minx, midy);
	CGContextAddArcToPoint(c, minx, miny, midx, miny, kRoundRectRadius);
	CGContextAddArcToPoint(c, maxx, miny, maxx, midy, kRoundRectRadius);
	CGContextAddArcToPoint(c, maxx, maxy, midx, maxy, kRoundRectRadius);
	CGContextAddArcToPoint(c, minx, maxy, minx, midy, kRoundRectRadius);
	CGContextClosePath(c);
	CGContextDrawPath(c, kCGPathFill);
}

- (void)dealloc
{
    [iconView release];
    [nameLabel release];
	[detailLabel release];
    [super dealloc];
}

@end
