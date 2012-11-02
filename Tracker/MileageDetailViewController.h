//
//  MileageDetailViewController.h
//  MileageTracker
//
//  Created by Daniel Walsh on 10/30/12.
//  Copyright (c) 2012 Daniel Walsh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MileageCLController.h"
#import "Job.h"

@interface MileageDetailViewController : UIViewController <UISplitViewControllerDelegate, NSFetchedResultsControllerDelegate, MileageCLControllerDelegate> {
    MileageCLController *locationController;
    double total;
    double current;
    NSNumberFormatter *formatter;
}

@property (strong, nonatomic) Job *detailItem;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UILabel *currentLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentButton;

- (void)locationUpdate:(CLLocation *)location;
- (void)locationError:(NSError *)error;
- (void)distanceUpdate:(CLLocationDegrees)distance;
- (IBAction)valueChanged:(id)sender;

@end
