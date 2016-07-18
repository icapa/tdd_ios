//
//  Euro.h
//  MyWallet
//
//  Created by Iván Cayón Palacio on 18/7/16.
//  Copyright © 2016 KeepCoding. All rights reserved.
//


@import Foundation;

@interface Euro : NSObject

@property (readonly) NSInteger amount;

-(instancetype) initWithAmount:(NSInteger) amount;

-(void)times: (NSInteger) multiplier;

@end
