//
//  AppDelegate.m
//  MyWallet
//
//  Created by Iván Cayón Palacio on 18/7/16.
//  Copyright © 2016 KeepCoding. All rights reserved.
//

#import "AppDelegate.h"
#import "WalletTableViewController.h"
#import "Wallet.h"
#import "Broker.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen]bounds]];
    
    Wallet *wallet = nil;
    Broker *broker = nil;
    WalletTableViewController *tableVC=nil;
    
    // Creo un wallet con dos divisas distintas
    //Euros
    wallet = [[Wallet alloc]initWithAmount:[NSNumber numberWithDouble:10] currency:@"EUR"];
    [wallet plus:[Money euroWithAmount:[NSNumber numberWithDouble:10]]];
    
    // Dollar
    [wallet plus:[Money dollarWithAmount:[NSNumber numberWithDouble:20]]];
    [wallet plus:[Money dollarWithAmount:[NSNumber numberWithDouble:20]]];
    
    
    
    // Libras
    [wallet plus:[[Money alloc]initWithAmount:[NSNumber numberWithDouble:40] currency:@"GBP"]];
    [wallet plus:[[Money alloc]initWithAmount:[NSNumber numberWithDouble:40] currency:@"GBP"]];
    
    
    // Creo el broker
    broker = [Broker new];
    [broker addRate:[NSNumber numberWithDouble:2] fromCurrency:@"EUR" toCurrency:@"USD"];
    [broker addRate:[NSNumber numberWithDouble:4] fromCurrency:@"EUR" toCurrency:@"GBP"];
    
    
    // Creo la tabla que quiero probar
    tableVC = [[WalletTableViewController alloc]
                    initWithModel:wallet
                    broker:broker];
    

    
    UINavigationController *nav = [[UINavigationController alloc]
                                   initWithRootViewController:tableVC];
    
    //self.window.rootViewController = tableVC;
    self.window.rootViewController = nav;
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self.window makeKeyAndVisible];
    
    
    
    
    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
