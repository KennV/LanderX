/**
  KDVAbstractDataController.m
  LanderX

  Created by Kenn Villegas on 12/12/17.
  Copyright © 2017 dubian. All rights reserved.

*/

#import "KDVAbstractDataController.h"

@implementation KDVAbstractDataController
// THESE REMAIN READONLY
@synthesize PSK = _PSK;
@synthesize MOM = _MOM;
@synthesize MOC = _MOC;

@synthesize entityClassName = _entityClassName;
@synthesize appDatabaseName = _appDatabaseName;


- (id)init
{
  self = [self initWithModelClass:(nil) dbName:(nil) appName:(nil)];
  return (self);
}

- (id)initAllUp
{
  self = [self initWithModelClass:(@"NSManagedObject") dbName:(@"LanderX") appName:(@"LanderX")];
  return (self);
}

- (id)initAllDefaults
{
  self = [self init];
  [self setEntityClassName:(@"NSManagedObject")];
  [self setAppDatabaseName:(@"LanderX")];
  return (self);
}

// Init should fallthrough to here and
// initAllValues… should be the default
// I can leave this as instancetype it is private or at least not in the public API
- (instancetype)initWithModelClass:(NSString *)modelName
                            dbName:(NSString *)dbName
                           appName:(NSString *)appName {
  self = [super init];
  [self setEntityClassName:modelName];
  [self setAppDatabaseName:dbName];
  return self;
}

#pragma mark - Fetched results controller

//-(NSFetchedResultsController *)_fetchCon {
//  return (nil);
//}

#pragma mark - Core Data stack
/**
- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "edu._Company._Application" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)MOM {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_MOM != nil) {
        return _MOM;
    }
    // LANDER @ LanderX.sqlite
//    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:[self appDatabaseName] withExtension:@"MOMd"];
      NSURL *modelURL = [[NSBundle mainBundle] URLForResource:[self appDatabaseName] withExtension:@"sqlite"];
    _MOM = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
  
    return _MOM;
}
*/
- (NSPersistentContainer *)PSK {
  // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
  @synchronized (self) {
    if (_PSK == nil) {
      _PSK = [[NSPersistentContainer alloc] initWithName:[self appDatabaseName]];
      [_PSK loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
        if (error != nil) {
          // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
          
          // Report any error we got.
          NSMutableDictionary *dict = [NSMutableDictionary dictionary];
          dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
//          dict[NSLocalizedFailureReasonErrorKey] = failureReason;
          dict[NSUnderlyingErrorKey] = error;
          error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
          // Replace this with code to handle the error appropriately.
          // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
          NSLog(@"Unresolved error %@, %@", error, error.userInfo);
          abort();
        }
      }];
    }
  }
  return _PSK;
}

#pragma mark - Core Data Saving support
/**
- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = [[self PSK]viewContext];
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
*/

#pragma mark -
/**
- (void)performAutomaticLightweightMigration {
  
  NSError *error;
  
  NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:[NSString stringWithFormat:@"%@%@", [self dbName], @".sqlite"]];
  
  NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:
                           [NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption,
                           [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil];
#pragma mark  TODO: Fix The [PSK addPersistentStore…,] call
//    if (![_PSK addPersistentStoreWithType:NSSQLiteStoreType
//                            configuration:nil
//                                      URL:storeURL
//                                  options:options
//                                    error:&error]){
//        // Handle the error.
//    }
}

*/

@end
