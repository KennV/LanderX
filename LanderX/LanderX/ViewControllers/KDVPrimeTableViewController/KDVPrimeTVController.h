/**
  MasterViewController.h
  LanderX

  Created by Kenn Villegas on 12/12/17.
  Copyright © 2017 dubian. All rights reserved.

*/

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "LanderX+CoreDataModel.h"

@class KDVMapDetailViewController;

@interface KDVPrimeTVController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) KDVMapDetailViewController *mapViewController;
/**
While I am in this Commit
observer this fetchectd condtroller by default set to <T*> as event when it should really be
 NSFetchedResultsController<KDVRootEntity>
So I made one with an incepDate and this test is currently under test.
 */
@property (strong, nonatomic) NSFetchedResultsController<Event *> *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;


@end

