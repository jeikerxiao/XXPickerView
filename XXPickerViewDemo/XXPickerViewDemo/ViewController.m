//
//  ViewController.m
//  XXPickerViewDemo
//
//  Created by xiao on 17/1/11.
//  Copyright © 2017年 jeikerxiao. All rights reserved.
//

#import "ViewController.h"
#import "XXPickerView.h"

@interface ViewController ()<XXPickerViewDelegate>

@property (nonatomic, weak) IBOutlet UIButton *buttonSingle;
@property (nonatomic, weak) IBOutlet UIButton *buttonDouble;
@property (nonatomic, weak) IBOutlet UIButton *buttonTriple;
@property (nonatomic, weak) IBOutlet UIButton *buttonRange;
@property (nonatomic, weak) IBOutlet UIButton *buttonTripleSize;
@property (nonatomic, weak) IBOutlet UIButton *buttonDate;
@property (nonatomic, weak) IBOutlet UIButton *buttonDateTime;
@property (nonatomic, weak) IBOutlet UIButton *buttonTime;

@end

@implementation ViewController

#pragma mark - 选择器

- (IBAction)onePickerViewClicked:(UIButton *)sender
{
    XXPickerView *picker = [[XXPickerView alloc] initWithTitle:@"1列选择器" delegate:self];
    picker.titleFont = [UIFont systemFontOfSize:12];
    picker.titleColor = [UIColor redColor];
    [picker setBackgroundColor:[UIColor whiteColor]];
    [picker setTag:1];
    [picker setTitlesForComponents:@[@[@"河北省", @"广东省", @"湖南省", @"湖北省", @"四川省"]]];
    [picker selectIndexes:@[@2] animated:YES];
    [picker show];
}

- (IBAction)twoPickerViewClicked:(UIButton *)sender {
    XXPickerView *picker = [[XXPickerView alloc] initWithTitle:@"2列选择器" delegate:self];
    [picker setTag:2];
    [picker setTitlesForComponents:@[@[@"河北省", @"广东省", @"湖南省", @"湖北省", @"四川省"],
                                     @[@"汉族", @"蒙古族", @"回族", @"藏族", @"维吾尔族"]]];
    [picker selectIndexes:@[@2,@3] animated:YES];
    [picker show];
}

- (IBAction)threePickerViewClicked:(UIButton *)sender {
    XXPickerView *picker = [[XXPickerView alloc] initWithTitle:@"3列选择器" delegate:self];
    [picker setTag:3];
    [picker setTitlesForComponents:@[@[@"河北省", @"广东省", @"湖南省", @"湖北省", @"四川省"],
                                     @[@"汉族", @"蒙古族", @"回族", @"藏族", @"维吾尔族"],
                                     @[@"黄瓜",@"茄子",@"菜豆",@"毛豆", @"芦笋"]]];
    [picker selectIndexes:@[@2,@3,@4] animated:YES];
    [picker show];
}

- (IBAction)rangeSelectClicked:(UIButton *)sender {
    XXPickerView *picker = [[XXPickerView alloc] initWithTitle:@"范围选择器" delegate:self];
    [picker setTag:4];
    [picker setBackgroundColor:[UIColor grayColor]];
    [picker setIsRangePickerView:YES];
    [picker setTitlesForComponents:@[@[@"100", @"200", @"300", @"400", @"500",@"600", @"700", @"800", @"900"],
                                     @[@"到"],
                                     @[@"200", @"300", @"400", @"500",@"600", @"700", @"800", @"900",@"1000"]]];
    [picker show];
}

- (IBAction)threePickerViewWithWidths:(UIButton *)sender {
    XXPickerView *picker = [[XXPickerView alloc] initWithTitle:@"宽度范围选择器" delegate:self];
    [picker setTag:5];
    [picker setIsRangePickerView:YES];
    [picker setTitlesForComponents:@[@[@"100", @"200", @"300", @"400", @"500",@"600", @"700", @"800", @"900"],
                                     @[@"到"],
                                     @[@"200", @"300", @"400", @"500",@"600", @"700", @"800", @"900",@"1000"]]];
    [picker setWidthsForComponents:@[@120.0f,
                                     @60.0f,
                                     @120.0f]];
    [picker show];
}

- (IBAction)datePickerViewClicked:(UIButton *)sender
{
    XXPickerView *picker = [[XXPickerView alloc] initWithTitle:@"日期选择器" delegate:self];
    [picker setTag:6];
    [picker setPickerStyle:XXPickerStyleDatePicker];
    [picker setBackgroundColor:[UIColor lightGrayColor]];
    [picker show];
}

- (IBAction)dateTimePickerViewClicked:(UIButton *)sender
{
    XXPickerView *picker = [[XXPickerView alloc] initWithTitle:@"日期/时间选择器" delegate:self];
    [picker setTag:7];
    [picker setPickerStyle:XXPickerStyleDateTimePicker];
    [picker show];
}

- (IBAction)timePickerViewClicked:(UIButton *)sender
{
    XXPickerView *picker = [[XXPickerView alloc] initWithTitle:@"时间选择器" delegate:self];
    [picker setTag:8];
    [picker setPickerStyle:XXPickerStyleTimePicker];
    [picker show];
}

#pragma mark - XXPickerView Delegate

-(void)xxPickerView:(XXPickerView *)pickerView didSelectTitles:(NSArray *)titles selectedRows:(NSArray *)rows
{
    switch (pickerView.tag)
    {
        case 1:
            [_buttonSingle setTitle:[titles componentsJoinedByString:@" - "] forState:UIControlStateNormal];
            NSLog(@"选择的各滚轮行号%@",rows);
            break;
        case 2:
            [_buttonDouble setTitle:[titles componentsJoinedByString:@" - "] forState:UIControlStateNormal];
            NSLog(@"选择的各滚轮行号%@",rows);
            break;
        case 3:
            [_buttonTriple setTitle:[titles componentsJoinedByString:@" - "] forState:UIControlStateNormal];
            NSLog(@"选择的各滚轮行号%@",rows);
            break;
        case 4:
            [_buttonRange setTitle:[titles componentsJoinedByString:@" - "] forState:UIControlStateNormal];
            NSLog(@"选择的各滚轮行号%@",rows);
            break;
        case 5:
            [_buttonTripleSize setTitle:[titles componentsJoinedByString:@" - "] forState:UIControlStateNormal];
            NSLog(@"选择的各滚轮行号%@",rows);
            break;
            
        default:
            break;
    }
    
    
}

-(void)xxPickerView:(XXPickerView *)pickerView didSelectDate:(NSDate *)date
{
    switch (pickerView.tag)
    {
        case 6:
        {
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"]];
            [formatter setDateStyle:NSDateFormatterMediumStyle];
            [formatter setTimeStyle:NSDateFormatterNoStyle];
            [_buttonDate setTitle:[formatter stringFromDate:date] forState:UIControlStateNormal];
        }
            break;
        case 7:
        {
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"]];
            [formatter setDateStyle:NSDateFormatterMediumStyle];
            [formatter setTimeStyle:NSDateFormatterShortStyle];
            [_buttonDateTime setTitle:[formatter stringFromDate:date] forState:UIControlStateNormal];
        }
            break;
        case 8:
        {
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"]];
            [formatter setDateStyle:NSDateFormatterNoStyle];
            [formatter setTimeStyle:NSDateFormatterShortStyle];
            [_buttonTime setTitle:[formatter stringFromDate:date] forState:UIControlStateNormal];
        }
            break;
            
        default:
            break;
    }
}



@end
