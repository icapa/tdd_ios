//
//  Wallet.h
//  MyWallet
//
//  Created by Iván Cayón Palacio on 21/7/16.
//  Copyright © 2016 KeepCoding. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Money.h"

@interface Wallet : NSObject<Money>
@property (nonatomic,readonly) NSUInteger count;

-(void) subscribeToMemoryWarning:(NSNotificationCenter * )nc;

@end
