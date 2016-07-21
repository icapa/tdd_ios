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
@property (nonatomic,strong) NSMutableDictionary *rates;
@end

@implementation Broker

-(id) init{
    if (self = [super init]){
        _rates = [@{}mutableCopy];
    }
    return self;
}

-(id<Money>) reduce:(Money *) money
       toCurrency:(NSString *)currency{
    
    Money *result;
    // Comprobamos que divisa de origen y destino son las mismas
    double rate = [[self.rates
                       objectForKey:[self keyForCurrency:money.currency
                                              toCurrency:currency]] doubleValue];
    
    if ([money.currency isEqualToString:currency]){
        result = money;
    }
    else if(rate == 0){
        // No hay tasa de conversión, excepción
        [NSException raise:@"NoConversionRateException"
                    format:@"Must have a conversion from %@ to %@",money.currency,currency];
    }
    else{
    
        double newAmount = [money.amount doubleValue] * rate;
        
        result = [[Money alloc] initWithAmount:newAmount
                                               currency:currency];
    
    }
    return result;
}

-(void) addRate: (NSInteger) rate fromCurrency:(NSString *)fromCurrency
     toCurrency:(NSString *)toCurrency{
    [self.rates setObject:@(rate)
                   forKey:[self keyForCurrency:fromCurrency toCurrency:toCurrency]];
    
    NSNumber *invRate= @(1.0/rate);
    
    [self.rates setObject:invRate
                   forKey:[self keyForCurrency:toCurrency toCurrency:fromCurrency]];
    
}
    
#pragma mark - utils

-(NSString *)keyForCurrency:(NSString * )fromCurrency toCurrency:(NSString *) toCurrency{
    return [NSString stringWithFormat:@"%@-%@",fromCurrency,toCurrency];
}


@end
