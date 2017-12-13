/**
  LanderXTests.m
  LanderXTests

  Created by Kenn Villegas on 12/12/17.
  Copyright © 2017 dubian. All rights reserved.

*/

#import <XCTest/XCTest.h>
#import <CoreData/CoreData.h>
/*Note: You Must include the model in the test compile*/
#import "KDVPrimeTVController.h"


@interface LanderXTests : XCTestCase
@property (strong, nonatomic)NSManagedObjectContext *testMOC;
@property (strong, nonatomic)KDVPrimeTVController *SUT;

@end

@implementation LanderXTests
@synthesize testMOC = _testMOC;
@synthesize SUT = _SUT;
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

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
  [self setSUT:[[KDVPrimeTVController alloc]init]];
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

- (void)testSUTExists {
  XCTAssertNotNil(_SUT);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
