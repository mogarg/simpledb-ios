//
//  ViewController.h
//  MohitGarg
//
//  Created by Mohit Garg on 24/01/16.
//  Copyright © 2016 Virginia Tech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SimpleDBWrapper.h"
#import "CourseObject.h"
#import "CourseCell.h"
@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIPickerViewDataSource,UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *listOfGrades;

@property (weak, nonatomic) IBOutlet UIPickerView *gradePicker;
@property (weak, nonatomic) IBOutlet UIPickerView *creditPicker;
@property (weak, nonatomic) IBOutlet UITextField *courseName;
@property (weak, nonatomic) IBOutlet UILabel *totalGPA;
@end

