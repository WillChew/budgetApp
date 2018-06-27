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
//    self.dateLabel.text = expense.date; // figure out how to use NSDateFormatter
//    self.amountLabel = expense.amount; // how would I assign NSDecimal to UILabel
    
    
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
