//
//  TransactionTableViewCell.m
//  budgetApp
//
//  Created by Erik Goossens on 2018-06-27.
//  Copyright © 2018 Erik Goossens. All rights reserved.
//

#import "TransactionTableViewCell.h"

@interface TransactionTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *amountLabel;

@end

@implementation TransactionTableViewCell

-(void)configureCellWithExpense:(Expense *)expense {
    
    self.nameLabel.text = expense.name;
    
    self.descLabel.text = expense.desc;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    [dateFormatter stringFromDate:expense.date];
    self.dateLabel.text = [dateFormatter stringFromDate:expense.date];
    
    NSNumberFormatter *decimalFormatter = [[NSNumberFormatter alloc] init];
    [decimalFormatter setNumberStyle: NSNumberFormatterCurrencyStyle];
    self.amountLabel.text = [NSString stringWithFormat:@"-%@",[decimalFormatter stringFromNumber: expense.amount]];
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
