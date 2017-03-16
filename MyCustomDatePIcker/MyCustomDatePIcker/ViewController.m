//
//  ViewController.m
//  MyCustomDatePIcker
//
//  Created by Ranosys on 16/03/17.
//  Copyright © 2017 Ranosys. All rights reserved.
//

#import "ViewController.h"
#import "CustomDatePickerView.h"

@interface ViewController ()<CustomDatePickerViewDelegate> {

    CustomDatePickerView *CDPVobj;
    NSDate *selecteDateValue,*selecteTimeValue,*selecteDateTimeValue;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
    selecteDateValue=[NSDate date];
    selecteTimeValue=[NSDate date];
    selecteDateTimeValue=[NSDate date];
    CDPVobj=[[CustomDatePickerView alloc] initWithFrame:self.view.frame delegate:self];
    [self.view addSubview:CDPVobj.customPickerView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)showDatePicker:(UIButton *)sender {
    
    [CDPVobj showDatePickerViewType:UIDatePickerModeDate minimumDate:[NSDate date] selectedDate:selecteDateValue option:1];
}

- (IBAction)showTImePicker:(UIButton *)sender {
    
    [CDPVobj showDatePickerViewType:UIDatePickerModeTime minimumDate:nil selectedDate:selecteTimeValue option:2];
}

- (IBAction)showDateTimePicker:(UIButton *)sender {
    
    [CDPVobj showDatePickerViewType:UIDatePickerModeDateAndTime minimumDate:nil selectedDate:selecteDateTimeValue option:3];
}

//#pragma mark - Custom picker delegate method
- (void)customDatePickerViewDelegateActionIndex:(NSDate *)selectedDate selectedDateString:(NSString *)selectedDateString option:(int)option {

    NSLog(@"%@",selectedDateString);
    if (option==1) {
        selecteDateValue=selectedDate;
    }
    else if (option==2) {
        selecteTimeValue=selectedDate;
    }
    else if (option==3) {
        selecteDateTimeValue=selectedDate;
    }
}

- (void)cancelDelegateMethod {

    NSLog(@"cancel");

}
//#pragma mark - end
@end
