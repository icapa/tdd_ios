//
//  NSFakeNotificationCenter.m
//  MyWallet
//
//  Created by Iván Cayón Palacio on 25/7/16.
//  Copyright © 2016 KeepCoding. All rights reserved.
//

#import "NSFakeNotificationCenter.h"

@implementation NSFakeNotificationCenter

-(id) init{
    if (self = [super init]){
        _observers = [NSMutableDictionary dictionary];
    }
    return self;
}


-(void)addObserver:(id)observer
          selector:(SEL)aSelector
              name:(NSString *)aName
            object:(id)anObject{
    [self.observers setObject:observer
                       forKey:aName];
}

@end
