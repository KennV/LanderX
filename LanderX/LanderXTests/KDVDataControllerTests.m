/**

  KDVDataControllerTests.m
  LanderXTests

  Created by Kenn Villegas on 12/14/17.
  Copyright © 2017 dubian. All rights reserved.

*/

/**

 Okay, these; the first set of tests should only determine if the Data {MOC, MOM, and PSK } are healthy
 _Alternately_ I can also write failing tests and see what the causes and features of these failures are
 Regardless I need to set up an in memory MOC which is actually just longhand for PSK.viewContext
 
 # MEMORY MANAGEMENT #
 If the *new !== old
 retain the new
 release the old
 return the new
 -elseIf return old
 */

/**
 # although it might seem excessive #
 I have pulled this apps data into a test. I am not 100% sure, but I think it might make sense to test the AppDeli in that test and test the controller here
 */

#import <XCTest/XCTest.h>
/* Note: To test CD You Must include the model in the compiler for this test target */
#import <CoreData/CoreData.h>
#import "KDVAbstractDataController.h"


@interface KDVDataControllerTests : XCTestCase
@property (strong, nonatomic)KDVAbstractDataController *SUT;
@property (strong, nonatomic)NSPersistentContainer *PSK;
@end

@implementation KDVDataControllerTests

@synthesize SUT = _SUT;
@synthesize PSK = _PSK;


- (NSPersistentContainer *)PSK {
  // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
  @synchronized (self) {
//    NSError *error = nil;
    if (_PSK == nil) {
      // _THIS IS THE ONLY REAL DIFFERENCE BEWEEN PRODUCTION() AND TEST()
      NSPersistentStoreDescription *dsc = [[NSPersistentStoreDescription alloc]init];
      [dsc setType:(@"NSInMemoryStoreType")]; //dsc.type = (NSInMemoryStoreType);
      
      _PSK = [[NSPersistentContainer alloc] initWithName:@"LanderX"];
      [_PSK loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *dsc, NSError *error)

       {
        if (error != nil) {
          
          NSLog(@"Unresolved error %@, %@", error, error.userInfo);
          abort();
        }
      }];
    }
  }
  
  return _PSK;
}

- (void)setUp {
  [super setUp];
  // Put setup code here. This method is called before the invocation of each test method in the class.
  [self setSUT:[[KDVAbstractDataController alloc]initAllDefaults]];
}

- (void)tearDown {
  // Put teardown code here. This method is called after the invocation of each test method in the class.
  [super tearDown];
  [self setSUT:nil];
  [self setPSK:(nil)];
}

- (void)testSUTExists {
  XCTAssertNotNil([self SUT]);
  
  XCTAssertNotNil([[[self SUT]PSK]viewContext]);
  //    XCTAssertNotNil([[[self SUT]MOM]description]);
}

- (void)testSUTMOM {
//  XCTAssertNotNil([[self SUT]MOM].description);
}

- (void)testPSKExists {
  XCTAssertNotNil([self PSK ]);
  XCTAssertNotNil([[self PSK]viewContext]);
//  XCTAssert(self.PSK.persistentStoreDescriptions.description
}

- (void)testSUTInitsAllWithDefaults {
  [self setSUT:nil];
  XCTAssertNotNil([[KDVAbstractDataController alloc]initAllDefaults]);
}

- (void)testSUTInitsAllUp {
  [self setSUT:nil];
  //  [self setSUT:nil];
  XCTAssertNil(_SUT);
  XCTAssertNil([self SUT]);
  XCTAssertNil([[[self SUT]PSK]viewContext]);
  XCTAssertNotNil([[KDVAbstractDataController alloc]initAllUp]);
    KDVAbstractDataController *tstUnit = [[KDVAbstractDataController alloc]initAllUp];
  //Which is an error so I must fix that
  XCTAssertNotNil(tstUnit);
  XCTAssertNotNil([[tstUnit PSK]viewContext]);
//  XCTAssertNotNil([tstUnit MOM]);

  //when i test the fetchcon it is both false and true
#pragma mark - fixme: Test the fetchController
}
//
- (void)testJive {
  XCTAssertNotNil([self SUT]);
  XCTAssertNotNil([[self SUT]entityClassName]);
//  XCTAssertNotNil([self SUT]
  XCTAssertNotNil([[self SUT]PSK]);
  XCTAssertNotNil([[[self SUT]PSK]managedObjectModel]);
  XCTAssertNotNil([[[self SUT]PSK]viewContext]);

  XCTAssertNotNil([[self SUT]entityClassName]);
  XCTAssert([[[self SUT]entityClassName] isEqual:(@"NSManagedObject")]);
  XCTAssertNotNil([[self SUT]appDatabaseName]);
  XCTAssert([[[self SUT]appDatabaseName] isEqual:(@"LanderX")]);
  
//  XCTAssertNotNil([[self SUT]MOM]);
}

- (void)test2Jive {
  XCTAssertNotNil([self PSK]);
  XCTAssertNotNil([[self PSK]managedObjectModel]);
  XCTAssertNotNil([[self PSK]viewContext]);
}

- (void)testBigInit {
  XCTAssertNotNil(@1);
}

- (void)testFailingNameInit {
  XCTAssertNotNil(@1);
}

- (void)testFailingAppENVInit {
  XCTAssertNotNil(@1);
}
@end

