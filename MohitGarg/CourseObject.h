//
//  CourseObject.h
//  MohitGarg
//
//  Created by Mohit Garg on 25/01/16.
//  Copyright © 2016 Virginia Tech. All rights reserved.
//

#import <Foundation/Foundation.h>

/** This is a model object which can be mapped to a single row of data in the SimpleDB domain. Since SimpleDB is non relational we can write a dynamic mapper which can map any additional attributes added to automatically create properties on the CourseObject**/
@interface CourseObject : NSObject
@property (nonatomic,strong) NSString * courseName;
@property (nonatomic) NSString * gpa;
@property (nonatomic,strong) NSString * credits;
@end
