//
//  DataHelper.h
//  budgetApp
//
//  Created by Erik Goossens on 2018-06-28.
//  Copyright © 2018 Erik Goossens. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Realm/Realm.h"
@class Section;
@class Expense;

@interface DataHelper : NSObject

- (RLMResults<Section*> *)createSectionObjects;

- (void)saveExpense:(Expense *)expense withSection:(NSString *)sectionTitle;

- (RLMArray<Section*>*)fetchAllSections;

- (void)reset;

-(NSNumber*)sectionExpenseTotal:(NSString*)sectionTitle;


// 2 methods

// 1. saveBudget: -> Void
// 2. getBudget -> NSNumber
- (void) saveBudget:(NSString*)amount;

- (NSNumber *) totalExpenses;

- (NSString*) budgetRemaining;

@end
