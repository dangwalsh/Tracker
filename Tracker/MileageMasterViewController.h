//
//  MileageMasterViewController.h
//  Tracker
//
//  Created by Daniel Walsh on 11/2/12.
//  Copyright (c) 2012 Daniel Walsh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MileageDetailViewController;

#import <CoreData/CoreData.h>

@interface MileageMasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) MileageDetailViewController *detailViewController;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
