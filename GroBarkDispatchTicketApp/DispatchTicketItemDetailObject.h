//
//  DispatchTicketItemDetailObject.h
//  GroBarkDispatchTicketApp
//
//  Created by Matt Ho on 12-01-03.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kTicketDetailItemListQuantityTag 1
#define kTicketDetailItemListDescriptionTag 2

@interface DispatchTicketItemDetailObject : NSObject {
    NSString *quantity;
    NSString *description;
}

@property (strong, nonatomic) NSString *quantity;
@property (strong, nonatomic) NSString *description;

@end
