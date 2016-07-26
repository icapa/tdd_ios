//
//  Broker.m
//  MyWallet
//
//  Created by Iván Cayón Palacio on 21/7/16.
//  Copyright © 2016 KeepCoding. All rights reserved.
//

#import "Broker.h"
#import "Money.h"

@interface Broker()
@property (nonatomic,strong) NSMutableSet *currencies;
@end

@implementation Broker

-(id) init{
    if (self = [super init]){
        _rates = [@{}mutableCopy];
        _currencies = [[NSMutableSet alloc] init];
    }
    return self;
}

-(id<Money>) reduce:(id<Money>) money
       toCurrency:(NSString *)currency{
    //double dispatcb
    return [money reduceToCurrency:currency
                        withBroker:self];

    
}

-(void) addRate: (NSInteger) rate fromCurrency:(NSString *)fromCurrency
     toCurrency:(NSString *)toCurrency{
    [self.rates setObject:@(rate)
                   forKey:[self keyForCurrency:fromCurrency toCurrency:toCurrency]];
    
    NSNumber *invRate= @(1.0/rate);
    
    [self.rates setObject:invRate
                   forKey:[self keyForCurrency:toCurrency toCurrency:fromCurrency]];
    
    // Meto en el Set cada vez que hay uno nuevo
    [self.currencies addObject:fromCurrency];
    [self.currencies addObject:toCurrency];
}

-(NSInteger) currenciesCount{
    return self.currencies.count;
}



#pragma mark - utils

-(NSString *)keyForCurrency:(NSString * )fromCurrency toCurrency:(NSString *) toCurrency{
    return [NSString stringWithFormat:@"%@-%@",fromCurrency,toCurrency];
}

#pragma mark - Rates
-(void) parseJSONRates:(NSData *) json{
    NSError *err = nil;
    id obj = [NSJSONSerialization JSONObjectWithData:json
                                             options:NSJSONReadingMutableContainers
                                               error:&err];
    if (obj != nil){
        // Pillamos los ratos y los vamos añadiendo al broker
    }
    else{
        // No hemos recibido nada
        [NSException raise:@"NoRatesJSONException"
                    format:@"JSON must carry son data"];
        
    }
}


@end
