//
//  SimpleViewController.h
//  MyWallet
//
//  Created by Iván Cayón Palacio on 25/7/16.
//  Copyright © 2016 KeepCoding. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SimpleViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *displayLabel;
- (IBAction)displayText:(id)sender;

@end
