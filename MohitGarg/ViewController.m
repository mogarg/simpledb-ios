//
//  ViewController.m
//  MohitGarg
//
//  Created by Mohit Garg on 24/01/16.
//  Copyright © 2016 Virginia Tech. All rights reserved.
//

#import "ViewController.h"

#define creditsList @"0",@"1",@"2",@"3",@"4"
#define gradesList @"A",@"A-",@"B+",@"B",@"B-",@"C+",@"C",@"C-",@"F",@"S"
#define gradValueMapping @"A":@"4.0",@"A-":@"3.7",@"B+":@"3.3",@"B":@"3.0",@"B-":@"2.7",@"C+":@"2.3",@"C":@"2.0",@"C-":@"1.7",@"F":@"0",@"S":@"0"

@interface ViewController ()

@property (nonatomic,strong) NSMutableArray * listOfEntries;
@property (nonatomic,strong) SimpleDBWrapper * dbWrap;
@property (nonatomic,strong) NSArray * arrayForGrades;
@property (nonatomic,strong) NSArray * arrayForCredits;
@property (nonatomic,strong) UITextField *currentTextView;
@property (nonatomic,strong) NSNumber * finalGPA;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
   [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardFrameWillChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
    [self addDoneToolBarToKeyboard:self.courseName];
    
    _arrayForCredits = @[creditsList];
    _arrayForGrades = @[gradesList];
    
    _dbWrap =[SimpleDBWrapper sharedInstance];
    
    [_dbWrap createDomainWithName:@"ListOfItems"];
    
    [self getData];
}

-(void) getData{
    [_dbWrap selectQueryWithCompletion:^(NSArray *arr) {
        [self createDataSetFromArray:arr];
        [self calculateTotalGPA];
        dispatch_sync(dispatch_get_main_queue(), ^{
            [self.listOfGrades reloadData];
            _totalGPA.text = [NSString stringWithFormat:@"%@",_finalGPA];
        });
    }];
    
}

-(void) calculateTotalGPA{
    NSDictionary * gpaValueDict = @{gradValueMapping};
    
    float temp = 0;
    
    for (CourseObject* obj in self.listOfEntries) {
        temp = temp +([gpaValueDict[obj.gpa] floatValue] * [obj.credits floatValue]);
    }
    
    float denominator =[[self.listOfEntries valueForKeyPath:@"@sum.credits"] floatValue];
    
    float totalGPA = temp/denominator;
    
    _finalGPA = [NSNumber numberWithFloat:totalGPA];
}

-(void) createDataSetFromArray:(NSArray*)arr{
    
    NSMutableArray * tempArray =[NSMutableArray new];
    
    for (AWSSimpleDBItem *item in arr) {
        CourseObject * obj = [CourseObject new];
        obj.courseName = item.name;
        
        NSArray * attributesArray = item.attributes;
        
        obj.gpa = ((AWSSimpleDBAttribute*)attributesArray[1]).value;
        obj.credits = ((AWSSimpleDBAttribute*)attributesArray[0]).value;
        
        [tempArray addObject:obj];
    }
    
    self.listOfEntries = tempArray;
}

#pragma mark - "Add Course"
- (IBAction)addCourse:(id)sender {
    AWSSimpleDBReplaceableAttribute * gpaAttribute = [[AWSSimpleDBReplaceableAttribute alloc] init];
    gpaAttribute.name = @"GPA";
    gpaAttribute.value = [_arrayForGrades objectAtIndex: [_gradePicker selectedRowInComponent:0]];
    
    AWSSimpleDBReplaceableAttribute * creditsAttribute = [[AWSSimpleDBReplaceableAttribute alloc] init];
    creditsAttribute.name = @"Credits";
    creditsAttribute.value = [_arrayForCredits objectAtIndex:[_creditPicker selectedRowInComponent:0]];
    
    __weak typeof(self) weakSelf = self;
    [_dbWrap addAttributes:@[gpaAttribute,creditsAttribute] itemName:_courseName.text completion:^(NSArray *arr) {
        [weakSelf getData];
    }];
}

#pragma mark - "Table View Data Source"
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CourseCell * cell = (CourseCell*)[tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    CourseObject * obj = [self.listOfEntries objectAtIndex:indexPath.row];
    
    cell.courseLabel.text = obj.courseName;
    cell.gradeLabel.text = obj.gpa;
    cell.creditsLabel.text = obj.credits;
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.listOfEntries.count;
}

#pragma mark - "Table View Data Delegate"
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        CourseCell * cell = [tableView cellForRowAtIndexPath:indexPath];
        
        [self.listOfEntries removeObjectAtIndex:indexPath.row];
        [self calculateTotalGPA];
        
        [self.dbWrap deleteAttribute:@[] itemName:cell.courseLabel.text completion:^(NSArray *arr) {
            dispatch_sync(dispatch_get_main_queue(), ^{
                 _totalGPA.text = [NSString stringWithFormat:@"%@",_finalGPA];
                [tableView reloadData];
            });
        }];
    }
}

#pragma mark - "Picker View Data Delegate"
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (pickerView == _gradePicker) {
        return [_arrayForGrades objectAtIndex:row];
    }else if(pickerView == _creditPicker) {
        return [_arrayForCredits objectAtIndex:row];
    }
     else return @"";
}

#pragma mark - "Picker View Data Source"
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    if (pickerView == _gradePicker) {
        return _arrayForGrades.count;
    }else if(pickerView == _creditPicker) {
        return _arrayForCredits.count;
    }
    else return 0;
}


-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

#pragma mark - "TextField Keyboard Boiler Plate"
- (void)keyboardFrameWillChange:(NSNotification *)notification
{
    CGRect keyboardEndFrame = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGRect keyboardBeginFrame = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    UIViewAnimationCurve animationCurve = [[[notification userInfo] objectForKey:UIKeyboardAnimationCurveUserInfoKey] integerValue];
    NSTimeInterval animationDuration = [[[notification userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] integerValue];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:animationDuration];
    [UIView setAnimationCurve:animationCurve];
    
    CGRect newFrame = self.view.frame;
    CGRect keyboardFrameEnd = [self.view convertRect:keyboardEndFrame toView:nil];
    CGRect keyboardFrameBegin = [self.view convertRect:keyboardBeginFrame toView:nil];
    
    newFrame.origin.y -= (keyboardFrameBegin.origin.y - keyboardFrameEnd.origin.y);
    self.view.frame = newFrame;
    
    [UIView commitAnimations];
}

-(void)addDoneToolBarToKeyboard:(UITextField *)textView
{
    UIToolbar* doneToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    doneToolbar.barStyle = UIBarStyleDefault;
    doneToolbar.items = [NSArray arrayWithObjects:
                         [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                         [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneButtonClickedDismissKeyboard)],
                         nil];
    [doneToolbar sizeToFit];
    textView.inputAccessoryView = doneToolbar;
}

- (void)textViewDidBeginEditing:(UITextField *)textView
{
    _currentTextView = textView;
}

-(void)doneButtonClickedDismissKeyboard
{
    [self.view endEditing:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
