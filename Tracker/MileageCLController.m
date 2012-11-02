//
//  MileageCLController.m
//  MileageTracker
//
//  Created by Daniel Walsh on 10/30/12.
//  Copyright (c) 2012 Daniel Walsh. All rights reserved.
//

#import "MileageCLController.h"

@implementation MileageCLController

- (id) init
{
    self = [super init];
    if (self != nil) {
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self; // send loc updates to myself
        self.isNew = NO;
        self.isReset = NO;
    }
    return self;
}

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    currentLocation = newLocation;
    
    if (!self.isNew) {
        oldLocation = currentLocation;
    }
    
    NSDate *eventDate = newLocation.timestamp;
    NSTimeInterval howRecent = [eventDate timeIntervalSinceNow];
    NSTimeInterval thresh = -.001;

    if (howRecent > thresh) {
        [self.delegate locationUpdate:newLocation];
        CLLocationDistance distance = [newLocation distanceFromLocation:oldLocation];
        [self.delegate distanceUpdate:distance];
        self.isNew = YES;
    }
    else {
        self.isNew = NO;
        //currentLocation = newLocation;
    }
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
	[self.delegate locationError:error];
}
@end
