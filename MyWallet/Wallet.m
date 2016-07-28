//
//  Wallet.m
//  MyWallet
//
//  Created by Iván Cayón Palacio on 21/7/16.
//  Copyright © 2016 KeepCoding. All rights reserved.
//

#import "Wallet.h"
#import <UIKit/UIKit.h>


@interface Wallet()

@property (nonatomic,strong) NSMutableArray *moneys;

@end


@implementation Wallet

-(NSUInteger) count{
    return self.moneys.count;
}

-(id) initWithAmount:(NSNumber *)amount currency:(NSString *)currency{
    if (self = [super init]){
        Money *money =[[Money alloc] initWithAmount:amount currency:currency];
        _moneys = [NSMutableArray array];
        [_moneys addObject:money];
    }
    return self;
}

-(id<Money>)plus:(Money *) money{
    [self.moneys addObject: money];
    return self;
}

-(id<Money>) times: (NSInteger) multiplier{
    NSMutableArray *newMoneys = [NSMutableArray arrayWithCapacity:self.moneys.count];
    
    for (Money *each in self.moneys){
        Money *newMoney = [each times: multiplier];
        [newMoneys addObject:newMoney];
        
    }
    self.moneys = newMoneys;
    return self;
}




-(Money *) reduceToCurrency:(NSString *)
            currency withBroker:(Broker *) broker{
    
    Money *result=[[Money alloc] initWithAmount:0 currency:currency];
    
    for (Money *each in self.moneys){
        result = [result plus:[each reduceToCurrency:currency withBroker:broker]];
        
        
    }
    return result;
}

-(Money *) moneyFor:(NSString *)currency atIndex: (NSInteger) index{
    NSMutableArray *array = [NSMutableArray array];
    Money *total = [[Money alloc] initWithAmount:0 currency:currency];
    for (Money *each in self.moneys){
        if ([each.currency isEqualToString:currency]){
            [array addObject:each];
            total = [total plus:each];
        }
    }
    if (array.count == 0 || index>array.count){
        return nil;
    }
    else if (index==array.count){
        // Se devuelve la suma, tengo el array lo puedo sumar
        return total;
    }
    else{
        return array[index];
    }
}

-(Money *) totalMoneyWithBroker:(Broker *)broker{
    // El total es en la divisa de refencia que son €
    Money *total = [Money euroWithAmount:0];
    for (Money *each in self.moneys){
        total =[total plus:[each reduceToCurrency:@"EUR" withBroker:broker]];
    }
    return total;
}


-(NSString *) currencyAtIndex:(NSInteger) index{
    if (index<self.moneys.count){
        Money *m = self.moneys[index];
        return m.currency;
    }
    return nil;
}
    







#pragma mark - Notificactions
-(void) subscribeToMemoryWarning:(NSNotificationCenter * )nc{
    [nc addObserver:self
           selector:@selector(dumpToDisk:)
               name:UIApplicationDidReceiveMemoryWarningNotification
             object:nil];
    
}

-(void) dumpToDisk:(NSNotification * )notification{
    
}

@end


