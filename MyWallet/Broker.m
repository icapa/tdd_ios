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

@end

@implementation Broker

-(id) init{
    if (self = [super init]){
        _rates = [@{}mutableCopy];
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
    
}
    
#pragma mark - utils

-(NSString *)keyForCurrency:(NSString * )fromCurrency toCurrency:(NSString *) toCurrency{
    return [NSString stringWithFormat:@"%@-%@",fromCurrency,toCurrency];
}


@end
