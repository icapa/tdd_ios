//
//  Money.h
//  MyWallet
//
//  Created by Iván Cayón Palacio on 19/7/16.
//  Copyright © 2016 KeepCoding. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Money : NSObject

@property (nonatomic, readonly) NSString *currency;


+(id) euroWithAmount: (NSInteger) amount;
+(id) dollarWithAmount: (NSInteger) amount;

-(id) initWithAmount:(NSInteger) amount
            currency:(NSString *) currency;

-(id)times: (NSInteger) multiplier;

-(Money *) plus: (Money *) other;


@end
