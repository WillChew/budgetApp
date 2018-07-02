//
//  ViewController.m
//  budgetApp
//
//  Created by Erik Goossens on 2018-06-27.
//  Copyright © 2018 Erik Goossens. All rights reserved.
//

#import "ViewController.h"
#import "ConfigureBudgetViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "Chameleon.h"



@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithGradientStyle:UIGradientStyleTopToBottom withFrame:self.view.bounds andColors:@[[UIColor flatBlackColor], [UIColor flatBlackColorDark]]];
    self.foodLabel.textColor = [UIColor flatPurpleColor];
    self.utilityLabel.textColor = [UIColor flatTealColor];
    self.entertainmentLabel.textColor = [UIColor flatGreenColor];
    self.transportationLabel.textColor = [UIColor flatBlueColorDark];
    self.miscellaneousLabel.textColor = [UIColor flatSkyBlueColor];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.budgetLabel.text = [NSString stringWithFormat:@"$%@",[self.dataHelper budgetRemaining]];
    [self setupPie];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.pieView reloadData];
}

- (void)setDataHelper:(DataHelper *)dataHelper {
    
    _dataHelper = dataHelper;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ConfigureSegue"]) {
        ConfigureBudgetViewController *cvc = segue.destinationViewController;
        cvc.dataHelper = self.dataHelper;
        self.navigationController.navigationBar.hidden = YES;
        
        
    }
}
- (IBAction)resetButtonPressed:(id)sender {
    [self.dataHelper reset];
    self.budgetLabel.text = @"Enter Your Budget";
    [self performSegueWithIdentifier:@"ConfigureSegue" sender:self];
}

- (IBAction)configureButtonPressed:(id)sender {
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    }


- (IBAction)unwindToMainMenu:(UIStoryboardSegue *)unwindSegue {
    if([unwindSegue.sourceViewController isKindOfClass:[ConfigureBudgetViewController class]]) {
        self.navigationController.navigationBar.hidden = NO;
    }
}

#pragma mark - XYPieChart DataSource 

-(NSUInteger)numberOfSlicesInPieChart:(XYPieChart *)pieChart {
    return self.slices.count;
}

-(CGFloat)pieChart:(XYPieChart *)pieChart valueForSliceAtIndex:(NSUInteger)index {
    CGFloat value = 0.0;
    
    if ([self.dataHelper totalExpenses] == 0 ) {
        value = 0;
        return value;
        
    } else {
        value = ([[self.slices objectAtIndex:index] integerValue]/ [self.dataHelper totalExpenses]);
    }
    return value;
}

-(UIColor *)pieChart:(XYPieChart *)pieChart colorForSliceAtIndex:(NSUInteger)index {
  return [self.sliceColors objectAtIndex:(index % self.sliceColors.count)];
}



-(void)setupPie{
    float budgetRemaining = [self.dataHelper budgetRemaining].floatValue/[self.dataHelper getBudget] * 100;
    self.slices = [[NSArray alloc]initWithObjects:@([self.dataHelper sectionExpenseTotal:@"Food"]), @([self.dataHelper sectionExpenseTotal:@"Entertainment"]), @([self.dataHelper sectionExpenseTotal:@"Utility"]), @([self.dataHelper sectionExpenseTotal:@"Transportation"]), @([self.dataHelper sectionExpenseTotal:@"Miscellaneous"]), nil];

    self.sliceColors = [[NSArray alloc]initWithObjects:UIColor.flatPurpleColor, UIColor.flatTealColor, UIColor.flatGreenColor, UIColor.flatBlueColor, UIColor.flatSkyBlueColor, UIColor.redColor, nil];
    
    self.sliceLabelTitles = @[@"Food",@"Entertainment", @"Utility", @"Transportation", @"Miscellaneous"];
    
    self.pieView.delegate = self;
    self.pieView.dataSource = self;
    
    float viewWidth = self.pieView.bounds.size.width / 2;
    float viewHeight = self.pieView.bounds.size.height / 2;
    
    [self.pieView setStartPieAngle:M_PI_2];
    [self.pieView setAnimationSpeed:1.5];
    [self.pieView setLabelColor:[UIColor whiteColor]];
    [self.pieView setLabelShadowColor:[UIColor blackColor]];
    [self.pieView setShowLabel:YES];
    [self.pieView setLabelFont:[UIFont systemFontOfSize:20]];
    [self.pieView setShowPercentage:YES];
    [self.pieView setPieBackgroundColor:[UIColor clearColor]];
    
    [self.pieView setPieCenter:CGPointMake(self.pieView.bounds.origin.x + viewWidth, self.pieView.bounds.origin.y + viewHeight)];
    [self.pieView reloadData];
}


@end
