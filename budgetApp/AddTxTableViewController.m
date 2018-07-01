//
//  AddTxTableViewController.m
//  budgetApp
//
//  Created by Will Chew on 2018-06-28.
//  Copyright © 2018 Erik Goossens. All rights reserved.
//

#import "AddTxTableViewController.h"
#import "Expense.h"
#import "Chameleon.h"

@interface AddTxTableViewController () <UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *amountTextField;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTextField;
@property (weak, nonatomic) IBOutlet UITextField *dateTextField;
@property (weak, nonatomic) IBOutlet UITextField *sectionTextField;
@property (nonatomic) NSDate *date;
@property (nonatomic,strong) NSArray *arrayOfSectionNames;


@end

@implementation AddTxTableViewController
    
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithGradientStyle:UIGradientStyleTopToBottom withFrame:self.view.bounds andColors:@[[UIColor flatGrayColor], [UIColor flatBlackColor]]];
    [self setupKeyboards];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(viewTapped:)];
    [self.view addGestureRecognizer:tapGesture];
    
}
    -(void)viewTapped:(UITapGestureRecognizer*)sender {
        [self.view endEditing:YES];
        
    }
    
    -(void)setupKeyboards {
        UIDatePicker *datepicker = [[UIDatePicker alloc]init];
        [datepicker setDate:[NSDate date]];
        
        [datepicker addTarget:self action:@selector(updateTextField:) forControlEvents:UIControlEventValueChanged];
        [self.dateTextField setInputView:datepicker];
        
        self.amountTextField.keyboardType = UIKeyboardTypeDecimalPad;
        
        
        self.arrayOfSectionNames = @[@"Food", @"Entertainment", @"Transportation", @"Utility", @"Miscellaneous"];
        UIPickerView *pickerView = [[UIPickerView alloc]init];
        pickerView.delegate = self;
        self.sectionTextField.inputView = pickerView;
        
    }
    -(void)updateTextField:(id)sender {
        UIDatePicker *picker = (UIDatePicker*)self.dateTextField.inputView;
        self.date = picker.date;
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
        [dateFormatter setDateFormat:@"dd-MM-yyyy"];
        [dateFormatter stringFromDate:self.date];
        NSString *date = [dateFormatter stringFromDate:self.date];
        self.date = [dateFormatter dateFromString:date];
        self.dateTextField.text = date;
        
        
    }

    
#pragma mark - Table view data source
    
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}
    
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 6;
}
- (IBAction)cancelButtonPressed:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)submitButton:(id)sender {
    
    NSNumberFormatter *format = [[NSNumberFormatter alloc]init];
    format.numberStyle = NSNumberFormatterDecimalStyle;
    if ([self.amountTextField.text isEqualToString: @""]) {
        self.amountTextField.text = @"0";
    }
    NSNumber *amountNumber = [format numberFromString:self.amountTextField.text];
  
    if (self.sectionTextField.text.length == 0 ) {
        self.sectionTextField.text = @"Miscellaneous";
    }
    
    NSString *amountString = [format stringFromNumber:amountNumber];
    NSDecimalNumber *numberDecimal = [NSDecimalNumber decimalNumberWithString:amountString];
    

    
    
    Expense *newExpense = [[Expense alloc]initWithName:self.nameTextField.text amount:numberDecimal description:self.descriptionTextField.text date:self.date];
    NSLog(@"%@", newExpense.date);
    [self.dataHelper saveExpense:newExpense withSection:self.sectionTextField.text];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (NSInteger)numberOfComponentsInPickerView:(nonnull UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(nonnull UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.arrayOfSectionNames.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return self.arrayOfSectionNames[row];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (self.sectionTextField.text != self.sectionTextField.text ) {
        self.sectionTextField.text = @"Miscellaneous";
    } else {
    self.sectionTextField.text = self.arrayOfSectionNames[row];
}
}



@end
