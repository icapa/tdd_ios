//
//  Money.h
//  MyWallet
//
//  Created by Iván Cayón Palacio on 19/7/16.
//  Copyright © 2016 KeepCoding. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Money;

@protocol Money <NSObject>


-(id) initWithAmount:(NSInteger) amount
            currency:(NSString *) currency;

-(id<Money>)times: (NSInteger) multiplier;

-(id<Money>) plus: (Money *) other;


@end



@interface Money : NSObject <Money>

@property (nonatomic, strong, readonly) NSNumber *amount;
@property (nonatomic, readonly) NSString *currency;



+(id) euroWithAmount: (NSInteger) amount;
+(id) dollarWithAmount: (NSInteger) amount;


@end
