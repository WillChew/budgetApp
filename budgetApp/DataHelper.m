//
//  DataHelper.m
//  budgetApp
//
//  Created by Erik Goossens on 2018-06-28.
//  Copyright © 2018 Erik Goossens. All rights reserved.
//

#import "DataHelper.h"
#import "Section.h"
#import "Expense.h"

@interface DataHelper()

@property (nonatomic) RLMRealm *realm;
@property (nonatomic) RLMArray<Section*>* sections;


@end

@implementation DataHelper


// override init
// call createSections
// set the return to sections property

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.realm = [RLMRealm defaultRealm];
        self.sections = (RLMArray <Section*>*)[self createSectionObjects];
        //        [self createTestObjects];
    }
    return self;
}

- (void)createTestObjects {
    
    Section *food = self.sections[0];
    Expense *expense1 = [[Expense alloc] initWithName:@"Churro ice cream" amount:[[NSDecimalNumber alloc]initWithInt:6] description:@"Campo on King" date:[NSDate date]];
    Expense *expense2 = [[Expense alloc] initWithName:@"Groceries" amount:[[NSDecimalNumber alloc]initWithInt:104] description:@"Fresh and Wild" date:[NSDate date]];
    
    Section *entertainment = self.sections[1];
    Expense *expense3 = [[Expense alloc] initWithName:@"Movie night" amount:[[NSDecimalNumber alloc]initWithInt:27] description:@"Deadpool 2" date:[NSDate date]];
    Expense *expense4 = [[Expense alloc] initWithName:@"Bar hopping with friends" amount:[[NSDecimalNumber alloc]initWithInt:64] description:@"King West" date:[NSDate date]];
    
    Section *utility = self.sections[2];
    Expense *expense5 = [[Expense alloc] initWithName:@"Internet bill" amount:[[NSDecimalNumber alloc]initWithInt:80] description:@"Bell fibre optic" date:[NSDate date]];
    Expense *expense6 = [[Expense alloc] initWithName:@"Hydro bill" amount:[[NSDecimalNumber alloc]initWithInt:125] description:@"June" date:[NSDate date]];
    
    
    Section *transportation = self.sections[3];
    Expense *expense7 = [[Expense alloc] initWithName:@"TTC Metropass" amount:[[NSDecimalNumber alloc]initWithInt:146] description:@"Monthly pass" date:[NSDate date]];
    Expense *expense8 = [[Expense alloc] initWithName:@"Uber ride" amount:[[NSDecimalNumber alloc]initWithInt:23] description:@"Heading across town" date:[NSDate date]];
    
    
    Section *miscellaneous = self.sections[4];
    Expense *expense9 = [[Expense alloc] initWithName:@"Indoor skydiving" amount:[[NSDecimalNumber alloc]initWithInt:145] description:@"iFly Toronto" date:[NSDate date]];
    Expense *expense10 = [[Expense alloc] initWithName:@"New computer desk" amount:[[NSDecimalNumber alloc]initWithInt:53] description:@"IKEA purchase" date:[NSDate date]];
    
    [self.realm beginWriteTransaction];
    [food.expenses addObjects:@[expense1, expense2]];
    [entertainment.expenses addObjects:@[expense3, expense4]];
    [utility.expenses addObjects:@[expense5, expense6]];
    [transportation.expenses addObjects:@[expense7, expense8]];
    [miscellaneous.expenses addObjects:@[expense9, expense10]];
    [self.realm commitWriteTransaction];
    
}


- (RLMResults<Section*> *)createSectionObjects {
    RLMResults<Section*> *sections = [Section allObjects];
    if (sections.count < 5) {
        Section *food = [[Section alloc] init];
        food.title = @"Food";
        Section *entertainment = [[Section alloc] init];
        entertainment.title = @"Entertainment";
        Section *utility = [[Section alloc] init];
        utility.title = @"Utility";
        Section *transportation = [[Section alloc]init];
        transportation.title = @"Transportation";
        Section *miscellaneous = [[Section alloc] init];
        miscellaneous.title = @"Miscellaneous";
        [self.realm beginWriteTransaction];
        [self.realm addObjects:@[food, entertainment, utility, transportation, miscellaneous]];
        [self.realm commitWriteTransaction];
        sections = [Section allObjects];
    }
    
    return sections;
}


// this method is going to be called by the addtransactionviewcontroller
//
- (void)saveExpense:(Expense *)expense withSection:(NSString *)sectionTitle {
    // Query using a predicate string
    
    // Get Section matching sectionTitle
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"title = %@", sectionTitle];
    RLMResults<Section *> *results = [Section objectsWithPredicate: pred];
    Section *currentSection = results[0];
    
    [self.realm beginWriteTransaction];
    [currentSection.expenses addObject: expense];
    [self.realm commitWriteTransaction];
    
    // fetch the section using the parameter
    // save the expense object to that section's .expenses property
    
    
}
//

- (float) totalExpenses {
    //    NSNumber *sum = [numbers valueForKeyPath:@"@sum.number"];
    //    NSPredicate *pred = [NSPredicate predicateWithFormat:@"@sum.amount"];
    RLMResults <Expense*>*expenses = [Expense allObjects];
    NSNumber *expenseNumber = [expenses sumOfProperty:@"amount"];
    float totalExpenses = [expenseNumber floatValue];
    return totalExpenses;
}


- (RLMArray<Section*>*)fetchAllSections {
    return self.sections;
}
//
- (void)reset {
    RLMResults <Expense*>*expensesToDelete = [Expense allObjects];
    [self.realm beginWriteTransaction];
    [self.realm deleteObjects:expensesToDelete];
    [self.realm commitWriteTransaction];
    
}


- (void) saveBudget:(NSString*)amount {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSNumber *budgetAmount = @([amount floatValue]);
    [defaults setObject:budgetAmount forKey:@"Budget"];
}

- (float) getBudget {
    return [NSUserDefaults.standardUserDefaults floatForKey:@"Budget"];
}

- (NSString*) budgetRemaining {
    float budgetAfterExpenses = [self getBudget] - [self totalExpenses];
    NSString *floatString = [NSString stringWithFormat:@"%.02f",budgetAfterExpenses];
    return floatString;
}

- (float)sectionExpenseTotal:(NSString*)sectionTitle {
    
    RLMResults <Section*>*foodSection = [Section objectsWhere:@"title = %@", sectionTitle];
    NSArray *array = [foodSection valueForKeyPath:@"expenses.amount"];
    NSArray *array2 = [[NSArray alloc]initWithArray:array[0]];
    float sum = 0;
    for (NSNumber *number in array2) {
        sum += [number floatValue];
    }
    float totalExpenseTotal = @(sum).floatValue;
    return totalExpenseTotal;
}

- (void)deleteAtIndexPath:(NSInteger)indexPath {
    RLMResults <Expense*>*expenses = [Expense allObjects];
    [self.realm beginWriteTransaction];
    [self.realm deleteObject:[expenses objectAtIndex: indexPath]];
    [self.realm commitWriteTransaction];
}


@end
