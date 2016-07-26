//
//  TableViewTests.m
//  MyWallet
//
//  Created by Iván Cayón Palacio on 26/7/16.
//  Copyright © 2016 KeepCoding. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "WalletTableViewController.h"
#import "Wallet.h"
#import "Money.h"
#import "Broker.h"

@interface TableViewTests : XCTestCase
@property (nonatomic,strong) WalletTableViewController *tableVC;
@property (nonatomic,strong) Wallet *wallet;
@property (nonatomic,strong) Broker *broker;
@end

@implementation TableViewTests

- (void)setUp {
    [super setUp];
    
    // Creo un wallet con dos divisas distintas
    self.wallet = [[Wallet alloc]initWithAmount:1 currency:@"EUR"];
    [self.wallet plus:[Money euroWithAmount:2]];
    
    [self.wallet plus:[Money dollarWithAmount:1]];
    
    // Creo el broker
    self.broker = [Broker new];
    [self.broker addRate:2 fromCurrency:@"EUR" toCurrency:@"USD"];
                   
    
    // Creo la tabla que quiero probar
    self.tableVC = [[WalletTableViewController alloc]
                    initWithModel:self.wallet
                    broker:self.broker];
    
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void) testThatSectionIsCurrencyPlusOne{
    NSInteger sectionNumber = [self.tableVC numberOfSectionsInTableView:self.tableVC.tableView];
    XCTAssertEqual(sectionNumber, 3,@"Section number should be currencies plus one, 3");
    
}
-(void) testThatEuroCellNumberIsCurrencyMoneyNumberPlusOne{
    NSInteger moneyNumber = [self.tableVC tableView:self.tableVC.tableView numberOfRowsInSection:0];
    XCTAssertEqual(moneyNumber, 3,@"Row euro number should be money rows plus one");
    
}
-(void) testThatDollarCellNumberIsCurrencyMoneyNumberPlusOne{
    NSInteger moneyNumber = [self.tableVC tableView:self.tableVC.tableView numberOfRowsInSection:1];
    XCTAssertEqual(moneyNumber, 2,@"Row dollar number should be money rows plus one");
}

@end
