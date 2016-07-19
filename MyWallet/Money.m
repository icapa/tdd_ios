//
//  Money.m
//  MyWallet
//
//  Created by Iván Cayón Palacio on 19/7/16.
//  Copyright © 2016 KeepCoding. All rights reserved.
//

#import "Money.h"
#import "NSObject+GNUStepAddons.h"

@interface Money()
@property (nonatomic) NSInteger amount;
@end


@implementation Money

-(id) initWithAmount:(NSInteger) amount{
    if (self = [super init]){
        _amount = amount;
    }
    return self;
}

-(Money *)times: (NSInteger) multiplier{
    // no se debería llamar, sino que deberia de usar
    // el de la sub clase
    return [self subclassResponsabillity:_cmd];
    
}

/*
#pragma mark - Overwritten
-(BOOL)isEqual:(id)object{
    return [self amount] == [object amount];
}
*/

@end
