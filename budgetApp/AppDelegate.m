//
//  AppDelegate.m
//  budgetApp
//
//  Created by Erik Goossens on 2018-06-27.
//  Copyright © 2018 Erik Goossens. All rights reserved.
//

#import "AppDelegate.h"
#import "Realm/Realm.h"
#import "Section.h"
#import "Expense.h"


@interface AppDelegate ()
@property (nonatomic) RLMRealm *realm;
@property (nonatomic) RLMResults<Section*>* sections;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.realm = [RLMRealm defaultRealm];
//    [self createSectionObjects];
    self.sections = [self createSectionObjects];
    
    // init an expense and call the save method below to test it
    // fetch all sections method, call it from here to test it.
    
    // test reset
    NSLog(@"count: %@", @(self.sections.count));
//    [self createTestObjects];
    
    return YES;
}

- (void)createTestObjects {
    
    Section *food = self.sections[0];
    Expense *expense1 = [[Expense alloc] initWithName:@"Ice cream" amount:[[NSDecimalNumber alloc]initWithInt:10] description:@"Campo on King" date:[NSDate date]];
    Expense *expense2 = [[Expense alloc] initWithName:@"Fruit" amount:[[NSDecimalNumber alloc]initWithInt:10] description:@"Fresh and Wild" date:[NSDate date]];
    
    Section *entertainment = self.sections[1];
    Expense *expense3 = [[Expense alloc] initWithName:@"Movie night" amount:[[NSDecimalNumber alloc]initWithInt:28] description:@"Went to see Deadpool 2" date:[NSDate date]];
    Expense *expense4 = [[Expense alloc] initWithName:@"Bar hopping with friends" amount:[[NSDecimalNumber alloc]initWithInt:80] description:@"Drinks are on me" date:[NSDate date]];
    
    Section *utility = self.sections[2];
    Expense *expense5 = [[Expense alloc] initWithName:@"Internet bill" amount:[[NSDecimalNumber alloc]initWithInt:92] description:@"High speed fibre optic" date:[NSDate date]];
    Expense *expense6 = [[Expense alloc] initWithName:@"Hydro bill" amount:[[NSDecimalNumber alloc]initWithInt:55] description:@"For the current month" date:[NSDate date]];
    
     
     Section *transportation = self.sections[3];
     Expense *expense7 = [[Expense alloc] initWithName:@"TTC" amount:[[NSDecimalNumber alloc]initWithInt:127] description:@"Monthly pass" date:[NSDate date]];
     Expense *expense8 = [[Expense alloc] initWithName:@"Uber ride" amount:[[NSDecimalNumber alloc]initWithInt:21] description:@"For the trip downtown" date:[NSDate date]];
    
     
     Section *miscellaneous = self.sections[4];
     Expense *expense9 = [[Expense alloc] initWithName:@"Indoor skydiving" amount:[[NSDecimalNumber alloc]initWithInt:163] description:@"iFly Toronto" date:[NSDate date]];
     Expense *expense10 = [[Expense alloc] initWithName:@"New computer desk purchase" amount:[[NSDecimalNumber alloc]initWithInt:120] description:@"IKEA desk" date:[NSDate date]];
    
    [self.realm beginWriteTransaction];
    [food.expenses addObjects:@[expense1, expense2]];
    [entertainment.expenses addObjects:@[expense3, expense4]];
    [utility.expenses addObjects:@[expense5, expense6]];
    [transportation.expenses addObjects:@[expense7, expense8]];
    [miscellaneous.expenses addObjects:@[expense9, expense10]];
    [self.realm commitWriteTransaction];
    
}

#pragma mark - Move to RealmManager

// this could be in the init method of the realm manager
- (RLMResults<Section*> *)createSectionObjects {
    RLMResults<Section*> *sections = [Section allObjects];
    if (sections.count == 0) {
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
- (void)saveExpense:(Expense *)expense withSection:(NSString *)section {
    // Query using a predicate string
    
    // Query using an NSPredicate
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"title = %@", section];
    RLMResults<Section *> *results = [Section objectsWithPredicate:pred];
    Section *currentSection = results[0];
    [self.realm beginWriteTransaction];
    [currentSection.expenses addObject: expense];
    [self.realm commitWriteTransaction];
    
    // fetch the section using the parameter
    // save the expense object to that section's .expenses property
    

}
//
//- (RLMArray<Section*>*)fetchAllSections {
//    
//    
//    RLMArray<Section*>*sectionArray = [
//    return nil;
//}
//
//- (void)reset {
//    // delete all objects
//}
//
//- (void)deleteExpense:(Expense *)expense {
//    
//}










- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
