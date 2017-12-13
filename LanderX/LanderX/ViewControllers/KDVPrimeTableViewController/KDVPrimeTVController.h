//
//  MasterViewController.h
//  LanderX
//
//  Created by Kenn Villegas on 12/12/17.
//  Copyright © 2017 dubian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "LanderX+CoreDataModel.h"

@class KDVMapDetailViewController;

@interface KDVPrimeTVController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) KDVMapDetailViewController *detailViewController;

@property (strong, nonatomic) NSFetchedResultsController<Event *> *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;


@end

