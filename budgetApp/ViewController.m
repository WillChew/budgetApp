//
//  ViewController.m
//  budgetApp
//
//  Created by Erik Goossens on 2018-06-27.
//  Copyright © 2018 Erik Goossens. All rights reserved.
//

#import "ViewController.h"
#import "ConfigureBudgetViewController.h"

@interface ViewController () <ConfigureBudgetDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ConfigureSegue"]) {
        ConfigureBudgetViewController *cvc = segue.destinationViewController;
        cvc.delegate = self;
    }
}
-(void)sendBudgetBackVC:(UIViewController *)controller passText:(NSString *)budget {
//    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc]init];
//    [numberFormatter setNumberStyle:NSNumberFormatterCurrencyAccountingStyle];
    NSNumberFormatter *format = [[NSNumberFormatter alloc]init];
    format.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber *myNumber = [format numberFromString:budget];
    NSString *budgetString = [format stringFromNumber:myNumber];
    
    self.budgetLabel.text = [NSString stringWithFormat:@"$%@", budgetString];
}
@end
