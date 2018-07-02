//
//  TransactionTableViewCell.h
//  budgetApp
//
//  Created by Erik Goossens on 2018-06-27.
//  Copyright © 2018 Erik Goossens. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Expense.h"

@interface TransactionTableViewCell : UITableViewCell

- (void)configureCellWithExpense:(Expense *)expense;

@end
