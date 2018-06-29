//
//  ConfigureBudgetViewController.m
//  budgetApp
//
//  Created by Erik Goossens on 2018-06-27.
//  Copyright © 2018 Erik Goossens. All rights reserved.
//

#import "ConfigureBudgetViewController.h"

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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)submitButtonPressed:(UIButton *)sender {
//    [self.delegate sendBudgetBackVC:self passText:self.configureBudgetTextField.text];
    // saving using DataHelper
    [self.dataHelper saveBudget:self.configureBudgetTextField.text];
    [self.navigationController popViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"%@", [[NSUserDefaults standardUserDefaults]dictionaryRepresentation]);
    
    
 
}

-(void)setupKeyboard {
    self.configureBudgetTextField.keyboardType = UIKeyboardTypeDecimalPad;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



@end
