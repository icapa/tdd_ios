//
//  WalletTableViewController.m
//  MyWallet
//
//  Created by Iván Cayón Palacio on 25/7/16.
//  Copyright © 2016 KeepCoding. All rights reserved.
//

#import "WalletTableViewController.h"
#import "Wallet.h"
#import "Broker.h"
@interface WalletTableViewController ()
@property (nonatomic,strong) Wallet *model;
@property (nonatomic,strong) Broker *broker;
@end

@implementation WalletTableViewController

-(id) initWithModel:(Wallet *)model broker:(Broker *)broker{
    if (self = [super initWithStyle:UITableViewStylePlain]){
        _model = model;
        _broker = broker;
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Numero de conversiones  * 2, más otro
    return [self.broker currenciesCount] + 1;

    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Si es la ultima section, siempre es 1
    if (section == [self.broker currenciesCount]){
        return 1;
    }else{
        // Se devuelve el numero
        return [self moneyCountForCurrency:section]+1;
    }
    
}


-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section < [self.broker.currencies count])
    {
        NSArray *array = [self.broker.currencies allObjects];
        NSString *aux=nil;
        NSNumber *rate=nil;
        
        NSString *key = [NSString stringWithFormat:@"%@-%@",
                         array[section],@"EUR"];
        
        if ([array[section] isEqualToString:@"EUR"]){
            rate = [NSNumber numberWithDouble:1.0];
            aux = [NSString stringWithFormat:@"%@",array[section]];
        }
        else{
            rate = [self.broker.rates objectForKey:key];
            aux = [NSString stringWithFormat:@"%@ - (1 %@ = %0.2f %@)",
                   array[section],
                   array[section],[rate doubleValue], @"EUR"];
        }
        return aux;
    }
    else{
        // Si es el total
        return @"Total €";
    }
        
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:CellIdentifier];
    }
    
    // Si es la ultima seccion va el total
    Money *money = nil;
    if (indexPath.section == [self.tableView numberOfSections]-1){
        money = [self.model totalMoneyWithBroker:self.broker];
    }
    else{
        NSString *cur = [self currencyAtIndex:indexPath.section];
        
        money = [self.model moneyFor:cur
                                    atIndex:indexPath.row];
    }
    
    if (indexPath.row == [self.tableView numberOfRowsInSection:indexPath.section]-1){
        cell.textLabel.text = [NSString stringWithFormat:@"Total: %@",[[money amount] description]];
    }
    else{
        cell.textLabel.text = [[money amount] description];
    }
    
    cell.detailTextLabel.text=@"";
    
    return cell;
}


#pragma mark - Utils
-(NSInteger) moneyCountForCurrency: (NSInteger)section{
    NSInteger count=0;
    NSArray *array = [self.broker.currencies allObjects];
    for (Money *each in self.model.moneys){
        
        if ([each.currency isEqualToString: array[section] ]){
            count = count + 1;
        }
    }
    return count;
}


-(NSString *) currencyAtIndex:(NSInteger)index{
    NSArray * array =[self.broker.currencies allObjects];
    if (array.count != 0 && index<array.count){
        return [array[index] description];
    }
    else{
        return nil;
    }
}


@end
