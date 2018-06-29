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

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    
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
//-(void)sendBudgetBackVC:(UIViewController *)controller passText:(NSString *)budget {
//    NSNumberFormatter *format = [[NSNumberFormatter alloc]init];
//    format.numberStyle = NSNumberFormatterDecimalStyle;
//    NSNumber *myNumber = [format numberFromString:budget];
//    NSString *budgetString = [format stringFromNumber:myNumber];
//
//    self.budgetLabel.text = [NSString stringWithFormat:@"$%@", budgetString];
//
//}
@end
