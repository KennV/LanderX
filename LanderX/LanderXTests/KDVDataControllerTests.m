//
//  KDVDataControllerTests.m
//  LanderXTests
//
//  Created by Kenn Villegas on 12/14/17.
//  Copyright © 2017 dubian. All rights reserved.
//
/**
 
 OKay, these; the first set of tests should only determine if the Data {MOC, MOM, and PSK } are healthy
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
@property (strong, nonatomic)NSPersistentStoreCoordinator *PSK;
@end

@implementation KDVDataControllerTests

@synthesize SUT = _SUT;
@synthesize PSK = _PSK;

#pragma mark - GET_URL For this
// https://medium.com/flawless-app-stories/cracking-the-tests-for-core-data-15ef893a3fee
//

- (void)setupInMemoryPSK {
  //
  // NSManagedObjectModel *tMOM = [NSManagedObjectModel mergedModelFromBundles:[NSBundle main]];
  //  NSManagedObjectModel *tMOM = [NSManagedObjectModel mergedModelFromBundles:(NSBundle.mainBundle)];
  //  NSPersistentStoreCoordinator *tPOP = [[NSPersistentStoreCoordinator alloc]initWithManagedObjectModel:tMOM];
}

- (void)setUp {
  [super setUp];
  // Put setup code here. This method is called before the invocation of each test method in the class.
  [self setSUT:[[KDVAbstractDataController alloc]init]];
  }

- (void)tearDown {
  // Put teardown code here. This method is called after the invocation of each test method in the class.
  [super tearDown];
  [self setSUT:nil];
}

- (void)testSUTExists {
  /* Okay I can easily test that it exists, but what does it relly look like in runtime
   it is just a breakpoint away b\c I _feel_ I should be able to see the MOC (At least the current / demo PSK)
   Therefore since I am no longer testing the _MOC {see yesterday's jam} I will be testing the controller these two lines failed. b\c I have no init.
   Naturally I will make an initAllUp()/initAllDefaults this will make the next two tests fail
   */
  XCTAssertNotNil(_SUT);
  XCTAssertNotNil([self SUT]);
  // _Those next two tests_
  // Actually this passes, _however_ I might after these tests pass go back and set the all to _nil_ and test failThrough
  XCTAssertNotNil([[[self SUT]PSK]viewContext]);
  //    XCTAssertNotNil([[[self SUT]MOM]description]);
}

- (void)testPSKExists {
  [self setSUT:nil];
  id m = ([[KDVAbstractDataController alloc]initAllDefaults]);
  XCTAssertNotNil([m PSK]);
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
    id tstUnit = [[KDVAbstractDataController alloc]initAllUp];
  //Which is an error so I must fix that
  XCTAssertNotNil(tstUnit);
  XCTAssertNotNil([[tstUnit PSK]viewContext]);
  //when i test the fetchcon it is both false and true
#pragma mark - fixme: Test the fetchController
  

}
//



@end
