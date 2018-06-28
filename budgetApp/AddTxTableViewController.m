//
//  AddTxTableViewController.m
//  budgetApp
//
//  Created by Will Chew on 2018-06-28.
//  Copyright © 2018 Erik Goossens. All rights reserved.
//

#import "AddTxTableViewController.h"
#import "Expense.h"

@interface AddTxTableViewController ()
    @property (weak, nonatomic) IBOutlet UITextField *nameTextField;
    @property (weak, nonatomic) IBOutlet UITextField *amountTextField;
    @property (weak, nonatomic) IBOutlet UITextField *descriptionTextField;
    @property (weak, nonatomic) IBOutlet UITextField *dateTextField;
    @property (weak, nonatomic) IBOutlet UITextField *sectionTextField;
    @property (nonatomic) NSDate *date;
    
    
    @end

@implementation AddTxTableViewController
    
- (void)viewDidLoad {
    [super viewDidLoad];
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
    
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
    
#pragma mark - Table view data source
    
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}
    
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 5;
}
    
    
    
- (IBAction)submitButton:(id)sender {
    NSLog(@"%@", self.dateTextField.description);
    NSNumberFormatter *format = [[NSNumberFormatter alloc]init];
    format.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber *amountNumber = [format numberFromString:self.amountTextField.text];
    NSString *amountString = [format stringFromNumber:amountNumber];
    NSDecimalNumber *numberDecimal = [NSDecimalNumber decimalNumberWithString:amountString];
    
    NSLog(@"%@", self.date);
    
    Expense *newExpense = [[Expense alloc]initWithName:self.nameTextField.text amount:numberDecimal description:self.descriptionTextField.text date:self.date];
    NSLog(@"%@", newExpense.date);
    [self dismissViewControllerAnimated:YES completion:nil];
}
    
    //- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //
    //    UITableViewCell *aCell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
    //
    //
    //    return aCell;
    //}
    
    
    /*
     // Override to support conditional editing of the table view.
     - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
     // Return NO if you do not want the specified item to be editable.
     return YES;
     }
     */
    
    /*
     // Override to support editing the table view.
     - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
     if (editingStyle == UITableViewCellEditingStyleDelete) {
     // Delete the row from the data source
     [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
     } else if (editingStyle == UITableViewCellEditingStyleInsert) {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
     // Return NO if you do not want the item to be re-orderable.
     return YES;
     }
     */
    
    /*
     #pragma mark - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     // Get the new view controller using [segue destinationViewController].
     // Pass the selected object to the new view controller.
     }
     */
    
    
    
    @end
