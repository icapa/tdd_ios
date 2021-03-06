//
//  BrokerTest.m
//  MyWallet
//
//  Created by Iván Cayón Palacio on 21/7/16.
//  Copyright © 2016 KeepCoding. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Money.h"
#import "Broker.h"

@interface BrokerTest : XCTestCase

@property (nonatomic,strong) Broker *emptyBroker;
@property (nonatomic,strong) Money *oneDollar;

@end

@implementation BrokerTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    self.emptyBroker = [Broker new];
    self.oneDollar = [Money dollarWithAmount:[NSNumber numberWithDouble:1]];
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    self.emptyBroker = nil;
    self.oneDollar = nil;
}

-(void) testSimpleReduction{
    
    Money *sum = [[Money dollarWithAmount:[NSNumber numberWithDouble:5]] plus: [Money dollarWithAmount:[NSNumber numberWithDouble:5]]];
    Money *reduced = [self.emptyBroker reduce: sum toCurrency: @"USD"];
    
    XCTAssertEqualObjects(sum,reduced,@"Conversion to same currency should be a NOP");
    
}

//10$ == €5 2:1

-(void) testReduction{
    
    [self.emptyBroker addRate: [NSNumber numberWithDouble:2] fromCurrency:@"EUR" toCurrency:@"USD"];
    
    Money *dollars = [Money dollarWithAmount:[NSNumber numberWithDouble:10]];
    Money *euros = [Money euroWithAmount:[NSNumber numberWithDouble:5]];
    
    Money *converted = [self.emptyBroker reduce:dollars
                           toCurrency:@"EUR"];
    
    XCTAssertEqualObjects(converted, euros ,@"10$ == 5€ 2:1");
    
}

-(void) testThatNoRateRaisesException{
    XCTAssertThrows([self.emptyBroker reduce:self.oneDollar toCurrency:@"EUR"],@"No dates should cause exception");
    
}

-(void) testThatNilConversionDoesNotChangeMoney{
    XCTAssertEqualObjects(self.oneDollar, [self.emptyBroker reduce:self.oneDollar toCurrency:@"USD"],@"A nil conversion should not have effect");
    
}




@end
