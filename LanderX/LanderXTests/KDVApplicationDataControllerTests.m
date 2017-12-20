/**
  KDVApplicationDataControllerTests.m
  LanderXTests

  Created by Kenn Villegas on 12/19/17.
  Copyright © 2017 dubian. All rights reserved.

*/

/**
Ok here are some proposed tests
- a thorough breakdown of the init-chain {high}
 - do I init well
 - does my Object-Class init well
- Object-Class {high}
 - object sub-entities
 - KDVApplicationDataController
 - setting the subEntity from here?
 - testing all values in the SubEntities
- a different PSK as a _lazy init {medium}
- Load / Save / Delete {defer}
- currentEntity() {optional}
- Possibly Controller Protocol?
 - might not be needed in this class but used in
 - SomeVueController <ApplicationDataProtocol>
- Load / Save / Delete
- currentEntity()
*/

#import <XCTest/XCTest.h>

#import <CoreData/CoreData.h>
#import "KDVApplicationDataController.h"


@interface KDVApplicationDataControllerTests : XCTestCase

@property (strong, nonatomic)KDVApplicationDataController *SUT;
@property (strong, nonatomic)NSPersistentContainer *PSK;

@end

@implementation KDVApplicationDataControllerTests

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
  [self setSUT:[[KDVApplicationDataController alloc]initAllDefaults]];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testOne {
  XCTAssertNotNil([self SUT]);
  XCTAssert([[self SUT]isMemberOfClass:[KDVApplicationDataController class]]);
  XCTAssert([[self SUT]isKindOfClass:[KDVAbstractDataController class]]);
}
- (void)testTwo {
  XCTAssertNotNil([self PSK]);
}
@end
