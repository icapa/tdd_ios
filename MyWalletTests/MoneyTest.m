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

-(void) testThatTimesRaisesException{
    Money *money = [[Money alloc]initWithAmount:1];
    XCTAssertThrows([money times:2],@"Should rise an exception");
    
}
@end
