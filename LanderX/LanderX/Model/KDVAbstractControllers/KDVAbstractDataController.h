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

I have started the tests and as part of the simplification of this code I _realized_ that while I din't really like _moc/moc, I positively _don't need_ _MOC/MOC. Not the end of the world but at some point this class will become little more than Macros, and _obviously protocols_
[Damn SideNotes: It is not actually something that strictly needs to go away - - But MOC (which really reads much better than NSManagedObjectContext/managedObjectContext or moc, lowercase. AAMOF before container it was pretty nifty, which is why it shows up in so many files Getting rid of it is easy _But_ it reminds me of when it was hard ]
There of course, is the possibility that it can be used in a subclass, or in an Obj that uses one of this controllers subclasses, but for now MOC is ded, lawng live MOC
Next of Course is the *MOM, but that is still useful - no it isn't. It is all about the PSK and the entityName. MOM is just the complete version of dbName
*/

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface KDVAbstractDataController : NSObject <NSFetchedResultsControllerDelegate>
//first some basic ivars

@property (readonly, strong, nonatomic) NSManagedObjectModel *MOM;

@property (readonly, strong, nonatomic)NSPersistentContainer *PSK;

@property (strong, nonatomic) NSFetchedResultsController *fetchCon;
@property (nonatomic, copy) NSString* dbName;
@property (nonatomic, copy) NSString* entityClassName;
@property (nonatomic, assign) BOOL copyDatabaseIfNotPresent;

@property (strong, nonatomic) NSArray *miObjects; //(NSMutableArray *)getAllEntities;

@end
