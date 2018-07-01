//
//  ViewController.h
//  budgetApp
//
//  Created by Erik Goossens on 2018-06-27.
//  Copyright © 2018 Erik Goossens. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataHelper.h"
#import "XYPieChart.h"


@interface ViewController : UIViewController <XYPieChartDelegate,XYPieChartDataSource>
@property (weak, nonatomic) IBOutlet UILabel *budgetLabel;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *configureButton;
@property (nonatomic) DataHelper *dataHelper;
@property (weak, nonatomic) IBOutlet XYPieChart *pieView;
@property (nonatomic,strong) NSArray *slices;
@property (nonatomic,strong) NSArray *sliceColors;
@property (nonatomic,strong) NSArray *sliceLabelTitles;
@property (weak, nonatomic) IBOutlet UILabel *foodLabel;
@property (weak, nonatomic) IBOutlet UILabel *utilityLabel;
@property (weak, nonatomic) IBOutlet UILabel *entertainmentLabel;
@property (weak, nonatomic) IBOutlet UILabel *transportationLabel;
@property (weak, nonatomic) IBOutlet UILabel *miscellaneousLabel;
@property (weak, nonatomic) IBOutlet UILabel *legendLabel;

@end

