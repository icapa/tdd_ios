//
//  Money.h
//  MyWallet
//
//  Created by Iván Cayón Palacio on 19/7/16.
//  Copyright © 2016 KeepCoding. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Money : NSObject

-(id) initWithAmount:(NSInteger) amount;

-(Money *)times: (NSInteger) multiplier;


@end
