//
//  ConfigureBudgetViewController.h
//  budgetApp
//
//  Created by Erik Goossens on 2018-06-27.
//  Copyright © 2018 Erik Goossens. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ConfigureBudgetDelegate
-(void)sendBudgetBackVC:(UIViewController*)controller passText:(NSString*)budget;
@end

@interface ConfigureBudgetViewController : UIViewController
@property (nonatomic,weak)id<ConfigureBudgetDelegate>delegate;

@end
