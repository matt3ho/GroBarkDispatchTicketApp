//
//  DispatchTicketListObject.h
//  GroBarkDispatchTicketApp
//
//  Created by Matt Ho on 12-01-02.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kTicketListDateTag 1
#define kTicketListOriginTag 2
#define kTicketListDestinationTag 3
#define kTicketListProductTag 4
#define kTicketListQuantityTag 5
#define kTicketListBolPickUpTag 6
#define kTicketListBolDropOffTag 7
#define kTicketListTicketTypeTag 8

#define kTicketDetailMMNumberTag 1
#define kTicketDetailSoldToTag 2
#define kTicketDetailShipToTag 3
#define kTicketDetailDestinationTag 4
#define kTicketDetailDriverTag 5
#define kTicketDetailDateTag 6
#define kTicketDetailBolPickUpTag 7
#define kTicketDetailBolDropOffTag 8
#define kTicketDetailGroBarkNumberTag 9
#define kTicketDetailLoadedByTag 10
#define kTicketDetailNotesTag 11

typedef enum { 
    customerDispatch = 0,
    //kRectShape, 
} TicketType;

@interface DispatchTicketObject : NSObject {
    NSDate *date;
    NSString *origin;
    NSString *destination;
    NSString *product;
    NSString *weight;
    NSString *bolPickUpLoc;
    NSString *bolDropOffLoc;
    TicketType ticketType;
    
    NSString *mmNumber;
    NSString *soldTo;
    NSString *shipTo;
    NSString *driver;
    NSString *loadedBy;
    NSString *notes;
    
    NSArray *itemList;
    //DriversSig
    //CustomersSig
    
    NSString *groBarkNumber;
}

@property (strong, nonatomic) NSDate *date;
@property (strong, nonatomic) NSString *origin;
@property (strong, nonatomic) NSString *destination;
@property (strong, nonatomic) NSString *product;
@property (strong, nonatomic) NSString *quantity;
@property (strong, nonatomic) NSString *bolPickUpLoc;
@property (strong, nonatomic) NSString *bolDropOffLoc;
@property (nonatomic) TicketType ticketType;

@property (strong, nonatomic) NSString *mmNumber;
@property (strong, nonatomic) NSString *soldTo;
@property (strong, nonatomic) NSString *shipTo;
@property (strong, nonatomic) NSString *driver;
@property (strong, nonatomic) NSString *loadedBy;
@property (strong, nonatomic) NSString *notes;

@property (strong, nonatomic) NSArray *itemList;

@property (strong, nonatomic) NSString *groBarkNumber;

+ (NSString*)formatTicketTypeToString:(TicketType)ticketType;

@end
