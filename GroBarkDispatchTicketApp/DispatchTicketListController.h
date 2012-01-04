//
//  GroBarkViewController.h
//  GroBarkDispatchTicketApp
//
//  Created by Matt Ho on 11-12-31.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DispatchTicketDetailController.h"

@class DispatchTicketListController;

@interface DispatchTicketListController : UITableViewController 
<UITableViewDelegate, UITableViewDataSource> {
    DispatchTicketDetailController *dispatchTicketDetailController;
    NSArray *dispatchTicketListObjects;
//    UITableView *dispatchTicketListTable;
    UITableViewCell *dispatchTicketListEntryCell;
}

@property (strong, nonatomic) DispatchTicketDetailController *dispatchTicketDetailController;
@property (strong, nonatomic) NSArray *dispatchTicketListObjects;
//@property (strong, nonatomic) IBOutlet UITableView *dispatchTicketListTable;
@property (strong, nonatomic) IBOutlet UITableViewCell *dispatchTicketListEntryCell;

- (IBAction)openMapLink:(id)sender;

@end
