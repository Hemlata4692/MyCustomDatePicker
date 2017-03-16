//
//  CustomDatePickerView.h
//  MyCustomDatePIcker
//
//  Created by Ranosys on 16/03/17.
//  Copyright © 2017 Ranosys. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomDatePickerViewDelegate <NSObject>
@optional
- (void)customDatePickerViewDelegateActionIndex:(NSDate *)selectedDate selectedDateString:(NSString *)selectedDateString option:(int)option;
- (void)cancelDelegateMethod;
@end

@interface CustomDatePickerView : UIView{
    id <CustomDatePickerViewDelegate> _delegate;
}

@property (strong, nonatomic) IBOutlet UIView *customPickerView;
@property (weak, nonatomic) IBOutlet UIToolbar *toolBar;
@property (weak, nonatomic) IBOutlet UIDatePicker *pickerView;
@property (nonatomic,strong) id delegate;
- (id)initWithFrame:(CGRect)frame delegate:(id)delegate;
- (void)showDatePickerViewType:(UIDatePickerMode)type minimumDate:(NSDate *)minimumDate selectedDate:(NSDate *)selectedDate option:(int)option;
@end
