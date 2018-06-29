//
//  ViewController.h
//  budgetApp
//
//  Created by Erik Goossens on 2018-06-27.
//  Copyright © 2018 Erik Goossens. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataHelper.h"


@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *budgetLabel;
@property (nonatomic) DataHelper *dataHelper;

@end

