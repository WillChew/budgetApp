//
//  ViewController.h
//  budgetApp
//
//  Created by Erik Goossens on 2018-06-27.
//  Copyright © 2018 Erik Goossens. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataHelper.h"


@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *budgetLabel;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *configureButton;
@property (nonatomic) DataHelper *dataHelper;
@property (weak, nonatomic) IBOutlet UIButton *resetBudgetButton;

@end

