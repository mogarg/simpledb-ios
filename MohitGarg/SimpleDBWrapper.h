//
//  SimpleDBWrapper.h
//  MohitGarg
//
//  Created by Mohit Garg on 24/01/16.
//  Copyright © 2016 Virginia Tech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AWSCore/AWSCore.h>
#import <AWSSimpleDB/AWSSimpleDB.h>

/** SimpleDBWrapper is a wrapper to add and get data from SimpleDB**/
@interface SimpleDBWrapper : NSObject

typedef void (^completionBlock) (NSArray* arr);

@property (nonatomic,strong) AWSSimpleDB * simpleDB;

+ (id)sharedInstance;
/**This method can be used to create a domain**/
-(void) createDomainWithName:(NSString*) domainName;
/**This method can be used to add attributes. It also has a completion handler block. Once the attributes has been added it shows wether the action was successful or returned an error.**/
-(void) addAttributes:(NSArray*) attributes itemName:(NSString*) item completion:(completionBlock)completionBlock;
/**This method can be used to run querries on the database. It also has a completion handler block which passes the results as parameter.**/
-(void) selectQueryWithCompletion:(completionBlock)completionBlock ;
/**This method can be used to delete attributes. It also has a completion handler block. Once the attributes have been deleted it shows wether the action was successful or returned an error.**/
-(void) deleteAttribute:(NSArray*)arr itemName:(NSString*)item completion:(completionBlock)completionBlock;

@property (nonatomic,strong) completionBlock completionBlock;
@end
