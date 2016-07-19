//
//  Dollar.m
//  MyWallet
//
//  Created by Iván Cayón Palacio on 19/7/16.
//  Copyright © 2016 KeepCoding. All rights reserved.
//

#import "Dollar.h"

@interface Dollar()

@property (nonatomic) NSInteger amount;

@end

@implementation Dollar

-(id) initWithAmount:(NSInteger) amount{
    if (self = [super init]){
        _amount = amount;
    }
    return self;
}

-(Dollar *)times: (NSInteger) multiplier{
    Dollar *newEuro = [[Dollar alloc]
                     initWithAmount:self.amount * multiplier];
    return newEuro;
}

#pragma mark - Overwritten
-(BOOL)isEqual:(id)object{
    return [self amount] == [object amount];
}

@end
