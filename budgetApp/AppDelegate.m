//
//  AppDelegate.m
//  budgetApp
//
//  Created by Erik Goossens on 2018-06-27.
//  Copyright © 2018 Erik Goossens. All rights reserved.
//

#import "AppDelegate.h"
#import "Realm/Realm.h"
#import "DataHelper.h"
#import "ViewController.h"
#import "TransactionViewController.h"



@interface AppDelegate ()

@property (nonatomic, strong) DataHelper *dataHelper;


@end

@implementation AppDelegate




- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self setupDataHelper];
    return YES;
}

- (void) setupDataHelper {
    ViewController *viewController = (ViewController*)((UINavigationController*)((UITabBarController *)self.window.rootViewController).viewControllers[0]).topViewController;
    TransactionViewController *transVC = (TransactionViewController*)((UINavigationController*)((UITabBarController *)self.window.rootViewController).viewControllers[0]).topViewController;
    DataHelper *helper = [DataHelper new];
    transVC.dataHelper = helper;
    viewController.dataHelper = helper;
}

@end
