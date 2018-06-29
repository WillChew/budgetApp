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
#import "Section.h"

@interface TransactionViewController () <UITableViewDataSource, UITableViewDelegate>


@property (weak, nonatomic) IBOutlet UITableView *transactionTableView;

@property (nonatomic) RLMArray<Section*>* sections;



//@property (nonatomic, strong) Expense *expense;





@end

@implementation TransactionViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        
    }
    return self;
}

- (void)setDataHelper:(DataHelper *)dataHelper {
    
    _dataHelper = dataHelper;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // set the sections property to the queried sections from data helper
    self.sections = [self.dataHelper fetchAllSections];
    

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.transactionTableView reloadData];
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
    return self.sections.count;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //given a particular section, what is the number of rows within that section
    Section *givenSection = self.sections[section];
    return givenSection.expenses.count;
    
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    TransactionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TransactionCell" forIndexPath:indexPath];
    Section *section = self.sections[indexPath.section];
    Expense *expense = section.expenses[indexPath.row];
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
