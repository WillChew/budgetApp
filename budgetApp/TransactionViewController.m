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
#import "AddTxTableViewController.h"

@interface TransactionViewController () <UITableViewDataSource, UITableViewDelegate>


@property (weak, nonatomic) IBOutlet UITableView *transactionTableView;

@property (nonatomic, strong) NSArray<NSMutableArray*> *transactionArray;

@property (nonatomic, strong) NSMutableArray<Expense*> *foodSectionArray;
@property (nonatomic, strong) NSMutableArray<Expense*> *entertainmentSectionArray;
@property (nonatomic, strong) NSMutableArray<Expense*> *transportationSectionArray;
@property (nonatomic, strong) NSMutableArray<Expense*> *livingExpensesSectionArray;
@property (nonatomic, strong) NSMutableArray<Expense*> *miscellaneousSectionArray;

//@property (nonatomic, strong) Expense *expense;





@end

@implementation TransactionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
    return 100;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.transactionArray[section].count;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    TransactionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TransactionCell" forIndexPath:indexPath];
    NSArray *sectionArray = self.transactionArray[indexPath.section];
    Expense *expense = sectionArray[indexPath.row];
    [cell configureCellWithExpense:expense];
    return cell;
}



// prepareForSegue and pass the AddTxVC the DataHelper instance self.dataHelper
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"GoToAdd"]) {
        AddTxTableViewController *addTxVC = segue.destinationViewController;
        addTxVC.dataHelper = self.dataHelper;
    }
}




@end
