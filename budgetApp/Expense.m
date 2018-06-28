//
//  Expenses.m
//  budgetApp
//
//  Created by Will Chew on 2018-06-27.
//  Copyright © 2018 Erik Goossens. All rights reserved.
//

#import "Expense.h"
#import "Section.h"

@implementation Expense

- (instancetype)initWithName:(NSString *)name amount:(NSDecimalNumber *)amount description:(NSString *)desc date:(NSDate *)date {
    if (self = [super init]) {
        _name = name;
        _amount = amount;
        _desc = desc;
        _date = date;
    }
    return self;
}

@end
