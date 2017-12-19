/**
  KDVApplicationDataControllerTests.m
  LanderXTests

  Created by Kenn Villegas on 12/19/17.
  Copyright © 2017 dubian. All rights reserved.

*/

#import <XCTest/XCTest.h>

#import <CoreData/CoreData.h>
#import "KDVApplicationDataController.h"

/**
Ok here are some proposed tests
- a different PSK as a _lazy init
- a thorough breakdown of the init-chain
- Object-Class
 - object sub-entities
 - KDVApplicationDataController
 - setting the subEntity from here?
 - testing all values in the SubEntities
- Possibly Controller Protocol?
 - might not be needed in this class but used in
 - SomeVueController <ApplicationDataProtocol>
- Load / Save / Delete
- currentEntity()
*/

@interface KDVApplicationDataControllerTests : XCTestCase

@end

@implementation KDVApplicationDataControllerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
