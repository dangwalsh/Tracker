//
//  MileageCLController.h
//  MileageTracker
//
//  Created by Daniel Walsh on 10/30/12.
//  Copyright (c) 2012 Daniel Walsh. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MileageCLControllerDelegate

@required
- (void)locationUpdate:(CLLocation *)location;
- (void)locationError:(NSError *)error;
- (void)distanceUpdate:(CLLocationDegrees)distance;

@end

@interface MileageCLController : NSObject<CLLocationManagerDelegate> {
    CLLocation *currentLocation;
}

@property (nonatomic, retain) CLLocationManager *locationManager;
@property (nonatomic, assign) id delegate;
@property (nonatomic, assign) CLLocation *resetLocation;
@property (nonatomic, assign) BOOL isNew;
@property (nonatomic, assign) BOOL isReset;

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation;

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error;

@end
