//
//  Job.h
//  Tracker
//
//  Created by Daniel Walsh on 11/2/12.
//  Copyright (c) 2012 Daniel Walsh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Job : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * number;
@property (nonatomic, retain) NSNumber * totalMileage;
@property (nonatomic, retain) NSNumber * currentMileage;
@property (nonatomic, retain) NSDate * dateCreated;

@end
