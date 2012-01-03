//
//  DispatchTicketListObject.m
//  GroBarkDispatchTicketApp
//
//  Created by Matt Ho on 12-01-02.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DispatchTicketObject.h"

@implementation DispatchTicketObject

@synthesize date;
@synthesize origin;
@synthesize destination;
@synthesize product;
@synthesize quantity;
@synthesize bolPickUpLoc;
@synthesize bolDropOffLoc;
@synthesize ticketType;

@synthesize mmNumber;
@synthesize soldTo;
@synthesize shipTo;
@synthesize driver;
@synthesize loadedBy;
@synthesize notes;

@synthesize itemList;

@synthesize groBarkNumber;

+ (NSString*)formatTicketTypeToString:(TicketType)ticketType; {
    NSString *result = nil;
    
    switch(ticketType) {
        case customerDispatch:
            result = @"Customer Dispatch";
            break;
        default:
            [NSException raise:NSGenericException format:@"Unexpected TicketType."];
    }
    
    return result;
}

@end
