//
//  ConfigureBudgetViewController.m
//  budgetApp
//
//  Created by Erik Goossens on 2018-06-27.
//  Copyright © 2018 Erik Goossens. All rights reserved.
//

#import "ConfigureBudgetViewController.h"
#import "ViewController.h"

@interface ConfigureBudgetViewController ()
@property (weak, nonatomic) IBOutlet UILabel *budgetLabel;
@property (weak, nonatomic) IBOutlet UITextField *configureBudgetTextField;



@end

@implementation ConfigureBudgetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupKeyboard];
    // Do any additional setup after loading the view.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ViewController *vc = segue.destinationViewController;
    [self.dataHelper saveBudget:self.configureBudgetTextField.text];
    vc.budgetLabel.text = [self.dataHelper budgetRemaining];
    NSLog(@"%@", [[NSUserDefaults standardUserDefaults]dictionaryRepresentation]);
    
}



-(void)setupKeyboard {
    self.configureBudgetTextField.keyboardType = UIKeyboardTypeDecimalPad;
}
- (void)dealloc {
    
}




@end
