//
//  HelloIPadAppDelegate.h
//  HelloIPad
//
//  Created by user on 11.01.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HelloIPadViewController;

@interface HelloIPadAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    HelloIPadViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet HelloIPadViewController *viewController;

@end

