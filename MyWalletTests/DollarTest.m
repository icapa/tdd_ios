//
//  DollarTest.m
//  MyWallet
//
//  Created by Iván Cayón Palacio on 19/7/16.
//  Copyright © 2016 KeepCoding. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Dollar.h"

@interface DollarTest : XCTestCase

@end

@implementation DollarTest

-(void) testMultiplication {
    Dollar *five = [[Dollar alloc] initWithAmount:5];
    Dollar *total = [five times:2];
    Dollar *ten =[[Dollar alloc] initWithAmount:10];
    
    XCTAssertEqualObjects(ten,total,@"$5 * 2 = $10");
    
}

-(void) testEquality{
    Dollar *five = [[Dollar alloc] initWithAmount:5];
    Dollar *total = [five times:2];
    Dollar *ten = [[Dollar alloc]initWithAmount:10];
    
    XCTAssertEqualObjects(ten, total, @"Equivalent objects should be equual");
    
    XCTAssertFalse([total isEqual:five],@"Non equivalent objects");
    
}

@end
