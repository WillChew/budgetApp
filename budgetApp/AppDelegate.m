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
#import "Chameleon.h"



@interface AppDelegate ()

@property (nonatomic, strong) DataHelper *dataHelper;


@end

@implementation AppDelegate




- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [Chameleon setGlobalThemeUsingPrimaryColor:[UIColor flatBlackColor] withContentStyle:UIContentStyleLight];
    [self setupDataHelper];
    return YES;
}

- (void) setupDataHelper {
    self.dataHelper = [DataHelper new];
    UITabBarController *tab = (UITabBarController *)self.window.rootViewController;
    UINavigationController *nav1 = tab.viewControllers[0];
    UINavigationController *nav2 = tab.viewControllers[1];
    ViewController *viewController = (ViewController *)nav1.topViewController;
    TransactionViewController *transVC = (TransactionViewController *)nav2.topViewController;
    transVC.dataHelper = self.dataHelper;
    viewController.dataHelper = self.dataHelper;
}

@end
