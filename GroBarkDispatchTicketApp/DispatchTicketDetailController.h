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
    UITableView *dispatchTicketDetailTable;
    //UITableViewCell *dispatchTicketListEntryCell;
}

@property (strong, nonatomic) DispatchTicketObject *dispatchTicketObject;
@property (strong, nonatomic) IBOutlet UITableView *dispatchTicketDetailTable;
//@property (strong, nonatomic) IBOutlet UITableViewCell *dispatchTicketListEntryCell;

@end
