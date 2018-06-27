//
//  TransactionViewController.m
//  budgetApp
//
//  Created by Erik Goossens on 2018-06-27.
//  Copyright © 2018 Erik Goossens. All rights reserved.
//

#import "TransactionViewController.h"
#import "Expense.h"
#import "TransactionTableViewCell.h"

@interface TransactionViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *transactionTableView;
@property (nonatomic, strong) NSArray<NSArray*> *transactionArray;


@end

@implementation TransactionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
//    [dateFormatter setDateFormat:@"dd.mm.YY HH:mm:ss"];
//    NSString *dateString = [dateFormatter stringFromDate:currentDate];
    
    self.transactionArray = @[
                              @[],
                              @[],
                              @[],
                              @[],
                              @[],
                              ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.transactionArray.count;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.transactionArray[section].count;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    TransactionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TransactionCell" forIndexPath:indexPath];
    cell.
    return cell;
    
}





@end
