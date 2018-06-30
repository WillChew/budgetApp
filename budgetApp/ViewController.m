//
//  ViewController.m
//  budgetApp
//
//  Created by Erik Goossens on 2018-06-27.
//  Copyright © 2018 Erik Goossens. All rights reserved.
//

#import "ViewController.h"
#import "ConfigureBudgetViewController.h"


@implementation ViewController


//- (void)viewDidLoad {
//    [super viewDidLoad];
//
//    // Do any additional setup after loading the view, typically from a nib.
//}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.budgetLabel.text = [self.dataHelper budgetRemaining];
//    [self.dataHelper totalExpenses];
//    [self.dataHelper fetchAllSections];
    [self.dataHelper sectionExpenseTotal:@"Entertainment"];
    
}

- (void)setDataHelper:(DataHelper *)dataHelper {
    
    _dataHelper = dataHelper;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ConfigureSegue"]) {
        ConfigureBudgetViewController *cvc = segue.destinationViewController;
        cvc.dataHelper = self.dataHelper;
        
        
    }
}
- (IBAction)resetButtonPressed:(id)sender {
    [self.dataHelper reset];
}

- (IBAction)configureButtonPressed:(id)sender {
//    [self.navigationItem setRightBarButtonItem:nil];
}


- (IBAction)unwindToMainMenu:(UIStoryboardSegue *)unwindSegue {
    if([unwindSegue.sourceViewController isKindOfClass:[ConfigureBudgetViewController class]]) {
        ConfigureBudgetViewController *cvc = unwindSegue.sourceViewController;
    }
    
    
    
    
}


@end
