//
//  MoneyTest.m
//  MyWallet
//
//  Created by Iván Cayón Palacio on 20/7/16.
//  Copyright © 2016 KeepCoding. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Money.h"

@interface MoneyTest : XCTestCase

@end

@implementation MoneyTest

-(void) testCurrencies{
    XCTAssertEqualObjects(@"EUR", [[Money euroWithAmount:1] currency],@"The currency of euros should be EUR");
    XCTAssertEqualObjects(@"USD", [[Money dollarWithAmount:1] currency],@"The currency of dollars should be USD");
}

- (void) testMultiplication{
    Money *euro = [Money euroWithAmount: 5];
    Money *ten = [Money euroWithAmount:10];
    Money *total = [euro times:2];
    
    XCTAssertEqualObjects(total, ten, @"€5 *2 should be €10");
}

-(void) testEquality{
    Money *five = [Money  euroWithAmount:5];
    Money *ten = [Money  euroWithAmount:10];
    Money *total = [five times:2];
    XCTAssertEqualObjects(ten, total,@"Equivalent objects shoud be equal");
    XCTAssertEqualObjects([Money dollarWithAmount:4], [[Money dollarWithAmount:2] times:2],@"Equivalent objects shoud be equal");
    
    
}

-(void) testDifferentCurrencies{
    Money *euro = [Money euroWithAmount:1];
    Money *dollar = [Money dollarWithAmount:1];
    
    XCTAssertNotEqualObjects(euro, dollar,@"Different currencies should not be equal");
    
}



-(void) testHash{
    Money *a = [Money  euroWithAmount:2];
    Money *b = [Money  euroWithAmount:2];
    
    XCTAssertEqual([a hash], [b hash], @"Equal objects must have the same hash");
    XCTAssertEqual([[Money dollarWithAmount:1] hash], [[Money dollarWithAmount:1] hash],@"Equal objects must have the same hash");
    
}

-(void) testAmountStorage{
    Money *euro = [Money  euroWithAmount:2];
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    XCTAssertEqual(2,[[euro performSelector:@selector(amount)]integerValue],@"The values retreived should be the same as stored");
    XCTAssertEqual(2,[[[Money dollarWithAmount:2]performSelector:@selector(amount)]integerValue],@"The values retreived should be the same as stored");
#pragma clang diagnostic pop
    
}

-(void) testSimpleAddition{
    XCTAssertEqualObjects([[Money dollarWithAmount:5] plus:
                              [Money dollarWithAmount:5]],
                              [Money dollarWithAmount:10],
                              @"$5+$5 = $10");
                              
}

@end
