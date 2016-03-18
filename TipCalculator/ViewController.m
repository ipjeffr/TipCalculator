//
//  ViewController.m
//  TipCalculator
//
//  Created by Jeffrey Ip on 2016-03-18.
//  Copyright © 2016 Jeffrey Ip. All rights reserved.
//

#import "ViewController.h"
#import "TipCalculations.h"

@interface ViewController ()

@property (nonatomic, strong) TipCalculations *tipCalculations;

//declare properties for visibility across all methods in a class
@property (nonatomic, strong) UITextField *billAmountTextField;
@property (nonatomic, strong) UITextField *tipPercentageTextField;
@property (nonatomic, strong) UILabel *tipAmountLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    //Title
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(40, 80, 300, 50)];
    title.text = @"TIP CALCULATOR";
    title.textAlignment = NSTextAlignmentCenter;
    title.backgroundColor = [UIColor clearColor];
    title.font = [UIFont systemFontOfSize:30];
    title.textColor = [UIColor whiteColor];
    [self.view addSubview:title];
    
    //description for bill amount input
    UILabel *billAmountDescription = [[UILabel alloc]initWithFrame:CGRectMake(30, 200, 150, 50)];
    billAmountDescription.text = @"Bill Amount: $";
    billAmountDescription.textAlignment = NSTextAlignmentRight;
    billAmountDescription.backgroundColor = [UIColor clearColor];
    billAmountDescription.textColor = [UIColor whiteColor];
    [self.view addSubview:billAmountDescription];
    
//create/initialize TipCalculations object
    
    self.tipCalculations = [[TipCalculations alloc] init];

//create input field for bill amount input field
    self.billAmountTextField = [[UITextField alloc] initWithFrame:CGRectMake(200, 200, 150, 50)];
    self.billAmountTextField.backgroundColor = [UIColor whiteColor];
    self.billAmountTextField.text = @"0.00";
    self.billAmountTextField.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.billAmountTextField];
    
//create button that calculated the tip amount
    UIButton *calculateTipButton = [[UIButton alloc] initWithFrame:CGRectMake(150, 400, 150, 50)];
    calculateTipButton.backgroundColor = [UIColor blueColor];
    [calculateTipButton setTitle:@"Calculate Tip" forState:UIControlStateNormal];
    
    //buttons will use itself as first parameter when pressed, define a method for buttonPressed, and have the logic there
    [calculateTipButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:calculateTipButton];
    
    //description for tip amount calculated
    UILabel *tipAmountCalculated = [[UILabel alloc] initWithFrame:CGRectMake(30, 500, 150, 50)];
    tipAmountCalculated.text = @"Tip Amount: $";
    tipAmountCalculated.textAlignment = NSTextAlignmentRight;
    tipAmountCalculated.backgroundColor = [UIColor clearColor];
    tipAmountCalculated.textColor = [UIColor whiteColor];
    [self.view addSubview:tipAmountCalculated];
    
//create output field to show tip amount
    self.tipAmountLabel = [[UILabel alloc] initWithFrame:CGRectMake(200, 500, 150, 50)];
    self.tipAmountLabel.backgroundColor = [UIColor orangeColor];
    self.tipAmountLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.tipAmountLabel];

    
    //description for tip amount input
    UILabel *tipAmountDesription = [[UILabel alloc]initWithFrame:CGRectMake(320, 300, 150, 50)];
    tipAmountDesription.text = @"% to tip";
    tipAmountDesription.textAlignment = NSTextAlignmentLeft;
    tipAmountDesription.backgroundColor = [UIColor clearColor];
    tipAmountDesription.textColor = [UIColor whiteColor];
    [self.view addSubview:tipAmountDesription];

    
//create input field to input alternative tip percentage
    self.tipPercentageTextField = [[UITextField alloc] initWithFrame:CGRectMake(200, 300, 100, 50)];
    self.tipPercentageTextField.backgroundColor = [UIColor whiteColor];
    self.tipPercentageTextField.text = @"15";
    self.tipPercentageTextField.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.tipPercentageTextField];
    
}

- (void)buttonPressed:(UIButton*)sender {
    
    NSString *tipOutput = [self.tipCalculations calculateTip:self.billAmountTextField.text usingPercent:self.tipPercentageTextField.text];
    
    self.tipAmountLabel.text = [NSString stringWithFormat:@"%@", tipOutput];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
