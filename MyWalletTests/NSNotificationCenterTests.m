//
//  NSNotificationCenterTests.m
//  MyWallet
//
//  Created by Iván Cayón Palacio on 25/7/16.
//  Copyright © 2016 KeepCoding. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSFakeNotificationCenter.h"
#import "Wallet.h"


@interface NSNotificationCenterTests : XCTestCase

@end

@implementation NSNotificationCenterTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


// Comprobar que un cierto objeto se ha dado de alta

-(void) testThatSubscribesToMemoryWarning{
    NSFakeNotificationCenter *fake = [NSFakeNotificationCenter new];
    
    Wallet *w = [Wallet new];
    
    [w subscribeToMemoryWarning: (NSNotificationCenter *)fake];
    
    NSDictionary *obs = [fake observers];
    id observer = [obs objectForKey:UIApplicationDidReceiveMemoryWarningNotification];
    XCTAssertEqualObjects(observer, w,@"Fat object must subscribe to UIApplicationDidReceiveMemoryWarningNotification");
    
    
}







@end
