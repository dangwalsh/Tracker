//
//  MileageDetailViewController.h
//  Tracker
//
//  Created by Daniel Walsh on 11/2/12.
//  Copyright (c) 2012 Daniel Walsh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MileageDetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
