//
//  Money.m
//  MyWallet
//
//  Created by Iván Cayón Palacio on 19/7/16.
//  Copyright © 2016 KeepCoding. All rights reserved.
//

#import "Money.h"
#import "NSObject+GNUStepAddons.h"

#import "Broker.h"

@interface Money()
@property (nonatomic,strong) NSNumber *amount;
@end

@implementation Money


+(id) euroWithAmount: (NSNumber *) amount{
    return [[Money alloc ]initWithAmount:amount currency:@"EUR"];
}


+(id) dollarWithAmount: (NSNumber *) amount{
    return [[Money alloc] initWithAmount: amount currency:@"USD"];
}


-(id) initWithAmount:(NSNumber *) amount currency: (NSString * ) currency{
    if (self = [super init]){
        _amount = amount;
        _currency = currency;
    }
    return self;
}

-(id<Money>)times: (NSInteger) multiplier{
    
    NSNumber *ns = [NSNumber numberWithDouble: [self.amount doubleValue] * multiplier];
    
    Money *newMoney = [[Money alloc]
                       initWithAmount:ns
                       currency: self.currency];
    return newMoney;

    
}

-(id<Money>) plus: (Money *) other{
    NSNumber *t = [NSNumber numberWithDouble:[self.amount doubleValue] + [other.amount doubleValue]];
    
    Money *total = [[Money alloc] initWithAmount: t
                                        currency:self.currency];
    return total;
}

-(id<Money>) reduceToCurrency:(NSString *) currency withBroker:(Broker *) broker{
    Money *result;
    // Comprobamos que divisa de origen y destino son las mismas
    double rate = [[broker.rates
                    objectForKey:[broker keyForCurrency:self.currency
                                           toCurrency:currency]] doubleValue];
    
    if ([self.currency isEqualToString:currency]){
        result = self;
    }
    else if(rate == 0){
        // No hay tasa de conversión, excepción
        [NSException raise:@"NoConversionRateException"
                    format:@"Must have a conversion from %@ to %@",self.currency,currency];
    }
    else{
        NSNumber *newAmount = [NSNumber numberWithDouble:[self.amount doubleValue]*rate];
        
        
        result = [[Money alloc] initWithAmount:newAmount
                                      currency:currency];
        
    }
    return result;

}


#pragma mark - Overwritten
-(NSString *) description{
    return [NSString stringWithFormat:@"<%@: %@ %@>",
             [self class],self.currency,self.amount];
    
}

-(BOOL)isEqual:(id)object{
    if ([self.currency isEqual:[object currency]]){
        return [self amount] == [object amount];
    }else{
        return NO;
    }
    
}

-(NSUInteger) hash{
    return  [self.amount integerValue];
}

@end
