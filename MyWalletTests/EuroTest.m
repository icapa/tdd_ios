//
//  EuroTest.m
//  MyWallet
//
//  Created by Iván Cayón Palacio on 18/7/16.
//  Copyright © 2016 KeepCoding. All rights reserved.
//
@import XCTest;

#import "Euro.h"

@interface EuroTest : XCTestCase

@end

@implementation EuroTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void) testMultiplication{
    Euro *euro = [[Euro alloc] initWithAmount: 5];
    Euro *ten = [[Euro alloc]initWithAmount:10];
    Euro *total = [euro times:2];
    
    XCTAssertEqualObjects(total, ten, @"€5 *2 should be €10");
}

-(void) testEquality{
    Euro *five = [[Euro alloc] initWithAmount:5];
    Euro *ten = [[Euro alloc] initWithAmount:10];
    Euro *total = [five times:2];
    XCTAssertEqualObjects(ten, total,@"Equivalent objects shoud be equal");
    
                 
}

@end
