//
//  CustomDatePickerView.m
//  MyCustomDatePIcker
//
//  Created by Ranosys on 16/03/17.
//  Copyright © 2017 Ranosys. All rights reserved.
//

#import "CustomDatePickerView.h"

@interface CustomDatePickerView() {
    int tagValue;
}

@end
@implementation CustomDatePickerView
@synthesize customPickerView,pickerView,toolBar;

#pragma mark - Initialized view
- (id)initWithFrame:(CGRect)frame delegate:(id)delegate {

    self=[super initWithFrame:frame];
    if (self) {

        _delegate=delegate;
        //Access pickerView xib
        [[NSBundle mainBundle] loadNibNamed:@"CustomDatePickerView" owner:self options:nil];
        customPickerView.frame=CGRectMake(0, 1000, [[UIScreen mainScreen] bounds].size.width, 260);
        pickerView.backgroundColor = [UIColor colorWithRed:(215.0/255.0) green:(215.0/255.0) blue:(215.0/255.0) alpha:1.0f];

        self.toolBar.translatesAutoresizingMaskIntoConstraints=YES;
        self.pickerView.translatesAutoresizingMaskIntoConstraints=YES;

        self.toolBar.frame=CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 44);
        self.pickerView.frame=CGRectMake(0, 44, [[UIScreen mainScreen] bounds].size.width, 216);
    }
    return self;
}
#pragma mark - end

#pragma mark - Hide/Show pickerView
- (void)showDatePickerViewType:(UIDatePickerMode)type minimumDate:(NSDate *)minimumDate selectedDate:(NSDate *)selectedDate option:(int)option {

    pickerView.datePickerMode=type;
    if (minimumDate) {
        [pickerView setMinimumDate:minimumDate];
    }
    else {
        [pickerView setMinimumDate:nil];
    }
    [pickerView setDate:selectedDate];
    tagValue=option;
    
    [UIView animateWithDuration:0.2f animations:^{
        //To Frame
        customPickerView.frame=CGRectMake(0, [[UIScreen mainScreen] bounds].size.height-260, [[UIScreen mainScreen] bounds].size.width, 260);

    } completion:^(BOOL completed) {

    }];
}

- (void)hideDatePickerView {

    [UIView animateWithDuration:0.2f animations:^{
        //To Frame
        customPickerView.frame=CGRectMake(0, 1000, [[UIScreen mainScreen] bounds].size.width, 260);

    } completion:^(BOOL completed) {
    }];
}
#pragma mark - end

#pragma mark - Toolbar button actions
- (IBAction)done:(UIBarButtonItem *)sender {

    [self hideDatePickerView];
    NSDate *date = pickerView.date;
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    [_delegate customDatePickerViewDelegateActionIndex:date selectedDateString:[dateFormat stringFromDate:date]  option:tagValue];
}

- (IBAction)cancel:(UIBarButtonItem *)sender {

    [self hideDatePickerView];
    [_delegate cancelDelegateMethod];
}
#pragma mark - end
@end

//Year
//y     2008        Year, no padding
//yy	08          Year, two digits (padding with a zero if necessary)
//yyyy	2008        Year, minimum of four digits (padding with zeros if necessary)
//
//Quarter
//Q     4               The quarter of the year. Use QQ if you want zero padding.
//QQQ	Q4              Quarter including "Q"
//QQQQ	4th quarter     Quarter spelled out
//
//Month
//M     12          The numeric month of the year. A single M will use '1' for January.
//MM	12          The numeric month of the year. A double M will use '01' for January.
//MMM	Dec         The shorthand name of the month
//MMMM	December	Full name of the month
//MMMMM	D           Narrow name of the month
//
//Day
//d     14                          The day of the month. A single d will use 1 for January 1st.
//dd	14                          The day of the month. A double d will use 01 for January 1st.
//F     3rd Tuesday in December     The day of week in the month
//E     Tues                        The day of week in the month
//EEEE	Tuesday                     The full name of the day
//EEEEE	T                           The narrow day of week
//
//Hour
//h     4       The 12-hour hour.
//hh	04      The 12-hour hour padding with a zero if there is only 1 digit
//H     16      The 24-hour hour.
//HH	16      The 24-hour hour padding with a zero if there is only 1 digit.
//a     PM      AM / PM for 12-hour time formats
//
//Minute
//m     35      The minute, with no padding for zeroes.
//mm	35      The minute with zero padding.
//
//Second
//s     8       The seconds, with no padding for zeroes.
//ss	08      The seconds with zero padding.
//
//Time Zone
//zzz	CST                         The 3 letter name of the time zone. Falls back to GMT-08:00 (hour offset) if the name is not known.
//zzzz	Central Standard Time       The expanded time zone name, falls back to GMT-08:00 (hour offset) if name is not known.
//zzzz	CST-06:00                   Time zone with abbreviation and offset
//Z	-   0600                        RFC 822 GMT format. Can also match a literal Z for Zulu (UTC) time.
//ZZZZZ	-06:00                      ISO 8601 time zone format


//Examples
//Thursday, Mar 16, 2017                EEEE, MMM d, yyyy
//03/16/2017                            MM/dd/yyyy
//03-16-2017 07:10                      MM-dd-yyyy HH:mm
//Mar 16, 7:10 AM                       MMM d, h:mm a
//March 2017                            MMMM yyyy
//Mar 16, 2017                          MMM d, yyyy
//Thu, 16 Mar 2017 07:10:48 +0000       E, d MMM yyyy HH:mm:ss Z
//2017-03-16T07:10:48+0000              yyyy-MM-dd'T'HH:mm:ssZ
//16.03.17                              dd.MM.yy
