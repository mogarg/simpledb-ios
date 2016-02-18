//
//  SimpleDBWrapper.m
//  MohitGarg
//
//  Created by Mohit Garg on 24/01/16.
//  Copyright © 2016 Virginia Tech. All rights reserved.
//

#import "SimpleDBWrapper.h"

@implementation SimpleDBWrapper

+ (id)sharedInstance
{
    // structure used to test whether the block has completed or not
    static dispatch_once_t p = 0;
    
    // initialize sharedObject as nil (first call only)
    __strong static id _sharedObject = nil;
    
    // executes a block object once and only once for the lifetime of an application
    dispatch_once(&p, ^{
        _sharedObject = [[self alloc] init];
    });
    
    // returns the same object each time
    return _sharedObject;
}


-(instancetype)init{
    
    self = [super init];
    if (self) {
      self.simpleDB = [AWSSimpleDB defaultSimpleDB] ;
    }
    return self;
}

-(void) createDomainWithName:(NSString*) domainName{
    AWSSimpleDBCreateDomainRequest * domainRequest = [[AWSSimpleDBCreateDomainRequest alloc]init];
    domainRequest.domainName = domainName;
    
    [_simpleDB createDomain:domainRequest];
}

-(void) addAttributes:(NSArray*) attributes itemName:(NSString*) item completion:(completionBlock)completionBlock{
    //  NSMutableArray * attributes = [@[[AWSSimpleDBAttribute alloc] init]]mutableCopy];
    
    AWSSimpleDBPutAttributesRequest * request = [[AWSSimpleDBPutAttributesRequest alloc] init];
    request.itemName = item;
    request.attributes = attributes;
    request.domainName = @"ListOfItems";
    
    [[self.simpleDB putAttributes:request] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        if (task.error) {
            NSLog(@"The request failed. Error: [%@]", task.error);
        }
        
        if (task.exception) {
            NSLog(@"The request failed. Exception: [%@]", task.exception);
        }
        
        if (task.result) {
            completionBlock(@[]);
        }
        return nil;
    }];
}

-(void) selectQueryWithCompletion:(completionBlock)completionBlock{
    AWSSimpleDBSelectRequest * selectRequest = [[AWSSimpleDBSelectRequest alloc] init];
    selectRequest.selectExpression = @"select * from `ListOfItems` where itemName() is not null order by itemName()";
    selectRequest.consistentRead = [NSNumber numberWithBool:YES];
    
    [[self.simpleDB select:selectRequest] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        if (task.error) {
            NSLog(@"The request failed. Error: [%@]", task.error);
        }
        
        if (task.exception) {
            NSLog(@"The request failed. Exception: [%@]", task.exception);
        }
        
        if (task.result) {
            AWSSimpleDBSelectResult * result = (AWSSimpleDBSelectResult*)task.result;
            
            if (result) {
                completionBlock(result.items);
            }
        }
       return nil;
    }];
}

-(void) deleteAttribute:(NSArray*)arr itemName:(NSString*)item completion:(completionBlock)completionBlock{
    AWSSimpleDBDeleteAttributesRequest * deleteRequest = [[AWSSimpleDBDeleteAttributesRequest alloc]init];
    deleteRequest.attributes = arr;
    deleteRequest.domainName = @"ListOfItems";
    deleteRequest.itemName = item;
    
    [[self.simpleDB deleteAttributes:deleteRequest] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        if (task.error) {
            NSLog(@"The request failed. Error: [%@]", task.error);
        }
        
        if (task.exception) {
            NSLog(@"The request failed. Exception: [%@]", task.exception);
        }
        
        if (task.result) {
            AWSSimpleDBSelectResult * result = (AWSSimpleDBSelectResult*)task.result;
            
            if (result) {
                completionBlock(@[]);
            }
        }
        
        return nil;
    }];
}

-(void) listDomainsWithCompletion:(completionBlock)completionBlock{
    
    AWSSimpleDBListDomainsRequest *listRequest = [[AWSSimpleDBListDomainsRequest alloc] init];
    
    [[self.simpleDB listDomains:listRequest] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
        if (task.error) {
            NSLog(@"The request failed. Error: [%@]", task.error);
        }
        
        if (task.exception) {
            NSLog(@"The request failed. Exception: [%@]", task.exception);
        }
        
        if (task.result) {
            AWSSimpleDBListDomainsResult * result = (AWSSimpleDBListDomainsResult*)task.result;
            
            if (result) {
                completionBlock(result.domainNames);
            }
        }
        
        return nil;
    }];

}

@end
