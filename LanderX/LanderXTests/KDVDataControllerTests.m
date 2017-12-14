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
@property (strong, nonatomic)NSManagedObjectContext *SUT;
//@property (strong, nonatomic)KDVPrimeTVController *SUT;
@property (strong, nonatomic)NSPersistentStoreCoordinator *PSK;
@end

@implementation KDVDataControllerTests

@synthesize SUT = _SUT;
//@synthesize SUT = _SUT;
@synthesize PSK = _PSK;

#pragma mark - GET_URL For this

- (void)setupInMemoryPSK {
  //
  // NSManagedObjectModel *tMOM = [NSManagedObjectModel mergedModelFromBundles:[NSBundle main]];
  //  NSManagedObjectModel *tMOM = [NSManagedObjectModel mergedModelFromBundles:(NSBundle.mainBundle)];
  //  NSPersistentStoreCoordinator *tPOP = [[NSPersistentStoreCoordinator alloc]initWithManagedObjectModel:tMOM];
}

- (void)setUp {
  [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
//  [self setSUT:[[KDV]]
  //  [self setupInMemoryPSK];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  [super tearDown];
  [self setSUT:nil];
}

- (void)testSUTExists {
  /* Okay I can easily test that it exists, but what does it relly look like in runtime
   it is just a breakpoint away b\c I _feel_ I should be able to see the MOC (At least the current / demo PSK)
   */

  XCTAssertNotNil(_SUT);
  XCTAssertNotNil([self SUT]);
  // these two fail because it is only init'd up there the view
  // the data has not been loaded
  //  [[self SUT] viewDidLoad];
  //  XCTAssertNotNil([[self SUT]managedObjectContext]);
}

@end
