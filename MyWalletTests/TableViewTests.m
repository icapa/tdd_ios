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
    self.wallet = [[Wallet alloc]initWithAmount:[NSNumber numberWithDouble:1] currency:@"EUR"];
    [self.wallet plus:[Money euroWithAmount:[NSNumber numberWithDouble:2]]];
    
    [self.wallet plus:[Money dollarWithAmount:[NSNumber numberWithDouble:1]]];
    
    // Creo el broker
    self.broker = [Broker new];
    [self.broker addRate:[NSNumber numberWithDouble:2] fromCurrency:@"EUR" toCurrency:@"USD"];
                   
    
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

// Este test debería ir en wallet pero aprovecho que tengo creado aqui todas las moneys
-(void) testExtractArrayForCurrency{
    Money *money1 = [self.wallet moneyFor:@"EUR" atIndex:0];
    XCTAssertEqual([[money1 amount] doubleValue], 1, @"Eur pos 0 should be 1");
    
    Money *money2 = [self.wallet moneyFor:@"EUR" atIndex:1];
    XCTAssertEqual([[money2 amount] doubleValue], 2, @"Eur pos 1 should be 1");
    
    Money *money3 = [self.wallet moneyFor:@"EUR" atIndex:2];
    XCTAssertEqual([[money3 amount] doubleValue], 3 ,@"Total Sum of € should be 3");
}

-(void) testTotalMoney{
    Money *total = [self.wallet totalMoneyWithBroker:self.broker];
    
    // Los euros son 1,2 ->     total 3
    // El dolar es 1 ->         total 1
    // Paso de EUR a USD 2, de USD a EUR es 0.5
    // Total deberian de ser 3.5€
    
    XCTAssertEqual([[total amount]doubleValue],3.5, @"3€ + 1$ = 3.5€");
    
}


-(void) testCurrencyAtIndex{
    NSString *eur = [self.tableVC currencyAtIndex:0];
    NSString *dollar = [self.tableVC currencyAtIndex:1];
    NSString *nothing = [self.tableVC currencyAtIndex:2];
    
    XCTAssertEqualObjects(eur, @"EUR",@"Index 0 should be EUR");
    XCTAssertEqualObjects(dollar,@"USD", @"Index 1 should be USD");
    XCTAssertEqualObjects(nothing, nil, @"Index 2 should return nil");
}


-(void) testTitleForHeaderInSection{
    NSString *eur=[self.tableVC tableView:self.tableVC.tableView titleForHeaderInSection:0];
    NSString *dollar=[self.tableVC tableView:self.tableVC.tableView titleForHeaderInSection:1];
    NSString *total=[self.tableVC tableView:self.tableVC.tableView titleForHeaderInSection:2];
    XCTAssertEqualObjects(eur, @"EUR",@"Index 0 should be EUR");
    XCTAssertEqualObjects(dollar,@"USD - (1 USD = 0.50 EUR)", @"Index 1 should be USD conversion");
    XCTAssertEqualObjects(total,@"Total €", @"Index 2 should return nil");

}


@end
