//
//  ViewController.m
//  budgetApp
//
//  Created by Erik Goossens on 2018-06-27.
//  Copyright © 2018 Erik Goossens. All rights reserved.
//

#import "ViewController.h"
#import "ConfigureBudgetViewController.h"
#import "MaterialButtons.h"
#import "MaterialButtons+ButtonThemer.h"




@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    
    // Style Reset Button
    self.resetBudgetButton.layer.shadowColor = [UIColor.lightGrayColor CGColor];
    self.resetBudgetButton.layer.shadowOffset = CGSizeZero;
    self.resetBudgetButton.layer.shadowRadius = 10.0;
    self.resetBudgetButton.layer.shadowOpacity = 0.20;
    self.resetBudgetButton.layer.cornerRadius = 10.0;
    
    
//    // Create Test Material Button
//    MDCButton *button = [[MDCButton alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
//
//    //     Themed as a text button:
//    MDCButtonScheme *buttonScheme = [[MDCButtonScheme alloc] init];
//
//    [MDCTextButtonThemer applyScheme:buttonScheme toButton:button];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.budgetLabel.text = [self.dataHelper budgetRemaining];
    [self.dataHelper sectionExpenseTotal:@"Entertainment"];
    

    
}

- (void)setDataHelper:(DataHelper *)dataHelper {
    
    _dataHelper = dataHelper;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ConfigureSegue"]) {
        ConfigureBudgetViewController *cvc = segue.destinationViewController;
        cvc.dataHelper = self.dataHelper;
        self.navigationController.navigationBar.hidden = YES;
        
        
    }
}
- (IBAction)resetButtonPressed:(id)sender {
    [self.dataHelper reset];
    self.budgetLabel.text = @"Enter Your Starting Budget";
    [self performSegueWithIdentifier:@"ConfigureSegue" sender:self];
}

- (IBAction)configureButtonPressed:(id)sender {
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    }


- (IBAction)unwindToMainMenu:(UIStoryboardSegue *)unwindSegue {
    if([unwindSegue.sourceViewController isKindOfClass:[ConfigureBudgetViewController class]]) {
        self.navigationController.navigationBar.hidden = NO;
    }
 
}


@end
