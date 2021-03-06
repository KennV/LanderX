/**
  KDVAbstractDataController.m
  LanderX

  Created by Kenn Villegas on 12/12/17.
  Copyright © 2017 dubian. All rights reserved.

*/

#import "KDVAbstractDataController.h"

@implementation KDVAbstractDataController

@synthesize MOC = _MOC;
@synthesize MOM = _MOM;
@synthesize PSK = _PSK;

#pragma mark - Fetched results controller

- (NSFetchedResultsController *)fetchCon {
    // This is old code, and I use it on a table but I am not sure it goes here. But it can be cleaner
    // [self entityClassName]
    
    if (_fetchCon != nil) {
        return _fetchCon;
    }
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    // Edit the entity name as appropriate. (Event, RootEntity, ABSTRACT_OBJ)
    NSEntityDescription *entity = [NSEntityDescription entityForName:[self entityClassName] inManagedObjectContext:[self MOC]];
    
    [fetchRequest setEntity:entity];
    // Set the batch size to a suitable number.
    [fetchRequest setFetchBatchSize:20];
    // Edit the sort key as appropriate.
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"hexID" ascending:NO];
    NSArray *sortDescriptors = @[sortDescriptor];
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    // Edit the section name key path and cache name if appropriate.
    // nil for section name key path means "no sections".
    NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:[self MOC] sectionNameKeyPath:nil cacheName:@"Master"];
    aFetchedResultsController.delegate = self;
    self.fetchCon = aFetchedResultsController;
    
    NSError *error = nil;
    
    if (![[self fetchCon] performFetch:&error]) {
        NSLog(@"It is Fun \nAND Insightful to Know when and Why this happened");
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    return _fetchCon;
}

#pragma mark - Core Data stack
- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "edu._Company._Application" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)MOM {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_MOM != nil) {
        return _MOM;
    }
    // LANDER
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"LanderX" withExtension:@"MOMd"];
    _MOM = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _MOM;
}
- (NSPersistentStoreCoordinator *)PSK {
    // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it.
    if (_PSK != nil) {
        return _PSK;
    }
    
    // Create the coordinator and store
    
    _PSK = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self MOM]];
    // LANDER
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"LanderX"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_PSK addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _PSK;
}

- (NSManagedObjectContext *)MOC {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_MOC != nil) {
        return _MOC;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self PSK];
    if (!coordinator) {
        return nil;
    }
    _MOC = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_MOC setPersistentStoreCoordinator:coordinator];
    return _MOC;
}

#pragma mark - Core Data Saving support
- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = [self MOC];
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

#pragma mark -

- (void)performAutomaticLightweightMigration {
    
    NSError *error;
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:[NSString stringWithFormat:@"%@%@", [self dbName], @".sqlite"]];
    
    NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:
                             [NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption,
                             [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil];
    
    if (![_PSK addPersistentStoreWithType:NSSQLiteStoreType
                            configuration:nil
                                      URL:storeURL
                                  options:options
                                    error:&error]){
        // Handle the error.
    }
}

- (NSArray *)miObjects {
    if (!_miObjects) {
        _miObjects = [[NSMutableArray alloc]init];
    }
    NSEntityDescription *enitiyOne = [[[self fetchCon] fetchRequest] entity]; //Hmm??
    NSFetchRequest *request = [[NSFetchRequest alloc]initWithEntityName:[enitiyOne name]];
    NSError *error = nil;
    
    _miObjects = [[[self fetchCon]managedObjectContext] executeFetchRequest:request error:&error];
    if (_miObjects.count == 0 ) {
        NSLog(@"stack = %lu Should I Make an Object?",(unsigned long)[_miObjects count]);
        NSLog(@"or should the tvController do it?");
    }
    //    NSLog(@"stack = %lu",(unsigned long)[_miObjects count]); only log this once
    return _miObjects;
}


@end
