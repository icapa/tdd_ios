//
//  NSFakeNotificationCenter.h
//  MyWallet
//
//  Created by Iván Cayón Palacio on 25/7/16.
//  Copyright © 2016 KeepCoding. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFakeNotificationCenter : NSObject
@property (nonatomic,strong) NSMutableDictionary *observers;

-(void)addObserver:(id)observer
          selector:(SEL)aSelector
              name:(NSString *)aName
            object:(id)anObject;
@end
