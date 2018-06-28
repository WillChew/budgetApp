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
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.realm = [RLMRealm defaultRealm];
//    [self createSectionObjects];
    RLMResults<Section*> *results = [self createSectionObjects];
    
    // init an expense and call the save method below to test it
    // fetch all sections method, call it from here to test it.
    
    // test reset
    NSLog(@"count: %@", @(results.count));
    
    return YES;
}

- (void)createTestObjects {
    
    
//    Section *section1 = [[Section alloc] init];
//    section1.title = @"Food";
//
//    Expense *expense1 = [[Expense alloc] initWithName:@"Ice cream" amount:[[NSDecimalNumber alloc]initWithInt:10] description:@"Campo on King" date:[NSDate date]];
//
//    [section1.expenses addObject:expense1];
    
//    Section *section2 = [[Section alloc] init];
//    section2.title = @"Food";
//
//    Expense *expense2 = [[Expense alloc] initWithName:@"Fruit" amount:[[NSDecimalNumber alloc]initWithInt:10] description:@"Fresh and Wild" date:[NSDate date]];
//
//    [section2.expenses addObject:expense2];
//
//    [self.realm transactionWithBlock:^{
//        [self.realm addObject:section2];
//    } error:nil
//     ];
//
//
//    Expense *e2 = [[Expense alloc]initWithName:@"bills" amount:[[NSDecimalNumber alloc]initWithInt:20] description:@"paid bills" date:[NSDate date]];
//    Section *s2 = [[Section alloc] init];
//    s2.title = @"Fun";
//    e2.section = s2;
    
}

#pragma mark - Move to RealmManager

// this could be in the init method of the realm manager
- (RLMResults<Section*> *)createSectionObjects {
    // check whether the sections exist. Query for all section, count on the section
    // if they don't then create and save them
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

- (void)saveExpense:(Expense *)expense withSection:(NSString *)section {
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
