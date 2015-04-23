//
//  Home_Assignment_3Tests.m
//  Home-Assignment-3Tests
//
//  Created by Desislava Stoyanova on 4/23/15.
//  Copyright (c) 2015 Desislava Stoyanova. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

@interface Home_Assignment_3Tests : XCTestCase

@end

@implementation Home_Assignment_3Tests

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
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
