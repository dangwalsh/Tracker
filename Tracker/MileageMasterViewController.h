//
//  MileageMasterViewController.h
//  MileageTracker
//
//  Created by Daniel Walsh on 10/30/12.
//  Copyright (c) 2012 Daniel Walsh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MileageDetailViewController;

#import <CoreData/CoreData.h>

@interface MileageMasterViewController : UITableViewController <NSFetchedResultsControllerDelegate, UITextFieldDelegate> {
    UITableViewCell *selected;
    NSIndexPath *changing;
    NSNumberFormatter *formatter;
}

@property (strong, nonatomic) MileageDetailViewController *detailViewController;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
