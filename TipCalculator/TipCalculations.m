//
//  TipCalculations.m
//  TipCalculator
//
//  Created by Jeffrey Ip on 2016-03-18.
//  Copyright © 2016 Jeffrey Ip. All rights reserved.
//

#import "TipCalculations.h"

@implementation TipCalculations

-(NSString *)calculateTip:(NSString *)billAmountData usingPercent:(NSString *)percentTip {
    
//grab the float value of the billAmount from the text field, calculate the tip amount, convert it back to string for output
    
    float billAmountFloat = [billAmountData floatValue];
    float percentTipFloat = [percentTip floatValue];
    
    float billAmountTotal = billAmountFloat * (percentTipFloat / 100);
    
    return [NSString stringWithFormat:@"%0.2f", billAmountTotal];
    
}

@end
