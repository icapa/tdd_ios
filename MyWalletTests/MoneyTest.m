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
    XCTAssertEqualObjects(@"EUR", [[Money euroWithAmount:[NSNumber numberWithDouble:1]] currency],@"The currency of euros should be EUR");
    XCTAssertEqualObjects(@"USD", [[Money dollarWithAmount:[NSNumber numberWithDouble:1]] currency],@"The currency of dollars should be USD");
}

- (void) testMultiplication{
    Money *euro = [Money euroWithAmount: [NSNumber numberWithDouble:5]];
    Money *ten = [Money euroWithAmount:[NSNumber numberWithDouble:10]];
    Money *total = [euro times:2];
    
    XCTAssertEqualObjects(total, ten, @"€5 *2 should be €10");
}

-(void) testEquality{
    Money *five = [Money  euroWithAmount:[NSNumber numberWithDouble:5]];
    Money *ten = [Money  euroWithAmount:[NSNumber numberWithDouble:10]];
    Money *total = [five times:2];
    XCTAssertEqualObjects(ten, total,@"Equivalent objects shoud be equal");
    XCTAssertEqualObjects([Money dollarWithAmount:[NSNumber numberWithDouble:4]],
                          [[Money dollarWithAmount:[NSNumber numberWithDouble:2]] times:2],@"Equivalent objects shoud be equal");
    
    
}

-(void) testDifferentCurrencies{
    Money *euro =   [Money euroWithAmount:[NSNumber numberWithDouble:1]];
    Money *dollar = [Money dollarWithAmount:[NSNumber numberWithDouble:1]];
    
    XCTAssertNotEqualObjects(euro, dollar,@"Different currencies should not be equal");
    
}



-(void) testHash{
    Money *a = [Money  euroWithAmount:[NSNumber numberWithDouble:2]];
    Money *b = [Money  euroWithAmount:[NSNumber numberWithDouble:2]];
    
    XCTAssertEqual([a hash], [b hash], @"Equal objects must have the same hash");
    XCTAssertEqual([[Money dollarWithAmount:[NSNumber numberWithDouble:1]] hash],
                   [[Money dollarWithAmount:[NSNumber numberWithDouble:1]] hash],
                   @"Equal objects must have the same hash");
    
}


-(void) testAmountStorage{
    Money *euro = [Money  euroWithAmount:[NSNumber numberWithDouble:2]];
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    XCTAssertEqual(2,[[euro performSelector:@selector(amount)]integerValue],@"The values retreived should be the same as stored");
    XCTAssertEqual(2,[[[Money dollarWithAmount:[NSNumber numberWithDouble:2]]performSelector:@selector(amount)]integerValue],@"The values retreived should be the same as stored");
#pragma clang diagnostic pop
    
}

-(void) testSimpleAddition{
    XCTAssertEqualObjects([[Money dollarWithAmount:[NSNumber numberWithDouble:5]] plus:
                              [Money dollarWithAmount:[NSNumber numberWithDouble:5]]],
                              [Money dollarWithAmount:[NSNumber numberWithDouble:10]],
                              @"$5+$5 = $10");
                              
}

-(void) testThatHashIsAmount{
    Money *one = [Money dollarWithAmount:[NSNumber numberWithDouble:1]];
    XCTAssertEqual([one hash],1,@"The hash must be the same as the amount");
}

-(void) testDescription{
    Money *one = [Money dollarWithAmount:[NSNumber numberWithDouble:1]];
    NSString *desc = @"<Money: USD 1>";
    XCTAssertEqualObjects(desc, [one description],@"Description must match the template");
    
}

@end
