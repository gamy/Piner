//
//  CreateActivityController.m
//  Piner
//
//  Created by Gamy on 14-1-15.
//  Copyright (c) 2014年 Piner. All rights reserved.
//

#import "CreateActivityController.h"
#import "GCPlaceholderTextView.h"

@interface CreateActivityController ()<UITextFieldDelegate>
{
}

@property (weak, nonatomic) IBOutlet UIButton *placeButton;
@property (weak, nonatomic) IBOutlet UIButton *dateButton;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UIStepper *numberSteper;
@property (weak, nonatomic) IBOutlet GCPlaceholderTextView *noteTextView;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

- (IBAction)clickDateButton:(id)sender;
- (IBAction)clickPlaceButton:(id)sender;
- (IBAction)changeStep:(id)sender;
- (IBAction)changeDate:(id)sender;


@property(nonatomic, strong) Business *business;
@property(nonatomic, strong) Activity *activity;
@property(nonatomic, assign) PinType type;


@end

@implementation CreateActivityController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)setType:(PinType)type
{
    _type = type;
}

+ (NSString *)nibNameForType:(PinType)type
{
    switch (type) {
        case PinCater:
            return @"CreatePinCaterController";
        case PinTraffic:
            return @"CreatePinTrafficController";
        case PinTravel:
            return @"CreatePinTravelController";
        case PinHouse:
            return @"CreatePinHouseController";
            
        case PinKTV:
        case PinMovie:
        case PinShopping:
        default:
            return @"CreateActivityController";
    }
}

+ (instancetype)controllerWithType:(PinType)type
{
    NSString *nib = [self nibNameForType:type];
    CreateActivityController *cac = [[CreateActivityController alloc] initWithNibName:nib bundle:nil];
    cac.type = type;
    return cac;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickDateButton:(id)sender {
}

- (IBAction)clickPlaceButton:(id)sender {
}

- (IBAction)changeStep:(id)sender {
}

- (IBAction)changeDate:(id)sender {
}

@end
