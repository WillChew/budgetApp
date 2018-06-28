//
//  AddTransactionViewController.m
//  budgetApp
//
//  Created by Will Chew on 2018-06-27.
//  Copyright © 2018 Erik Goossens. All rights reserved.
//

#import "AddTransactionViewController.h"
#import "TransactionTableViewCell.h"
#import "Expense.h"

@interface AddTransactionViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *amountTextField;
@property (weak, nonatomic) IBOutlet UITextField *sectionTextField;
@property (weak, nonatomic) IBOutlet UITextField *dateTextField;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTextField;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *amountLabel;
@property (weak, nonatomic) IBOutlet UILabel *sectionLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@property (nonatomic) NSDate *date;
@end

@implementation AddTransactionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupKeyboards];
    // Do any additional setup after loading the view.
   
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(viewTapped:)];
     [self.view addGestureRecognizer:tapGesture];
}

-(void)viewTapped:(UITapGestureRecognizer*)sender {
    [self.view endEditing:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupKeyboards {
    UIDatePicker *datepicker = [[UIDatePicker alloc]init];
    [datepicker setDate:[NSDate date]];
 
    [datepicker addTarget:self action:@selector(updateTextField:) forControlEvents:UIControlEventValueChanged];
    [self.dateTextField setInputView:datepicker];
    
    self.amountTextField.keyboardType = UIKeyboardTypeDecimalPad;
    
}

-(void)updateTextField:(id)sender {
    UIDatePicker *picker = (UIDatePicker*)self.dateTextField.inputView;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    [dateFormatter stringFromDate:picker.date];
    NSString *date = [dateFormatter stringFromDate:picker.date];
    NSLog(@"%@", date);
//    NSDate *date2 = [dateFormatter dateFromString:date];
    self.date = [dateFormatter dateFromString:date];
    

}
- (IBAction)submitButtonPressed:(UIButton *)sender {
   
    NSNumberFormatter *format = [[NSNumberFormatter alloc]init];
    format.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber *amountNumber = [format numberFromString:self.amountTextField.text];
    NSString *amountString = [format stringFromNumber:amountNumber];
    NSLog(@"1. %@", amountString);
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
    
    
//    self.amountTextField.text
//    Expense *newExpense = [[Expense alloc]initWithName:self.nameTextField.text amount:decimalAmount description:self.descriptionTextField.text date:self.date];
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
