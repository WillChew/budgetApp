//
//  Expenses.h
//  budgetApp
//
//  Created by Will Chew on 2018-06-27.
//  Copyright © 2018 Erik Goossens. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Realm/Realm.h"
@class Section;

@interface Expense: RLMObject

@property NSString *name;
@property NSNumber<RLMFloat> *amount;
@property NSString *desc;
@property NSDate *date;
@property Section *section;

-(instancetype)initWithName:(NSString*)name amount:(NSDecimalNumber*)amount description:(NSString*)desc date:(NSDate*)date;

@end

RLM_ARRAY_TYPE(Expense)
