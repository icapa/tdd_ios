//
//  Broker.h
//  MyWallet
//
//  Created by Iván Cayón Palacio on 21/7/16.
//  Copyright © 2016 KeepCoding. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Money.h"

@interface Broker : NSObject

@property (nonatomic,readonly) NSMutableSet *currencies;
@property (nonatomic,strong) NSMutableDictionary *rates;


-(Money *) reduce:(id<Money>) money toCurrency:(NSString *)currency;

-(void) addRate: (NSInteger) rate fromCurrency:(NSString *)fromCurrency
     toCurrency:(NSString *)toCurrency;

-(NSString *)keyForCurrency:(NSString * )fromCurrency toCurrency:(NSString *) toCurrency;

-(void) parseJSONRates:(NSData *) json;

-(NSInteger) currenciesCount;


@end
