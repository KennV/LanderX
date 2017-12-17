/**
  KDVAbstractDataController.h
  LanderX

  Created by Kenn Villegas on 12/12/17.
  Copyright © 2017 dubian. All rights reserved.

*/

/**
 OKAY One of the first things to do is to effect the surgical seperation of the persistantStateContainer from the AppDeli; In many ways this is more important than the structure of the data that We will be modelling.
_moreover this is where test begins_
 
### Unfortunately I have done too much tonight to rely on favorable conditions ###

 therefore before I add tests cases to the state as it is *AND* also introduce new classes into the data model why don't I stop here and reflect on the architecture
And also do a git commit
*/

/**
### Section two, ###


*/

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface KDVAbstractDataController : NSObject <NSFetchedResultsControllerDelegate>
//first some basic ivars Utilities for the Class
@property (readonly, strong, nonatomic)NSPersistentContainer *PSK;

@property (readonly, strong, nonatomic) NSManagedObjectModel *MOM;

@property (readonly, strong)NSManagedObjectContext *MOC;

//@property (strong, nonatomic) NSFetchedResultsController *fetchCon;
// Also need some instance variables for custom objects
/**
The entity model for this controllers class/subclass
*/
@property (nonatomic, copy) NSString* entityClassName;
/**
The working name for this app's db
*/
@property (nonatomic, copy) NSString* appDatabaseName;

//@property (strong, nonatomic) NSArray *miObjects; //(NSMutableArray *)getAllEntities;

- (instancetype)initAllUp;
- (instancetype)initAllDefaults;
//- (instancetype)initWithModelClass:(NSString *)modelName dbName:(NSString *)dbName appName:(NSString *)appName;
@end
