//
//  Euro.h
//  MyWallet
//
//  Created by Iván Cayón Palacio on 18/7/16.
//  Copyright © 2016 KeepCoding. All rights reserved.
//


@import Foundation;
#import "Money.h"

@interface Euro : Money



-(id) initWithAmount:(NSInteger) amount;

-(Euro *)times: (NSInteger) multiplier;


@end
