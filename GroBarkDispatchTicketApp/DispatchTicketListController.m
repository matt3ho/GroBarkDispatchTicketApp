//
//  GroBarkViewController.m
//  GroBarkDispatchTicketApp
//
//  Created by Matt Ho on 11-12-31.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "DispatchTicketListController.h"

#import "DispatchTicketObject.h"
#import "DispatchTicketItemDetailObject.h"

@implementation DispatchTicketListController

@synthesize dispatchTicketDetailController;
@synthesize dispatchTicketListObjects;
//@synthesize dispatchTicketListTable;
@synthesize dispatchTicketListEntryCell; //no longer needed

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    DispatchTicketObject *dtlo1 = [[DispatchTicketObject alloc] init];
    dtlo1.date = [[NSDate alloc] initWithTimeIntervalSince1970:1307268001];
    dtlo1.origin = @"Seasme St.";
    dtlo1.destination = @"Mars";
    dtlo1.product = @"Real Steel";
    dtlo1.quantity = @"100 kg";
    dtlo1.bolPickUpLoc = @"12345";
    dtlo1.bolDropOffLoc = @"abc123";
    dtlo1.ticketType = customerDispatch;
    
    dtlo1.mmNumber = @"029482";
    dtlo1.soldTo = @"Abacus Ltd.";
    dtlo1.shipTo = @"";
    dtlo1.driver = @"Bob";
    dtlo1.loadedBy = @"Joe";
    dtlo1.notes = @"";
    
    DispatchTicketItemDetailObject *dtido1 = [[DispatchTicketItemDetailObject alloc] init];
    dtido1.quantity = @"143";
    dtido1.description = @"crumbs";
    dtlo1.itemList = [[NSArray alloc] initWithObjects:dtido1, nil];
    
    dtlo1.groBarkNumber = @"391237";
    
    DispatchTicketObject *dtlo2 = [[DispatchTicketObject alloc] init];
    dtlo2.date = [[NSDate alloc] initWithTimeIntervalSince1970:1308268001];
    dtlo2.origin = @"Mo town";
    dtlo2.destination = @"Jupiter";
    dtlo2.product = @"Fake marshmellows";
    dtlo2.quantity = @"999 lbs";
    dtlo2.bolPickUpLoc = @"dfg3462";
    dtlo2.bolDropOffLoc = @"fg6r34";
    dtlo2.ticketType = customerDispatch;
    
    dtlo2.mmNumber = @"049385";
    dtlo2.soldTo = @"Abacus Ltd.";
    dtlo2.shipTo = @"Absinth Ltd.";
    dtlo2.driver = @"Bob";
    dtlo2.loadedBy = @"Ray";
    dtlo2.notes = @"Some notes just in cas";
    
    DispatchTicketItemDetailObject *dtido3 = [[DispatchTicketItemDetailObject alloc] init];
    dtido3.quantity = @"22";
    dtido3.description = @"";
    DispatchTicketItemDetailObject *dtido4 = [[DispatchTicketItemDetailObject alloc] init];
    dtido4.quantity = @"789";
    dtido4.description = @"bumps on a log";
    DispatchTicketItemDetailObject *dtido5 = [[DispatchTicketItemDetailObject alloc] init];
    dtido5.quantity = @"287";
    dtido5.description = @"steel fillings";
    dtlo2.itemList = [[NSArray alloc] initWithObjects:dtido3, dtido4, dtido5, nil];
    
    dtlo2.groBarkNumber = @"3927347";
    
    dispatchTicketListObjects = [[NSArray alloc] initWithObjects:dtlo1, dtlo2, nil];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.dispatchTicketListObjects = nil;
    self.dispatchTicketListEntryCell = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

#pragma mark -
#pragma mark Table View Data Source Methods
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    return [self.dispatchTicketListObjects count]; 
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *DispatchTicketListCellIdentifier = @"DispatchTicketListCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: DispatchTicketListCellIdentifier];
//    if (cell == nil) {
//        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"DispatchTicketListCell"
//                                                     owner:self options:nil]; //automagic wiring
//        if ([nib count] > 0) { 
//            cell = self.dispatchTicketListEntryCell;
//        } else {
//            NSLog(@"failed to load CustomCell nib file!");
//        }
//    }
    
    if (cell != nil)
    {
        UILabel *dateLabel = (UILabel *) [cell.contentView viewWithTag: kTicketListDateTag];
        UILabel *originLabel = (UILabel *) [cell.contentView viewWithTag: kTicketListOriginTag];
        UILabel *destinationLabel = (UILabel *) [cell.contentView viewWithTag: kTicketListDestinationTag];
        UILabel *productLabel = (UILabel *) [cell.contentView viewWithTag: kTicketListProductTag];
        UILabel *quantityLabel = (UILabel *) [cell.contentView viewWithTag: kTicketListQuantityTag];
        UILabel *bolPickUpLocLabel = (UILabel *) [cell.contentView viewWithTag: kTicketListBolPickUpTag];
        UILabel *bolDropOffLocLabel = (UILabel *) [cell.contentView viewWithTag: kTicketListBolDropOffTag];
        UILabel *ticketTypeLabel = (UILabel *) [cell.contentView viewWithTag: kTicketListTicketTypeTag];
        
        NSUInteger row = [indexPath row];
        DispatchTicketObject *dtlo = [self.dispatchTicketListObjects objectAtIndex:row];
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
        dateLabel.text = [dateFormatter stringFromDate:dtlo.date];
        
        originLabel.text = dtlo.origin;
        destinationLabel.text = dtlo.destination;
        productLabel.text = dtlo.product;
        quantityLabel.text = dtlo.quantity;
        bolPickUpLocLabel.text = dtlo.bolPickUpLoc;
        bolDropOffLocLabel.text = dtlo.bolDropOffLoc;
        ticketTypeLabel.text = [DispatchTicketObject formatTicketTypeToString:dtlo.ticketType];
    }
    
    return cell;

}

#pragma mark -
#pragma mark Table Delegate Methods
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    /*
     When a row is selected, the segue creates the detail view controller as the destination.
     Set the detail view controller's detail item to the item associated with the selected row.
     */
    if ([[segue identifier] isEqualToString:@"ShowTicketDetailView"]) {
        
        NSIndexPath *selectedRowIndex = [self.tableView indexPathForSelectedRow];
        self.dispatchTicketDetailController = [segue destinationViewController];
        dispatchTicketDetailController.dispatchTicketObject = [self.dispatchTicketListObjects objectAtIndex:selectedRowIndex.row];
    }
}

//- (void)tableView:(UITableView *)tableView
//didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
////    //    NSUInteger row = [indexPath row];
////    //    NSString *shortMonth = [[self.mileageWeeks objectAtIndex:row] substringWithRange:NSMakeRange(0,3)];
////    //    self.detailViewController.monthLabel.text = shortMonth;
////    
//    NSUInteger row = [indexPath row];
//    DispatchTicketObject *dto = [self.dispatchTicketListObjects objectAtIndex:row];
//    
//     self.dispatchTicketDetailController = [[DispatchTicketDetailController alloc] init];
//    
//    self.dispatchTicketDetailController.dispatchTicketObject = dto;
//    
//    [self.navigationController pushViewController:self.dispatchTicketDetailController animated:YES];  //self.navigationController auto generated
//    
//    
////    self.detailViewController.odometerWeekStartTextField.text = [NSString stringWithFormat:@"%d", mwlo.odometerWeekStart];
////    self.detailViewController.odometerWeekEndTextField.text = [NSString stringWithFormat:@"%d", mwlo.odometerWeekEnd];
////    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
////    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
////    self.detailViewController.monthLabel.text = [[dateFormatter stringFromDate:mwlo.weekStart] substringWithRange:NSMakeRange(0,3)];
////    self.detailViewController.truckNumberLabel.text = mwlo.truckNumber;
////    self.detailViewController.trailerNumberLabel.text = mwlo.trailerNumber;
////    self.detailViewController.nameLabel.text = mwlo.name;
////    
////    [self.detailViewController.dispatchEntryTable reloadData];
////    
////    //    self.detailViewController.detailItem = shortMonth;
////    //    President *prez = [self.list objectAtIndex:row];
////    //    PresidentDetailController *childController = [[PresidentDetailController alloc] initWithStyle:UITableViewStyleGrouped];
////    //    childController.title = prez.name; 
////    //    childController.president = prez;
////    //   
//}


@end
