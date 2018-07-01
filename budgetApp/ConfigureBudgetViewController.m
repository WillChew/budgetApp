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
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;



@end

@implementation ConfigureBudgetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupKeyboard];

    // Do any additional setup after loading the view.
    self.submitButton.backgroundColor = UIColor.clearColor;
    self.containerView.layer.cornerRadius = 25;
    
}
-(void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.hidden = YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ViewController *vc = segue.destinationViewController;
    [self.dataHelper saveBudget:self.configureBudgetTextField.text];
    vc.budgetLabel.text = [NSString stringWithFormat:@"$%@",[self.dataHelper budgetRemaining]];
    [vc.pieView reloadData];
    
}



-(void)setupKeyboard {
    self.configureBudgetTextField.keyboardType = UIKeyboardTypeDecimalPad;
}
- (void)dealloc {
    
}




@end
