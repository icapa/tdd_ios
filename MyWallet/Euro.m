//
//  Euro.m
//  MyWallet
//
//  Created by Iván Cayón Palacio on 18/7/16.
//  Copyright © 2016 KeepCoding. All rights reserved.
//

#import "Euro.h"

@interface Euro()
@property (nonatomic) NSInteger amount;
@end


@implementation Euro

-(id) initWithAmount:(NSInteger) amount{
    if (self = [super init]){
        _amount = amount;
    }
    return self;
}

-(Euro *)times: (NSInteger) multiplier{
    Euro *newEuro = [[Euro alloc]
                     initWithAmount:self.amount * multiplier];
    return newEuro;
}

#pragma mark - Overwritten
-(BOOL)isEqual:(id)object{
    return [self amount] == [object amount];
}

@end
