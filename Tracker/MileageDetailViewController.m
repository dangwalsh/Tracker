//
//  MileageDetailViewController.m
//  MileageTracker
//
//  Created by Daniel Walsh on 10/30/12.
//  Copyright (c) 2012 Daniel Walsh. All rights reserved.
//

#import "MileageDetailViewController.h"

@interface MileageDetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;

@end

@implementation MileageDetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

- (void)configureView
{
    // Update the user interface for the detail item.
    if (self.detailItem) {
        
        total = [self.detailItem.totalMileage doubleValue];
        current = 0.0;
        
        self.numberLabel.text = self.detailItem.number;
        self.currentLabel.text = [NSString stringWithFormat:@"Last: %3@", [formatter stringFromNumber:self.detailItem.currentMileage]];
        self.totalLabel.text = [NSString stringWithFormat:@"Total: %3@", [formatter stringFromNumber:self.detailItem.totalMileage]];

        self.numberLabel.hidden = NO;
        self.segmentButton.hidden = NO;
        self.currentLabel.hidden = NO;
        self.totalLabel.hidden = NO;
        self.locationLabel.hidden = NO;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    formatter = [[NSNumberFormatter alloc]init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [formatter setMaximumFractionDigits:2];

    locationController = [[MileageCLController alloc] init];
    locationController.delegate = self;
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillDisappear:(BOOL)animated
{
    [locationController.locationManager stopUpdatingLocation];
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Jobs", @"Jobs");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

- (void)distanceUpdate:(CLLocationDegrees)distance
{
    current += distance;
    total += distance;
    
    self.currentLabel.text = [NSString stringWithFormat:@"Trip: %3.2f",current];
    self.detailItem.currentMileage = [NSNumber numberWithDouble:current];
    self.totalLabel.text = [NSString stringWithFormat:@"Total: %3.2f", total];
    self.detailItem.totalMileage = [NSNumber numberWithDouble:total];
}

- (void)locationUpdate:(CLLocation *)location
{
    self.locationLabel.text = [location description];
}

- (void)locationError:(NSError *)error
{
    self.locationLabel.text = [error description];
}

- (IBAction)valueChanged:(id)sender
{
    UISegmentedControl *control = sender;
    
    switch (control.selectedSegmentIndex) {
        case 0:
            [locationController.locationManager startUpdatingLocation];
            break;
        case 1:
            [locationController.locationManager stopUpdatingLocation];
            break;
        case 2:
            current = 0.0;
            self.detailItem.currentMileage = [NSNumber numberWithDouble:0.0];
            self.currentLabel.text = [NSString stringWithFormat:@"Trip: %3.2f",0.0];
            locationController.isNew = NO;
            break;
        default:
            break;
    }
}

@end
