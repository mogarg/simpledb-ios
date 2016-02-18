//
//  CourseCell.h
//  MohitGarg
//
//  Created by Mohit Garg on 25/01/16.
//  Copyright © 2016 Virginia Tech. All rights reserved.
//

#import <UIKit/UIKit.h>

/**This class represents a single table cell which has three labels corresponding to the three columns**/
@interface CourseCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *courseLabel;
@property (weak, nonatomic) IBOutlet UILabel *gradeLabel;
@property (weak, nonatomic) IBOutlet UILabel *creditsLabel;
@end
