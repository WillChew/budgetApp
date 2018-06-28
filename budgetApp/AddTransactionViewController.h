//
//  AddTransactionViewController.h
//  budgetApp
//
//  Created by Will Chew on 2018-06-27.
//  Copyright © 2018 Erik Goossens. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Expense.h"

@protocol AddTransactionDelegate
-(void)sendDataBack:(UIViewController*)vc passData:(Expense*)addExpense;

@end

@interface AddTransactionViewController : UIViewController

@property (nonatomic,weak)id<AddTransactionDelegate>delegate;

@end


