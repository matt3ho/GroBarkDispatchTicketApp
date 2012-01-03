//
//  DispatchTicketDetailController.h
//  GroBarkDispatchTicketApp
//
//  Created by Matt Ho on 11-12-31.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DispatchTicketObject.h"

@interface DispatchTicketDetailController : UIViewController 
<UITableViewDelegate, UITableViewDataSource> {
    DispatchTicketObject *dispatchTicketObject;
    //UITableView *dispatchTicketDetailTable;
    //UITableViewCell *dispatchTicketListEntryCell;
    
    UIImageView *driverSignature;
    CGPoint lastPoint;
	BOOL mouseSwiped;
}

@property (strong, nonatomic) DispatchTicketObject *dispatchTicketObject;
//@property (strong, nonatomic) IBOutlet UITableView *dispatchTicketDetailItemTable;
//@property (strong, nonatomic) IBOutlet UITableViewCell *dispatchTicketListEntryCell;

@property (strong, nonatomic) IBOutlet UIImageView *driverSignature;

@property (strong, nonatomic) IBOutlet UILabel *mmNumberLabel;
@property (strong, nonatomic) IBOutlet UILabel *soldToLabel;
@property (strong, nonatomic) IBOutlet UILabel *shipToLabel;
@property (strong, nonatomic) IBOutlet UILabel *destinationLabel;
@property (strong, nonatomic) IBOutlet UILabel *driverLabel;
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;
@property (strong, nonatomic) IBOutlet UILabel *bolPickUpLabel;
@property (strong, nonatomic) IBOutlet UILabel *bolDropOffLabel;
@property (strong, nonatomic) IBOutlet UILabel *GroBarkNumberLabel;
@property (strong, nonatomic) IBOutlet UILabel *LoadedByLabel;
@property (strong, nonatomic) IBOutlet UILabel *NotesLabel;

@end
