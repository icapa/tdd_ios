//
//  WalletTableViewController.h
//  MyWallet
//
//  Created by Iván Cayón Palacio on 25/7/16.
//  Copyright © 2016 KeepCoding. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Wallet;

@interface WalletTableViewController : UITableViewController

-(id) initWithModel:(Wallet *) model;
@end
