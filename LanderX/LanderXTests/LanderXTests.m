/**
  LanderXTests.m
  LanderXTests

  Created by Kenn Villegas on 12/12/17.
  Copyright © 2017 dubian. All rights reserved.

*/

#import <XCTest/XCTest.h>
/* Note: You Must include the model in the compiler's test target */
#import <CoreData/CoreData.h>
#import "KDVPrimeTVController.h"

@interface LanderXTests : XCTestCase

@property (strong, nonatomic)NSManagedObjectContext *testMOC;
@property (strong, nonatomic)KDVPrimeTVController *SUT;
@property (strong, nonatomic)NSPersistentStoreCoordinator *PSK;
@end

@implementation LanderXTests
@synthesize testMOC = _testMOC;
@synthesize SUT = _SUT;
@synthesize PSK = _PSK;

/**

OKay, these; the first set of tests should only determine if the Data {MOC, MOM, and PSK } are healthy
_Alternately_ I can also write failing tests and see what the causes and features of these failures are
Regardless I need to set up an in memory MOC which is actually just longhand for PSK.viewContext
 
If the *new !== old
retain the new
release the old
return the new
-elseIf return old
*/

- (void)setupInMemoryPSK {
  //
// NSManagedObjectModel *tMOM = [NSManagedObjectModel mergedModelFromBundles:[NSBundle main]];
//  NSManagedObjectModel *tMOM = [NSManagedObjectModel mergedModelFromBundles:(NSBundle.mainBundle)];
//  NSPersistentStoreCoordinator *tPOP = [[NSPersistentStoreCoordinator alloc]initWithManagedObjectModel:tMOM];
  
}

- (void)setUp {
  [super setUp];
  // Put setup code here. This method is called before the invocation of each test method in the class.
  [self setSUT:[[KDVPrimeTVController alloc]init]];
//  [self setupInMemoryPSK];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  [self setSUT:nil];
  [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}
/* Okay I can easily test that it exists, but what does it relly look like in runtime
it is just a breakpoint away b\c I _feel_ I should be able to see the MOC (At least the current / demo PSK)
*/
- (void)testSUTExists {
  XCTAssertNotNil(_SUT);
  XCTAssertNotNil([self SUT]);
  // these two fail because it is only init'd up there the view
  // the data has not been loaded
//  [[self SUT] viewDidLoad];
//  XCTAssertNotNil([[self SUT]managedObjectContext]);
  
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
