//
//  TipCalculations.h
//  TipCalculator
//
//  Created by Jeffrey Ip on 2016-03-18.
//  Copyright © 2016 Jeffrey Ip. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TipCalculations : NSObject

-(NSString *)calculateTip:(NSString *)billAmountData usingPercent:(NSString *)percentTip;

@end
