//
//  Section.h
//  budgetApp
//
//  Created by Erik Goossens on 2018-06-28.
//  Copyright © 2018 Erik Goossens. All rights reserved.
//

#import "RLMObject.h"
#import "Realm/Realm.h"

#import "Expense.h"


@interface Section : RLMObject

@property RLMArray<Expense *><Expense>*expenses;
@property NSString *title;

@end
