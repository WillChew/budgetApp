//
//  Expenses.h
//  budgetApp
//
//  Created by Will Chew on 2018-06-27.
//  Copyright © 2018 Erik Goossens. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Expenses : NSObject

@property (nonatomic,copy) NSString *name;
@property (nonatomic)  NSNumber *amount;
@property (nonatomic,copy) NSString *desc;
@property (nonatomic) NSDate *date;

-(instancetype)initWithName:(NSString*)name amount:(NSNumber*)amount description:(NSString*)desc date:(NSDate*)date;

@end