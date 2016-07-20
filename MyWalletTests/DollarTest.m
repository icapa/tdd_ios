//
//  DollarTest.m
//  MyWallet
//
//  Created by Iván Cayón Palacio on 19/7/16.
//  Copyright © 2016 KeepCoding. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Dollar.h"
#import "Money.h"

@interface DollarTest : XCTestCase

@end

@implementation DollarTest

-(void) testMultiplication {
    Dollar *five = [Money dollarWithAmount:5];
    Dollar *total = [five times:2];
    Dollar *ten =[Money dollarWithAmount:10];
    
    XCTAssertEqualObjects(ten,total,@"$5 * 2 = $10");
    
}

-(void) testEquality{
    Dollar *five = [Money dollarWithAmount:5];
    Dollar *total = [five times:2];
    Dollar *ten = [Money dollarWithAmount:10];
    
    XCTAssertEqualObjects(ten, total, @"Equivalent objects should be equual");
    
    XCTAssertFalse([total isEqual:five],@"Non equivalent objects");
    
}

-(void) testHash{
    Dollar *a =[Money dollarWithAmount:2];
    Dollar *b = [Money dollarWithAmount:2];
    
    XCTAssertEqual([a hash], [b hash], @"Equal objects must have the same hash");
}

-(void) testAmountStorage{
    Dollar *dollar = [Money dollarWithAmount:2];
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    XCTAssertEqual(2,[[dollar performSelector:@selector(amount)]integerValue],@"The values retreived should be the same as stored");
#pragma clang diagnostic pop
    
}


@end
