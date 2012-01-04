//
//  DispatchTicketDetailController.m
//  GroBarkDispatchTicketApp
//
//  Created by Matt Ho on 11-12-31.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "DispatchTicketDetailController.h"

#import "DispatchTicketItemDetailObject.h"

@implementation DispatchTicketDetailController

@synthesize dispatchTicketObject;

@synthesize driverSignature;
@synthesize receiverSignature;

@synthesize mmNumberLabel;
@synthesize soldToLabel;
@synthesize shipToLabel;
@synthesize destinationLabel;
@synthesize driverLabel;
@synthesize dateLabel;
@synthesize bolPickUpLabel;
@synthesize bolDropOffLabel;
@synthesize GroBarkNumberLabel;
@synthesize LoadedByLabel;
@synthesize NotesLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.mmNumberLabel.text = self.dispatchTicketObject.mmNumber;
    self.soldToLabel.text = self.dispatchTicketObject.soldTo;
    self.shipToLabel.text = self.dispatchTicketObject.shipTo;
    self.destinationLabel.text = self.dispatchTicketObject.destination;
    self.driverLabel.text = self.dispatchTicketObject.driver;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    self.dateLabel.text = [dateFormatter stringFromDate:self.dispatchTicketObject.date];
    
    self.bolPickUpLabel.text = self.dispatchTicketObject.bolPickUpLoc;
    self.bolDropOffLabel.text = self.dispatchTicketObject.bolDropOffLoc;
    self.GroBarkNumberLabel.text = self.dispatchTicketObject.groBarkNumber;
    self.LoadedByLabel.text = self.dispatchTicketObject.loadedBy;
    self.NotesLabel.text = self.dispatchTicketObject.notes;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

/*
 Returns nil if touch is not inside driver or receiver signature image, otherwise returns the imageview it is in as a UIImageView
 */
-(UIImageView*)privateTouchInsideSignatureView:(UITouch*)touch withEvent:(UIEvent *)event {
    CGPoint touchPoint = [touch locationInView: self.view];
    UIImageView *signatureImage = nil;
    if ([self.driverSignature pointInside:[self.view convertPoint:touchPoint toView:self.driverSignature] withEvent:event]) {
        signatureImage = self.driverSignature;
    } else if ([self.receiverSignature pointInside:[self.view convertPoint:touchPoint toView:self.receiverSignature] withEvent:event]) {
        signatureImage = self.receiverSignature;
    }
    
    return signatureImage;
}

#pragma mark -
#pragma mark Signature Drawing Methods
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event { //implement touches cancelled as well?	
	mouseSwiped = NO;
    
    UITouch *touch = [touches anyObject];
    UIImageView *signatureView = [self privateTouchInsideSignatureView:touch withEvent:event];
    
    if (signatureView != nil)
    {
        if ([touch tapCount] == 2) {
            signatureView.image = nil;
            return;
        }
        
        lastPoint = [touch locationInView:signatureView];
//        lastPoint.y -= 20;
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	mouseSwiped = YES;
	
	UITouch *touch = [touches anyObject];	
    UIImageView *signatureView = [self privateTouchInsideSignatureView:touch withEvent:event];
    
    if (signatureView != nil)
    {
        CGPoint currentPoint = [touch locationInView:signatureView];
        //currentPoint.y -= 20;
        
        UIGraphicsBeginImageContext(signatureView.frame.size);
        [signatureView.image drawInRect:CGRectMake(0, 0, signatureView.frame.size.width, signatureView.frame.size.height)];
        CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
        CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 3.0);
        CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 0.482, 0.62, 0.871, 1.0); //blue
        CGContextBeginPath(UIGraphicsGetCurrentContext());
        CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
        CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y);
        CGContextStrokePath(UIGraphicsGetCurrentContext());
        signatureView.image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        lastPoint = currentPoint;
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	
	UITouch *touch = [touches anyObject];
    UIImageView *signatureView = [self privateTouchInsideSignatureView:touch withEvent:event];
    
    if (signatureView != nil)
    {
        if ([touch tapCount] == 2) {
            signatureView.image = nil;
            return;
        }
        
        if(!mouseSwiped) {
            UIGraphicsBeginImageContext(signatureView.frame.size);
            [signatureView.image drawInRect:CGRectMake(0, 0, signatureView.frame.size.width, signatureView.frame.size.height)];
            CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
            CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 3.0);
            CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 0.482, 0.62, 0.871, 1.0); //blue
            CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
            CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
            CGContextStrokePath(UIGraphicsGetCurrentContext());
            CGContextFlush(UIGraphicsGetCurrentContext());
            signatureView.image = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
        }
    }
}

#pragma mark -
#pragma mark Table View Data Source Methods
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    return [self.dispatchTicketObject.itemList count]; 
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *DispatchTicketItemDetailCell = @"DispatchTicketItemDetailCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: DispatchTicketItemDetailCell];
    
    if (cell != nil)
    {
        UILabel *quantityLabel = (UILabel *) [cell.contentView viewWithTag: kTicketDetailItemListQuantityTag];
        UILabel *descriptionLabel = (UILabel *) [cell.contentView viewWithTag: kTicketDetailItemListDescriptionTag];
        
        NSUInteger row = [indexPath row];
        DispatchTicketItemDetailObject *dtido = [self.dispatchTicketObject.itemList objectAtIndex:row];
        
        quantityLabel.text = dtido.quantity;
        descriptionLabel.text = dtido.description;
    }
    
    return cell;
}

#pragma mark -
#pragma mark Table Delegate Methods

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}

@end
