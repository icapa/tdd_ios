//
//  NetworkTests.m
//  MyWallet
//
//  Created by Iván Cayón Palacio on 26/7/16.
//  Copyright © 2016 KeepCoding. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Broker.h"

@interface NetworkTests : XCTestCase

@end

@implementation NetworkTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void) testThatEmptyRatesDefaultsToOneToOne{
    

}

-(void) testThatEmptyRatesRaisesException{
    Broker *broker = [Broker new];
    NSData *jsonData = nil;
    
    XCTAssertThrows([broker parseJSONRates: jsonData],@"An empty json should raise exception");
    
    
}


@end
