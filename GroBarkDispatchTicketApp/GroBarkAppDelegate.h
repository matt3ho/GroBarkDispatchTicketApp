//
//  GroBarkAppDelegate.h
//  GroBarkDispatchTicketApp
//
//  Created by Matt Ho on 11-12-31.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GroBarkAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@end

/*
Create basic ticket list array for list table (create object) - done
Display array in DispatchTicketListCell - done
Click takes me to detail view
Detail view has fields change when list object changes (create object, outlet)
Detail view has proper navigation button on top
 
Detail view captures signature image
Map image link in ticket list opens up google maps
*/