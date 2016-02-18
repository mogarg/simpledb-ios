//
// Copyright 2010-2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License").
// You may not use this file except in compliance with the License.
// A copy of the License is located at
//
// http://aws.amazon.com/apache2.0
//
// or in the "license" file accompanying this file. This file is distributed
// on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
// express or implied. See the License for the specific language governing
// permissions and limitations under the License.
//

#import "AWSLambdaResources.h"
#import "AWSLogging.h"

@interface AWSLambdaResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSLambdaResources

+ (instancetype)sharedInstance {
    static AWSLambdaResources *_sharedResources = nil;
    static dispatch_once_t once_token;
    
    dispatch_once(&once_token, ^{
        _sharedResources = [AWSLambdaResources new];
    });
    
    return _sharedResources;
}
- (NSDictionary *)JSONObject {
    return self.definitionDictionary;
}

- (instancetype)init {
    if (self = [super init]) {
        //init method
        NSError *error = nil;
        _definitionDictionary = [NSJSONSerialization JSONObjectWithData:[[self definitionString] dataUsingEncoding:NSUTF8StringEncoding]
                                                                options:kNilOptions
                                                                  error:&error];
        if (_definitionDictionary == nil) {
            if (error) {
                AWSLogError(@"Failed to parse JSON service definition: %@",error);
            }
        }
    }
    return self;
}

- (NSString *)definitionString {
    return @" \
    { \
    \"version\":\"2.0\", \
    \"metadata\":{ \
    \"apiVersion\":\"2015-03-31\", \
    \"endpointPrefix\":\"lambda\", \
    \"serviceFullName\":\"AWS Lambda\", \
    \"signatureVersion\":\"v4\", \
    \"protocol\":\"rest-json\" \
    }, \
    \"documentation\":\"<fullname>AWS Lambda</fullname> <p><b>Overview</b></p> <p>This is the <i>AWS Lambda API Reference</i>. The AWS Lambda Developer Guide provides additional information. For the service overview, go to <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/welcome.html\\\">What is AWS Lambda</a>, and for information about how the service works, go to <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/lambda-introduction.html\\\">AWS Lambda: How it Works</a> in the <i>AWS Lambda Developer Guide</i>.</p>\", \
    \"operations\":{ \
    \"AddPermission\":{ \
    \"name\":\"AddPermission\", \
    \"http\":{ \
    \"method\":\"POST\", \
    \"requestUri\":\"/2015-03-31/functions/{FunctionName}/policy\", \
    \"responseCode\":201 \
    }, \
    \"input\":{\"shape\":\"AddPermissionRequest\"}, \
    \"output\":{\"shape\":\"AddPermissionResponse\"}, \
    \"errors\":[ \
    { \
    \"shape\":\"ServiceException\", \
    \"error\":{\"httpStatusCode\":500}, \
    \"exception\":true, \
    \"documentation\":\"<p>The AWS Lambda service encountered an internal error.</p>\" \
    }, \
    { \
    \"shape\":\"ResourceNotFoundException\", \
    \"error\":{\"httpStatusCode\":404}, \
    \"exception\":true, \
    \"documentation\":\"<p>The resource (for example, a Lambda function or access policy statement) specified in the request does not exist.</p>\" \
    }, \
    { \
    \"shape\":\"ResourceConflictException\", \
    \"error\":{\"httpStatusCode\":409}, \
    \"exception\":true, \
    \"documentation\":\"<p>The resource already exists.</p>\" \
    }, \
    { \
    \"shape\":\"InvalidParameterValueException\", \
    \"error\":{\"httpStatusCode\":400}, \
    \"exception\":true, \
    \"documentation\":\"<p>One of the parameters in the request is invalid. For example, if you provided an IAM role for AWS Lambda to assume in the <code>CreateFunction</code> or the <code>UpdateFunctionConfiguration</code> API, that AWS Lambda is unable to assume you will get this exception. </p>\" \
    }, \
    { \
    \"shape\":\"PolicyLengthExceededException\", \
    \"error\":{\"httpStatusCode\":400}, \
    \"exception\":true, \
    \"documentation\":\"<p>Lambda function access policy is limited to 20 KB.</p>\" \
    }, \
    { \
    \"shape\":\"TooManyRequestsException\", \
    \"error\":{\"httpStatusCode\":429}, \
    \"exception\":true \
    } \
    ], \
    \"documentation\":\"<p>Adds a permission to the resource policy associated with the specified AWS Lambda function. You use resource policies to grant permissions to event sources that use \\\"push\\\" model. In \\\"push\\\" model, event sources (such as Amazon S3 and custom applications) invoke your Lambda function. Each permission you add to the resource policy allows an event source, permission to invoke the Lambda function. </p> <p>For information about the push model, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/lambda-introduction.html\\\">AWS Lambda: How it Works</a>. </p> <p>If you are using versioning feature (see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases-v2.html\\\">AWS Lambda Function Versioning and Aliases</a>), a Lambda function can have multiple ARNs that can be used to invoke the function. Note that, each permission you add to resource policy using this API is specific to an ARN, specified using the <code>Qualifier</code> parameter</p> <p>This operation requires permission for the <code>lambda:AddPermission</code> action.</p>\" \
    }, \
    \"CreateAlias\":{ \
    \"name\":\"CreateAlias\", \
    \"http\":{ \
    \"method\":\"POST\", \
    \"requestUri\":\"/2015-03-31/functions/{FunctionName}/aliases\", \
    \"responseCode\":201 \
    }, \
    \"input\":{\"shape\":\"CreateAliasRequest\"}, \
    \"output\":{ \
    \"shape\":\"AliasConfiguration\", \
    \"documentation\":\"<p>Provides configuration information about a Lambda function version alias.</p>\" \
    }, \
    \"errors\":[ \
    { \
    \"shape\":\"ServiceException\", \
    \"error\":{\"httpStatusCode\":500}, \
    \"exception\":true, \
    \"documentation\":\"<p>The AWS Lambda service encountered an internal error.</p>\" \
    }, \
    { \
    \"shape\":\"ResourceNotFoundException\", \
    \"error\":{\"httpStatusCode\":404}, \
    \"exception\":true, \
    \"documentation\":\"<p>The resource (for example, a Lambda function or access policy statement) specified in the request does not exist.</p>\" \
    }, \
    { \
    \"shape\":\"ResourceConflictException\", \
    \"error\":{\"httpStatusCode\":409}, \
    \"exception\":true, \
    \"documentation\":\"<p>The resource already exists.</p>\" \
    }, \
    { \
    \"shape\":\"InvalidParameterValueException\", \
    \"error\":{\"httpStatusCode\":400}, \
    \"exception\":true, \
    \"documentation\":\"<p>One of the parameters in the request is invalid. For example, if you provided an IAM role for AWS Lambda to assume in the <code>CreateFunction</code> or the <code>UpdateFunctionConfiguration</code> API, that AWS Lambda is unable to assume you will get this exception. </p>\" \
    }, \
    { \
    \"shape\":\"TooManyRequestsException\", \
    \"error\":{\"httpStatusCode\":429}, \
    \"exception\":true \
    } \
    ], \
    \"documentation\":\"<p>Creates an alias to the specified Lambda function version. For more information, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/versioning-v2-intro-aliases.html\\\">Introduction to AWS Lambda Aliases</a></p> <p>This requires permission for the lambda:CreateAlias action.</p>\" \
    }, \
    \"CreateEventSourceMapping\":{ \
    \"name\":\"CreateEventSourceMapping\", \
    \"http\":{ \
    \"method\":\"POST\", \
    \"requestUri\":\"/2015-03-31/event-source-mappings/\", \
    \"responseCode\":202 \
    }, \
    \"input\":{\"shape\":\"CreateEventSourceMappingRequest\"}, \
    \"output\":{ \
    \"shape\":\"EventSourceMappingConfiguration\", \
    \"documentation\":\"<p>Describes mapping between an Amazon Kinesis stream and a Lambda function.</p>\" \
    }, \
    \"errors\":[ \
    { \
    \"shape\":\"ServiceException\", \
    \"error\":{\"httpStatusCode\":500}, \
    \"exception\":true, \
    \"documentation\":\"<p>The AWS Lambda service encountered an internal error.</p>\" \
    }, \
    { \
    \"shape\":\"InvalidParameterValueException\", \
    \"error\":{\"httpStatusCode\":400}, \
    \"exception\":true, \
    \"documentation\":\"<p>One of the parameters in the request is invalid. For example, if you provided an IAM role for AWS Lambda to assume in the <code>CreateFunction</code> or the <code>UpdateFunctionConfiguration</code> API, that AWS Lambda is unable to assume you will get this exception. </p>\" \
    }, \
    { \
    \"shape\":\"ResourceConflictException\", \
    \"error\":{\"httpStatusCode\":409}, \
    \"exception\":true, \
    \"documentation\":\"<p>The resource already exists.</p>\" \
    }, \
    { \
    \"shape\":\"TooManyRequestsException\", \
    \"error\":{\"httpStatusCode\":429}, \
    \"exception\":true \
    } \
    ], \
    \"documentation\":\"<p>Identifies a stream as an event source for a Lambda function. It can be either an Amazon Kinesis stream or an Amazon DynamoDB stream. AWS Lambda invokes the specified function when records are posted to the stream.</p> <p>This is the pull model, where AWS Lambda invokes the function. For more information, go to <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/lambda-introduction.html\\\">AWS Lambda: How it Works</a> in the <i>AWS Lambda Developer Guide</i>.</p> <p>This association between an Amazon Kinesis stream and a Lambda function is called the event source mapping. You provide the configuration information (for example, which stream to read from and which Lambda function to invoke) for the event source mapping in the request body.</p> <p> Each event source, such as an Amazon Kinesis or a DynamoDB stream, can be associated with multiple AWS Lambda function. A given Lambda function can be associated with multiple AWS event sources. </p> <p>This operation requires permission for the <code>lambda:CreateEventSourceMapping</code> action.</p>\" \
    }, \
    \"CreateFunction\":{ \
    \"name\":\"CreateFunction\", \
    \"http\":{ \
    \"method\":\"POST\", \
    \"requestUri\":\"/2015-03-31/functions\", \
    \"responseCode\":201 \
    }, \
    \"input\":{\"shape\":\"CreateFunctionRequest\"}, \
    \"output\":{ \
    \"shape\":\"FunctionConfiguration\", \
    \"documentation\":\"<p>A complex type that describes function metadata.</p>\" \
    }, \
    \"errors\":[ \
    { \
    \"shape\":\"ServiceException\", \
    \"error\":{\"httpStatusCode\":500}, \
    \"exception\":true, \
    \"documentation\":\"<p>The AWS Lambda service encountered an internal error.</p>\" \
    }, \
    { \
    \"shape\":\"InvalidParameterValueException\", \
    \"error\":{\"httpStatusCode\":400}, \
    \"exception\":true, \
    \"documentation\":\"<p>One of the parameters in the request is invalid. For example, if you provided an IAM role for AWS Lambda to assume in the <code>CreateFunction</code> or the <code>UpdateFunctionConfiguration</code> API, that AWS Lambda is unable to assume you will get this exception. </p>\" \
    }, \
    { \
    \"shape\":\"ResourceNotFoundException\", \
    \"error\":{\"httpStatusCode\":404}, \
    \"exception\":true, \
    \"documentation\":\"<p>The resource (for example, a Lambda function or access policy statement) specified in the request does not exist.</p>\" \
    }, \
    { \
    \"shape\":\"ResourceConflictException\", \
    \"error\":{\"httpStatusCode\":409}, \
    \"exception\":true, \
    \"documentation\":\"<p>The resource already exists.</p>\" \
    }, \
    { \
    \"shape\":\"TooManyRequestsException\", \
    \"error\":{\"httpStatusCode\":429}, \
    \"exception\":true \
    }, \
    { \
    \"shape\":\"CodeStorageExceededException\", \
    \"error\":{\"httpStatusCode\":400}, \
    \"exception\":true, \
    \"documentation\":\"<p>You have exceeded your maximum total code size per account. <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/limits.html\\\">Limits</a> </p>\" \
    } \
    ], \
    \"documentation\":\"<p>Creates a new Lambda function. The function metadata is created from the request parameters, and the code for the function is provided by a .zip file in the request body. If the function name already exists, the operation will fail. Note that the function name is case-sensitive. </p> <p>This operation requires permission for the <code>lambda:CreateFunction</code> action.</p>\" \
    }, \
    \"DeleteAlias\":{ \
    \"name\":\"DeleteAlias\", \
    \"http\":{ \
    \"method\":\"DELETE\", \
    \"requestUri\":\"/2015-03-31/functions/{FunctionName}/aliases/{Name}\", \
    \"responseCode\":204 \
    }, \
    \"input\":{\"shape\":\"DeleteAliasRequest\"}, \
    \"errors\":[ \
    { \
    \"shape\":\"ServiceException\", \
    \"error\":{\"httpStatusCode\":500}, \
    \"exception\":true, \
    \"documentation\":\"<p>The AWS Lambda service encountered an internal error.</p>\" \
    }, \
    { \
    \"shape\":\"InvalidParameterValueException\", \
    \"error\":{\"httpStatusCode\":400}, \
    \"exception\":true, \
    \"documentation\":\"<p>One of the parameters in the request is invalid. For example, if you provided an IAM role for AWS Lambda to assume in the <code>CreateFunction</code> or the <code>UpdateFunctionConfiguration</code> API, that AWS Lambda is unable to assume you will get this exception. </p>\" \
    }, \
    { \
    \"shape\":\"TooManyRequestsException\", \
    \"error\":{\"httpStatusCode\":429}, \
    \"exception\":true \
    } \
    ], \
    \"documentation\":\"<p>Deletes specified Lambda function alias. For more information, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/versioning-v2-intro-aliases.html\\\">Introduction to AWS Lambda Aliases</a></p> <p>This requires permission for the lambda:DeleteAlias action.</p>\" \
    }, \
    \"DeleteEventSourceMapping\":{ \
    \"name\":\"DeleteEventSourceMapping\", \
    \"http\":{ \
    \"method\":\"DELETE\", \
    \"requestUri\":\"/2015-03-31/event-source-mappings/{UUID}\", \
    \"responseCode\":202 \
    }, \
    \"input\":{\"shape\":\"DeleteEventSourceMappingRequest\"}, \
    \"output\":{ \
    \"shape\":\"EventSourceMappingConfiguration\", \
    \"documentation\":\"<p>Describes mapping between an Amazon Kinesis stream and a Lambda function.</p>\" \
    }, \
    \"errors\":[ \
    { \
    \"shape\":\"ServiceException\", \
    \"error\":{\"httpStatusCode\":500}, \
    \"exception\":true, \
    \"documentation\":\"<p>The AWS Lambda service encountered an internal error.</p>\" \
    }, \
    { \
    \"shape\":\"ResourceNotFoundException\", \
    \"error\":{\"httpStatusCode\":404}, \
    \"exception\":true, \
    \"documentation\":\"<p>The resource (for example, a Lambda function or access policy statement) specified in the request does not exist.</p>\" \
    }, \
    { \
    \"shape\":\"InvalidParameterValueException\", \
    \"error\":{\"httpStatusCode\":400}, \
    \"exception\":true, \
    \"documentation\":\"<p>One of the parameters in the request is invalid. For example, if you provided an IAM role for AWS Lambda to assume in the <code>CreateFunction</code> or the <code>UpdateFunctionConfiguration</code> API, that AWS Lambda is unable to assume you will get this exception. </p>\" \
    }, \
    { \
    \"shape\":\"TooManyRequestsException\", \
    \"error\":{\"httpStatusCode\":429}, \
    \"exception\":true \
    } \
    ], \
    \"documentation\":\"<p>Removes an event source mapping. This means AWS Lambda will no longer invoke the function for events in the associated source.</p> <p>This operation requires permission for the <code>lambda:DeleteEventSourceMapping</code> action.</p>\" \
    }, \
    \"DeleteFunction\":{ \
    \"name\":\"DeleteFunction\", \
    \"http\":{ \
    \"method\":\"DELETE\", \
    \"requestUri\":\"/2015-03-31/functions/{FunctionName}\", \
    \"responseCode\":204 \
    }, \
    \"input\":{\"shape\":\"DeleteFunctionRequest\"}, \
    \"errors\":[ \
    { \
    \"shape\":\"ServiceException\", \
    \"error\":{\"httpStatusCode\":500}, \
    \"exception\":true, \
    \"documentation\":\"<p>The AWS Lambda service encountered an internal error.</p>\" \
    }, \
    { \
    \"shape\":\"ResourceNotFoundException\", \
    \"error\":{\"httpStatusCode\":404}, \
    \"exception\":true, \
    \"documentation\":\"<p>The resource (for example, a Lambda function or access policy statement) specified in the request does not exist.</p>\" \
    }, \
    { \
    \"shape\":\"TooManyRequestsException\", \
    \"error\":{\"httpStatusCode\":429}, \
    \"exception\":true \
    }, \
    { \
    \"shape\":\"InvalidParameterValueException\", \
    \"error\":{\"httpStatusCode\":400}, \
    \"exception\":true, \
    \"documentation\":\"<p>One of the parameters in the request is invalid. For example, if you provided an IAM role for AWS Lambda to assume in the <code>CreateFunction</code> or the <code>UpdateFunctionConfiguration</code> API, that AWS Lambda is unable to assume you will get this exception. </p>\" \
    }, \
    { \
    \"shape\":\"ResourceConflictException\", \
    \"error\":{\"httpStatusCode\":409}, \
    \"exception\":true, \
    \"documentation\":\"<p>The resource already exists.</p>\" \
    } \
    ], \
    \"documentation\":\"<p>Deletes the specified Lambda function code and configuration.</p> <p>If you don't specify a function version, AWS Lambda will delete the function, including all its versions, and any aliases pointing to the function versions.</p> <p>When you delete a function the associated resource policy is also deleted. You will need to delete the event source mappings explicitly.</p> <p>For information about function versioning, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases-v2.html\\\">AWS Lambda Function Versioning and Aliases</a>.</p> <p>This operation requires permission for the <code>lambda:DeleteFunction</code> action.</p>\" \
    }, \
    \"GetAlias\":{ \
    \"name\":\"GetAlias\", \
    \"http\":{ \
    \"method\":\"GET\", \
    \"requestUri\":\"/2015-03-31/functions/{FunctionName}/aliases/{Name}\", \
    \"responseCode\":200 \
    }, \
    \"input\":{\"shape\":\"GetAliasRequest\"}, \
    \"output\":{ \
    \"shape\":\"AliasConfiguration\", \
    \"documentation\":\"<p>Provides configuration information about a Lambda function version alias.</p>\" \
    }, \
    \"errors\":[ \
    { \
    \"shape\":\"ServiceException\", \
    \"error\":{\"httpStatusCode\":500}, \
    \"exception\":true, \
    \"documentation\":\"<p>The AWS Lambda service encountered an internal error.</p>\" \
    }, \
    { \
    \"shape\":\"ResourceNotFoundException\", \
    \"error\":{\"httpStatusCode\":404}, \
    \"exception\":true, \
    \"documentation\":\"<p>The resource (for example, a Lambda function or access policy statement) specified in the request does not exist.</p>\" \
    }, \
    { \
    \"shape\":\"InvalidParameterValueException\", \
    \"error\":{\"httpStatusCode\":400}, \
    \"exception\":true, \
    \"documentation\":\"<p>One of the parameters in the request is invalid. For example, if you provided an IAM role for AWS Lambda to assume in the <code>CreateFunction</code> or the <code>UpdateFunctionConfiguration</code> API, that AWS Lambda is unable to assume you will get this exception. </p>\" \
    }, \
    { \
    \"shape\":\"TooManyRequestsException\", \
    \"error\":{\"httpStatusCode\":429}, \
    \"exception\":true \
    } \
    ], \
    \"documentation\":\"<p>Returns the specified alias information such as the alias ARN, description, and function version it is pointing to. For more information, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/versioning-v2-intro-aliases.html\\\">Introduction to AWS Lambda Aliases</a></p> <p>This requires permission for the lambda:GetAlias action.</p>\" \
    }, \
    \"GetEventSourceMapping\":{ \
    \"name\":\"GetEventSourceMapping\", \
    \"http\":{ \
    \"method\":\"GET\", \
    \"requestUri\":\"/2015-03-31/event-source-mappings/{UUID}\", \
    \"responseCode\":200 \
    }, \
    \"input\":{\"shape\":\"GetEventSourceMappingRequest\"}, \
    \"output\":{ \
    \"shape\":\"EventSourceMappingConfiguration\", \
    \"documentation\":\"<p>Describes mapping between an Amazon Kinesis stream and a Lambda function.</p>\" \
    }, \
    \"errors\":[ \
    { \
    \"shape\":\"ServiceException\", \
    \"error\":{\"httpStatusCode\":500}, \
    \"exception\":true, \
    \"documentation\":\"<p>The AWS Lambda service encountered an internal error.</p>\" \
    }, \
    { \
    \"shape\":\"ResourceNotFoundException\", \
    \"error\":{\"httpStatusCode\":404}, \
    \"exception\":true, \
    \"documentation\":\"<p>The resource (for example, a Lambda function or access policy statement) specified in the request does not exist.</p>\" \
    }, \
    { \
    \"shape\":\"InvalidParameterValueException\", \
    \"error\":{\"httpStatusCode\":400}, \
    \"exception\":true, \
    \"documentation\":\"<p>One of the parameters in the request is invalid. For example, if you provided an IAM role for AWS Lambda to assume in the <code>CreateFunction</code> or the <code>UpdateFunctionConfiguration</code> API, that AWS Lambda is unable to assume you will get this exception. </p>\" \
    }, \
    { \
    \"shape\":\"TooManyRequestsException\", \
    \"error\":{\"httpStatusCode\":429}, \
    \"exception\":true \
    } \
    ], \
    \"documentation\":\"<p>Returns configuration information for the specified event source mapping (see <a>CreateEventSourceMapping</a>).</p> <p>This operation requires permission for the <code>lambda:GetEventSourceMapping</code> action.</p>\" \
    }, \
    \"GetFunction\":{ \
    \"name\":\"GetFunction\", \
    \"http\":{ \
    \"method\":\"GET\", \
    \"requestUri\":\"/2015-03-31/functions/{FunctionName}\", \
    \"responseCode\":200 \
    }, \
    \"input\":{\"shape\":\"GetFunctionRequest\"}, \
    \"output\":{ \
    \"shape\":\"GetFunctionResponse\", \
    \"documentation\":\"<p>This response contains the object for the Lambda function location (see <a>API_FunctionCodeLocation</a></p>\" \
    }, \
    \"errors\":[ \
    { \
    \"shape\":\"ServiceException\", \
    \"error\":{\"httpStatusCode\":500}, \
    \"exception\":true, \
    \"documentation\":\"<p>The AWS Lambda service encountered an internal error.</p>\" \
    }, \
    { \
    \"shape\":\"ResourceNotFoundException\", \
    \"error\":{\"httpStatusCode\":404}, \
    \"exception\":true, \
    \"documentation\":\"<p>The resource (for example, a Lambda function or access policy statement) specified in the request does not exist.</p>\" \
    }, \
    { \
    \"shape\":\"TooManyRequestsException\", \
    \"error\":{\"httpStatusCode\":429}, \
    \"exception\":true \
    }, \
    { \
    \"shape\":\"InvalidParameterValueException\", \
    \"error\":{\"httpStatusCode\":400}, \
    \"exception\":true, \
    \"documentation\":\"<p>One of the parameters in the request is invalid. For example, if you provided an IAM role for AWS Lambda to assume in the <code>CreateFunction</code> or the <code>UpdateFunctionConfiguration</code> API, that AWS Lambda is unable to assume you will get this exception. </p>\" \
    } \
    ], \
    \"documentation\":\"<p>Returns the configuration information of the Lambda function and a presigned URL link to the .zip file you uploaded with <a>CreateFunction</a> so you can download the .zip file. Note that the URL is valid for up to 10 minutes. The configuration information is the same information you provided as parameters when uploading the function.</p> <p>Using the optional <code>Qualifier</code> parameter, you can specify a specific function version for which you want this information. If you don't specify this parameter, the API uses unqualified function ARN which return information about the $LATEST version of the Lambda function. For more information, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases-v2.html\\\">AWS Lambda Function Versioning and Aliases</a>.</p> <p>This operation requires permission for the <code>lambda:GetFunction</code> action.</p>\" \
    }, \
    \"GetFunctionConfiguration\":{ \
    \"name\":\"GetFunctionConfiguration\", \
    \"http\":{ \
    \"method\":\"GET\", \
    \"requestUri\":\"/2015-03-31/functions/{FunctionName}/configuration\", \
    \"responseCode\":200 \
    }, \
    \"input\":{\"shape\":\"GetFunctionConfigurationRequest\"}, \
    \"output\":{ \
    \"shape\":\"FunctionConfiguration\", \
    \"documentation\":\"<p>A complex type that describes function metadata.</p>\" \
    }, \
    \"errors\":[ \
    { \
    \"shape\":\"ServiceException\", \
    \"error\":{\"httpStatusCode\":500}, \
    \"exception\":true, \
    \"documentation\":\"<p>The AWS Lambda service encountered an internal error.</p>\" \
    }, \
    { \
    \"shape\":\"ResourceNotFoundException\", \
    \"error\":{\"httpStatusCode\":404}, \
    \"exception\":true, \
    \"documentation\":\"<p>The resource (for example, a Lambda function or access policy statement) specified in the request does not exist.</p>\" \
    }, \
    { \
    \"shape\":\"TooManyRequestsException\", \
    \"error\":{\"httpStatusCode\":429}, \
    \"exception\":true \
    }, \
    { \
    \"shape\":\"InvalidParameterValueException\", \
    \"error\":{\"httpStatusCode\":400}, \
    \"exception\":true, \
    \"documentation\":\"<p>One of the parameters in the request is invalid. For example, if you provided an IAM role for AWS Lambda to assume in the <code>CreateFunction</code> or the <code>UpdateFunctionConfiguration</code> API, that AWS Lambda is unable to assume you will get this exception. </p>\" \
    } \
    ], \
    \"documentation\":\"<p>Returns the configuration information of the Lambda function. This the same information you provided as parameters when uploading the function by using <a>CreateFunction</a>.</p> <p>You can use the optional <code>Qualifier</code> parameter to retrieve configuration information for a specific Lambda function version. If you don't provide it, the API returns information about the $LATEST version of the function. For more information about versioning, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases-v2.html\\\">AWS Lambda Function Versioning and Aliases</a>.</p> <p>This operation requires permission for the <code>lambda:GetFunctionConfiguration</code> operation.</p>\" \
    }, \
    \"GetPolicy\":{ \
    \"name\":\"GetPolicy\", \
    \"http\":{ \
    \"method\":\"GET\", \
    \"requestUri\":\"/2015-03-31/functions/{FunctionName}/policy\", \
    \"responseCode\":200 \
    }, \
    \"input\":{\"shape\":\"GetPolicyRequest\"}, \
    \"output\":{\"shape\":\"GetPolicyResponse\"}, \
    \"errors\":[ \
    { \
    \"shape\":\"ServiceException\", \
    \"error\":{\"httpStatusCode\":500}, \
    \"exception\":true, \
    \"documentation\":\"<p>The AWS Lambda service encountered an internal error.</p>\" \
    }, \
    { \
    \"shape\":\"ResourceNotFoundException\", \
    \"error\":{\"httpStatusCode\":404}, \
    \"exception\":true, \
    \"documentation\":\"<p>The resource (for example, a Lambda function or access policy statement) specified in the request does not exist.</p>\" \
    }, \
    { \
    \"shape\":\"TooManyRequestsException\", \
    \"error\":{\"httpStatusCode\":429}, \
    \"exception\":true \
    }, \
    { \
    \"shape\":\"InvalidParameterValueException\", \
    \"error\":{\"httpStatusCode\":400}, \
    \"exception\":true, \
    \"documentation\":\"<p>One of the parameters in the request is invalid. For example, if you provided an IAM role for AWS Lambda to assume in the <code>CreateFunction</code> or the <code>UpdateFunctionConfiguration</code> API, that AWS Lambda is unable to assume you will get this exception. </p>\" \
    } \
    ], \
    \"documentation\":\"<p>Returns the resource policy, containing a list of permissions that apply to a specific to an ARN that you specify via the <code>Qualifier</code> paramter. </p> <p>For informration about adding permissions, see <a>AddPermission</a>.</p> <p>You need permission for the <code>lambda:GetPolicy action.</code></p>\" \
    }, \
    \"Invoke\":{ \
    \"name\":\"Invoke\", \
    \"http\":{ \
    \"method\":\"POST\", \
    \"requestUri\":\"/2015-03-31/functions/{FunctionName}/invocations\" \
    }, \
    \"input\":{\"shape\":\"InvocationRequest\"}, \
    \"output\":{ \
    \"shape\":\"InvocationResponse\", \
    \"documentation\":\"<p>Upon success, returns an empty response. Otherwise, throws an exception.</p>\" \
    }, \
    \"errors\":[ \
    { \
    \"shape\":\"ServiceException\", \
    \"error\":{\"httpStatusCode\":500}, \
    \"exception\":true, \
    \"documentation\":\"<p>The AWS Lambda service encountered an internal error.</p>\" \
    }, \
    { \
    \"shape\":\"ResourceNotFoundException\", \
    \"error\":{\"httpStatusCode\":404}, \
    \"exception\":true, \
    \"documentation\":\"<p>The resource (for example, a Lambda function or access policy statement) specified in the request does not exist.</p>\" \
    }, \
    { \
    \"shape\":\"InvalidRequestContentException\", \
    \"error\":{\"httpStatusCode\":400}, \
    \"exception\":true, \
    \"documentation\":\"<p>The request body could not be parsed as JSON.</p>\" \
    }, \
    { \
    \"shape\":\"RequestTooLargeException\", \
    \"error\":{\"httpStatusCode\":413}, \
    \"exception\":true, \
    \"documentation\":\"<p>The request payload exceeded the <code>Invoke</code> request body JSON input limit. For more information, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/limits.html\\\">Limits</a> </p>\" \
    }, \
    { \
    \"shape\":\"UnsupportedMediaTypeException\", \
    \"error\":{\"httpStatusCode\":415}, \
    \"exception\":true, \
    \"documentation\":\"<p>The content type of the <code>Invoke</code> request body is not JSON.</p>\" \
    }, \
    { \
    \"shape\":\"TooManyRequestsException\", \
    \"error\":{\"httpStatusCode\":429}, \
    \"exception\":true \
    }, \
    { \
    \"shape\":\"InvalidParameterValueException\", \
    \"error\":{\"httpStatusCode\":400}, \
    \"exception\":true, \
    \"documentation\":\"<p>One of the parameters in the request is invalid. For example, if you provided an IAM role for AWS Lambda to assume in the <code>CreateFunction</code> or the <code>UpdateFunctionConfiguration</code> API, that AWS Lambda is unable to assume you will get this exception. </p>\" \
    } \
    ], \
    \"documentation\":\"<p> Invokes a specific Lambda function version. </p> <p>If you don't provide the <code>Qualifier</code> parameter, it uses the unqualified function ARN which results in invocation of the $LATEST version of the Lambda function (when you create a Lambda function, the $LATEST is the version). The AWS Lambda versioning and aliases feature allows you to publish multiple versions of a Lambda function and also create aliases for each function version. So each your Lambda function version can be invoked using multiple ARNs. For more information, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases-v2.html\\\">AWS Lambda Function Versioning and Aliases</a>. Using the <code>Qualifier</code> parameter, you can specify a function version or alias name to invoke specific function version. If you specify function version, the API uses the qualified function ARN to invoke a specific function version. If you specify alias name, the API uses the alias ARN to invoke the function version to which the alias points.</p> <p>This operation requires permission for the <code>lambda:InvokeFunction</code> action.</p>\" \
    }, \
    \"InvokeAsync\":{ \
    \"name\":\"InvokeAsync\", \
    \"http\":{ \
    \"method\":\"POST\", \
    \"requestUri\":\"/2014-11-13/functions/{FunctionName}/invoke-async/\", \
    \"responseCode\":202 \
    }, \
    \"input\":{ \
    \"shape\":\"InvokeAsyncRequest\", \
    \"deprecated\":true \
    }, \
    \"output\":{ \
    \"shape\":\"InvokeAsyncResponse\", \
    \"deprecated\":true, \
    \"documentation\":\"<p>Upon success, it returns empty response. Otherwise, throws an exception.</p>\" \
    }, \
    \"errors\":[ \
    { \
    \"shape\":\"ServiceException\", \
    \"error\":{\"httpStatusCode\":500}, \
    \"exception\":true, \
    \"documentation\":\"<p>The AWS Lambda service encountered an internal error.</p>\" \
    }, \
    { \
    \"shape\":\"ResourceNotFoundException\", \
    \"error\":{\"httpStatusCode\":404}, \
    \"exception\":true, \
    \"documentation\":\"<p>The resource (for example, a Lambda function or access policy statement) specified in the request does not exist.</p>\" \
    }, \
    { \
    \"shape\":\"InvalidRequestContentException\", \
    \"error\":{\"httpStatusCode\":400}, \
    \"exception\":true, \
    \"documentation\":\"<p>The request body could not be parsed as JSON.</p>\" \
    } \
    ], \
    \"deprecated\":true, \
    \"documentation\":\"<important>This API is deprecated. We recommend you use <code>Invoke</code> API (see <a>Invoke</a>).</important> <p>Submits an invocation request to AWS Lambda. Upon receiving the request, Lambda executes the specified function asynchronously. To see the logs generated by the Lambda function execution, see the CloudWatch logs console.</p> <p>This operation requires permission for the <code>lambda:InvokeFunction</code> action.</p>\" \
    }, \
    \"ListAliases\":{ \
    \"name\":\"ListAliases\", \
    \"http\":{ \
    \"method\":\"GET\", \
    \"requestUri\":\"/2015-03-31/functions/{FunctionName}/aliases\", \
    \"responseCode\":200 \
    }, \
    \"input\":{\"shape\":\"ListAliasesRequest\"}, \
    \"output\":{\"shape\":\"ListAliasesResponse\"}, \
    \"errors\":[ \
    { \
    \"shape\":\"ServiceException\", \
    \"error\":{\"httpStatusCode\":500}, \
    \"exception\":true, \
    \"documentation\":\"<p>The AWS Lambda service encountered an internal error.</p>\" \
    }, \
    { \
    \"shape\":\"ResourceNotFoundException\", \
    \"error\":{\"httpStatusCode\":404}, \
    \"exception\":true, \
    \"documentation\":\"<p>The resource (for example, a Lambda function or access policy statement) specified in the request does not exist.</p>\" \
    }, \
    { \
    \"shape\":\"InvalidParameterValueException\", \
    \"error\":{\"httpStatusCode\":400}, \
    \"exception\":true, \
    \"documentation\":\"<p>One of the parameters in the request is invalid. For example, if you provided an IAM role for AWS Lambda to assume in the <code>CreateFunction</code> or the <code>UpdateFunctionConfiguration</code> API, that AWS Lambda is unable to assume you will get this exception. </p>\" \
    }, \
    { \
    \"shape\":\"TooManyRequestsException\", \
    \"error\":{\"httpStatusCode\":429}, \
    \"exception\":true \
    } \
    ], \
    \"documentation\":\"<p>Returns list of aliases created for a Lambda function. For each alias, the response includes information such as the alias ARN, description, alias name, and the function version to which it points. For more information, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/versioning-v2-intro-aliases.html\\\">Introduction to AWS Lambda Aliases</a></p> <p>This requires permission for the lambda:ListAliases action.</p>\" \
    }, \
    \"ListEventSourceMappings\":{ \
    \"name\":\"ListEventSourceMappings\", \
    \"http\":{ \
    \"method\":\"GET\", \
    \"requestUri\":\"/2015-03-31/event-source-mappings/\", \
    \"responseCode\":200 \
    }, \
    \"input\":{\"shape\":\"ListEventSourceMappingsRequest\"}, \
    \"output\":{ \
    \"shape\":\"ListEventSourceMappingsResponse\", \
    \"documentation\":\"<p>Contains a list of event sources (see <a>API_EventSourceMappingConfiguration</a>)</p>\" \
    }, \
    \"errors\":[ \
    { \
    \"shape\":\"ServiceException\", \
    \"error\":{\"httpStatusCode\":500}, \
    \"exception\":true, \
    \"documentation\":\"<p>The AWS Lambda service encountered an internal error.</p>\" \
    }, \
    { \
    \"shape\":\"ResourceNotFoundException\", \
    \"error\":{\"httpStatusCode\":404}, \
    \"exception\":true, \
    \"documentation\":\"<p>The resource (for example, a Lambda function or access policy statement) specified in the request does not exist.</p>\" \
    }, \
    { \
    \"shape\":\"InvalidParameterValueException\", \
    \"error\":{\"httpStatusCode\":400}, \
    \"exception\":true, \
    \"documentation\":\"<p>One of the parameters in the request is invalid. For example, if you provided an IAM role for AWS Lambda to assume in the <code>CreateFunction</code> or the <code>UpdateFunctionConfiguration</code> API, that AWS Lambda is unable to assume you will get this exception. </p>\" \
    }, \
    { \
    \"shape\":\"TooManyRequestsException\", \
    \"error\":{\"httpStatusCode\":429}, \
    \"exception\":true \
    } \
    ], \
    \"documentation\":\"<p>Returns a list of event source mappings you created using the <code>CreateEventSourceMapping</code> (see <a>CreateEventSourceMapping</a>), where you identify a stream as an event source. This list does not include Amazon S3 event sources. </p> <p>For each mapping, the API returns configuration information. You can optionally specify filters to retrieve specific event source mappings.</p> <p>This operation requires permission for the <code>lambda:ListEventSourceMappings</code> action.</p>\" \
    }, \
    \"ListFunctions\":{ \
    \"name\":\"ListFunctions\", \
    \"http\":{ \
    \"method\":\"GET\", \
    \"requestUri\":\"/2015-03-31/functions/\", \
    \"responseCode\":200 \
    }, \
    \"input\":{\"shape\":\"ListFunctionsRequest\"}, \
    \"output\":{ \
    \"shape\":\"ListFunctionsResponse\", \
    \"documentation\":\"<p>Contains a list of AWS Lambda function configurations (see <a>FunctionConfiguration</a>.</p>\" \
    }, \
    \"errors\":[ \
    { \
    \"shape\":\"ServiceException\", \
    \"error\":{\"httpStatusCode\":500}, \
    \"exception\":true, \
    \"documentation\":\"<p>The AWS Lambda service encountered an internal error.</p>\" \
    }, \
    { \
    \"shape\":\"TooManyRequestsException\", \
    \"error\":{\"httpStatusCode\":429}, \
    \"exception\":true \
    } \
    ], \
    \"documentation\":\"<p>Returns a list of your Lambda functions. For each function, the response includes the function configuration information. You must use <a>GetFunction</a> to retrieve the code for your function.</p> <p>This operation requires permission for the <code>lambda:ListFunctions</code> action.</p>\" \
    }, \
    \"ListVersionsByFunction\":{ \
    \"name\":\"ListVersionsByFunction\", \
    \"http\":{ \
    \"method\":\"GET\", \
    \"requestUri\":\"/2015-03-31/functions/{FunctionName}/versions\", \
    \"responseCode\":200 \
    }, \
    \"input\":{\"shape\":\"ListVersionsByFunctionRequest\"}, \
    \"output\":{\"shape\":\"ListVersionsByFunctionResponse\"}, \
    \"errors\":[ \
    { \
    \"shape\":\"ServiceException\", \
    \"error\":{\"httpStatusCode\":500}, \
    \"exception\":true, \
    \"documentation\":\"<p>The AWS Lambda service encountered an internal error.</p>\" \
    }, \
    { \
    \"shape\":\"ResourceNotFoundException\", \
    \"error\":{\"httpStatusCode\":404}, \
    \"exception\":true, \
    \"documentation\":\"<p>The resource (for example, a Lambda function or access policy statement) specified in the request does not exist.</p>\" \
    }, \
    { \
    \"shape\":\"InvalidParameterValueException\", \
    \"error\":{\"httpStatusCode\":400}, \
    \"exception\":true, \
    \"documentation\":\"<p>One of the parameters in the request is invalid. For example, if you provided an IAM role for AWS Lambda to assume in the <code>CreateFunction</code> or the <code>UpdateFunctionConfiguration</code> API, that AWS Lambda is unable to assume you will get this exception. </p>\" \
    }, \
    { \
    \"shape\":\"TooManyRequestsException\", \
    \"error\":{\"httpStatusCode\":429}, \
    \"exception\":true \
    } \
    ], \
    \"documentation\":\"<p>List all versions of a function.</p>\" \
    }, \
    \"PublishVersion\":{ \
    \"name\":\"PublishVersion\", \
    \"http\":{ \
    \"method\":\"POST\", \
    \"requestUri\":\"/2015-03-31/functions/{FunctionName}/versions\", \
    \"responseCode\":201 \
    }, \
    \"input\":{\"shape\":\"PublishVersionRequest\"}, \
    \"output\":{ \
    \"shape\":\"FunctionConfiguration\", \
    \"documentation\":\"<p>A complex type that describes function metadata.</p>\" \
    }, \
    \"errors\":[ \
    { \
    \"shape\":\"ServiceException\", \
    \"error\":{\"httpStatusCode\":500}, \
    \"exception\":true, \
    \"documentation\":\"<p>The AWS Lambda service encountered an internal error.</p>\" \
    }, \
    { \
    \"shape\":\"ResourceNotFoundException\", \
    \"error\":{\"httpStatusCode\":404}, \
    \"exception\":true, \
    \"documentation\":\"<p>The resource (for example, a Lambda function or access policy statement) specified in the request does not exist.</p>\" \
    }, \
    { \
    \"shape\":\"InvalidParameterValueException\", \
    \"error\":{\"httpStatusCode\":400}, \
    \"exception\":true, \
    \"documentation\":\"<p>One of the parameters in the request is invalid. For example, if you provided an IAM role for AWS Lambda to assume in the <code>CreateFunction</code> or the <code>UpdateFunctionConfiguration</code> API, that AWS Lambda is unable to assume you will get this exception. </p>\" \
    }, \
    { \
    \"shape\":\"TooManyRequestsException\", \
    \"error\":{\"httpStatusCode\":429}, \
    \"exception\":true \
    }, \
    { \
    \"shape\":\"CodeStorageExceededException\", \
    \"error\":{\"httpStatusCode\":400}, \
    \"exception\":true, \
    \"documentation\":\"<p>You have exceeded your maximum total code size per account. <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/limits.html\\\">Limits</a> </p>\" \
    } \
    ], \
    \"documentation\":\"<p>Publishes a version of your function from the current snapshot of HEAD. That is, AWS Lambda takes a snapshot of the function code and configuration information from HEAD and publishes a new version. The code and <code>handler</code> of this specific Lambda function version cannot be modified after publication, but you can modify the configuration information. </p>\" \
    }, \
    \"RemovePermission\":{ \
    \"name\":\"RemovePermission\", \
    \"http\":{ \
    \"method\":\"DELETE\", \
    \"requestUri\":\"/2015-03-31/functions/{FunctionName}/policy/{StatementId}\", \
    \"responseCode\":204 \
    }, \
    \"input\":{\"shape\":\"RemovePermissionRequest\"}, \
    \"errors\":[ \
    { \
    \"shape\":\"ServiceException\", \
    \"error\":{\"httpStatusCode\":500}, \
    \"exception\":true, \
    \"documentation\":\"<p>The AWS Lambda service encountered an internal error.</p>\" \
    }, \
    { \
    \"shape\":\"ResourceNotFoundException\", \
    \"error\":{\"httpStatusCode\":404}, \
    \"exception\":true, \
    \"documentation\":\"<p>The resource (for example, a Lambda function or access policy statement) specified in the request does not exist.</p>\" \
    }, \
    { \
    \"shape\":\"InvalidParameterValueException\", \
    \"error\":{\"httpStatusCode\":400}, \
    \"exception\":true, \
    \"documentation\":\"<p>One of the parameters in the request is invalid. For example, if you provided an IAM role for AWS Lambda to assume in the <code>CreateFunction</code> or the <code>UpdateFunctionConfiguration</code> API, that AWS Lambda is unable to assume you will get this exception. </p>\" \
    }, \
    { \
    \"shape\":\"TooManyRequestsException\", \
    \"error\":{\"httpStatusCode\":429}, \
    \"exception\":true \
    } \
    ], \
    \"documentation\":\"<p>You can remove individual permissions from an resource policy associated with a Lambda function by providing a statement ID that you provided when you addded the permission. The API removes corresponding permission that is associated with the specific ARN identified by the <code>Qualifier</code> parameter.</p> <p>Note that removal of a permission will cause an active event source to lose permission to the function. </p> <p>You need permission for the <code>lambda:RemovePermission</code> action.</p>\" \
    }, \
    \"UpdateAlias\":{ \
    \"name\":\"UpdateAlias\", \
    \"http\":{ \
    \"method\":\"PUT\", \
    \"requestUri\":\"/2015-03-31/functions/{FunctionName}/aliases/{Name}\", \
    \"responseCode\":200 \
    }, \
    \"input\":{\"shape\":\"UpdateAliasRequest\"}, \
    \"output\":{ \
    \"shape\":\"AliasConfiguration\", \
    \"documentation\":\"<p>Provides configuration information about a Lambda function version alias.</p>\" \
    }, \
    \"errors\":[ \
    { \
    \"shape\":\"ServiceException\", \
    \"error\":{\"httpStatusCode\":500}, \
    \"exception\":true, \
    \"documentation\":\"<p>The AWS Lambda service encountered an internal error.</p>\" \
    }, \
    { \
    \"shape\":\"ResourceNotFoundException\", \
    \"error\":{\"httpStatusCode\":404}, \
    \"exception\":true, \
    \"documentation\":\"<p>The resource (for example, a Lambda function or access policy statement) specified in the request does not exist.</p>\" \
    }, \
    { \
    \"shape\":\"InvalidParameterValueException\", \
    \"error\":{\"httpStatusCode\":400}, \
    \"exception\":true, \
    \"documentation\":\"<p>One of the parameters in the request is invalid. For example, if you provided an IAM role for AWS Lambda to assume in the <code>CreateFunction</code> or the <code>UpdateFunctionConfiguration</code> API, that AWS Lambda is unable to assume you will get this exception. </p>\" \
    }, \
    { \
    \"shape\":\"TooManyRequestsException\", \
    \"error\":{\"httpStatusCode\":429}, \
    \"exception\":true \
    } \
    ], \
    \"documentation\":\"<p>Using this API you can update function version to which the alias points to and alias description. For more information, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/versioning-v2-intro-aliases.html\\\">Introduction to AWS Lambda Aliases</a></p> <p>This requires permission for the lambda:UpdateAlias action.</p>\" \
    }, \
    \"UpdateEventSourceMapping\":{ \
    \"name\":\"UpdateEventSourceMapping\", \
    \"http\":{ \
    \"method\":\"PUT\", \
    \"requestUri\":\"/2015-03-31/event-source-mappings/{UUID}\", \
    \"responseCode\":202 \
    }, \
    \"input\":{\"shape\":\"UpdateEventSourceMappingRequest\"}, \
    \"output\":{ \
    \"shape\":\"EventSourceMappingConfiguration\", \
    \"documentation\":\"<p>Describes mapping between an Amazon Kinesis stream and a Lambda function.</p>\" \
    }, \
    \"errors\":[ \
    { \
    \"shape\":\"ServiceException\", \
    \"error\":{\"httpStatusCode\":500}, \
    \"exception\":true, \
    \"documentation\":\"<p>The AWS Lambda service encountered an internal error.</p>\" \
    }, \
    { \
    \"shape\":\"ResourceNotFoundException\", \
    \"error\":{\"httpStatusCode\":404}, \
    \"exception\":true, \
    \"documentation\":\"<p>The resource (for example, a Lambda function or access policy statement) specified in the request does not exist.</p>\" \
    }, \
    { \
    \"shape\":\"InvalidParameterValueException\", \
    \"error\":{\"httpStatusCode\":400}, \
    \"exception\":true, \
    \"documentation\":\"<p>One of the parameters in the request is invalid. For example, if you provided an IAM role for AWS Lambda to assume in the <code>CreateFunction</code> or the <code>UpdateFunctionConfiguration</code> API, that AWS Lambda is unable to assume you will get this exception. </p>\" \
    }, \
    { \
    \"shape\":\"TooManyRequestsException\", \
    \"error\":{\"httpStatusCode\":429}, \
    \"exception\":true \
    }, \
    { \
    \"shape\":\"ResourceConflictException\", \
    \"error\":{\"httpStatusCode\":409}, \
    \"exception\":true, \
    \"documentation\":\"<p>The resource already exists.</p>\" \
    } \
    ], \
    \"documentation\":\"<p>You can update an event source mapping. This is useful if you want to change the parameters of the existing mapping without losing your position in the stream. You can change which function will receive the stream records, but to change the stream itself, you must create a new mapping. </p> <p>This operation requires permission for the <code>lambda:UpdateEventSourceMapping</code> action.</p>\" \
    }, \
    \"UpdateFunctionCode\":{ \
    \"name\":\"UpdateFunctionCode\", \
    \"http\":{ \
    \"method\":\"PUT\", \
    \"requestUri\":\"/2015-03-31/functions/{FunctionName}/code\", \
    \"responseCode\":200 \
    }, \
    \"input\":{\"shape\":\"UpdateFunctionCodeRequest\"}, \
    \"output\":{ \
    \"shape\":\"FunctionConfiguration\", \
    \"documentation\":\"<p>A complex type that describes function metadata.</p>\" \
    }, \
    \"errors\":[ \
    { \
    \"shape\":\"ServiceException\", \
    \"error\":{\"httpStatusCode\":500}, \
    \"exception\":true, \
    \"documentation\":\"<p>The AWS Lambda service encountered an internal error.</p>\" \
    }, \
    { \
    \"shape\":\"ResourceNotFoundException\", \
    \"error\":{\"httpStatusCode\":404}, \
    \"exception\":true, \
    \"documentation\":\"<p>The resource (for example, a Lambda function or access policy statement) specified in the request does not exist.</p>\" \
    }, \
    { \
    \"shape\":\"InvalidParameterValueException\", \
    \"error\":{\"httpStatusCode\":400}, \
    \"exception\":true, \
    \"documentation\":\"<p>One of the parameters in the request is invalid. For example, if you provided an IAM role for AWS Lambda to assume in the <code>CreateFunction</code> or the <code>UpdateFunctionConfiguration</code> API, that AWS Lambda is unable to assume you will get this exception. </p>\" \
    }, \
    { \
    \"shape\":\"TooManyRequestsException\", \
    \"error\":{\"httpStatusCode\":429}, \
    \"exception\":true \
    }, \
    { \
    \"shape\":\"CodeStorageExceededException\", \
    \"error\":{\"httpStatusCode\":400}, \
    \"exception\":true, \
    \"documentation\":\"<p>You have exceeded your maximum total code size per account. <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/limits.html\\\">Limits</a> </p>\" \
    } \
    ], \
    \"documentation\":\"<p> Updates the code for the specified Lambda function. This operation must only be used on an existing Lambda function and cannot be used to update the function configuration. </p> <p>This operation requires permission for the <code>lambda:UpdateFunctionCode</code> action.</p>\" \
    }, \
    \"UpdateFunctionConfiguration\":{ \
    \"name\":\"UpdateFunctionConfiguration\", \
    \"http\":{ \
    \"method\":\"PUT\", \
    \"requestUri\":\"/2015-03-31/functions/{FunctionName}/configuration\", \
    \"responseCode\":200 \
    }, \
    \"input\":{\"shape\":\"UpdateFunctionConfigurationRequest\"}, \
    \"output\":{ \
    \"shape\":\"FunctionConfiguration\", \
    \"documentation\":\"<p>A complex type that describes function metadata.</p>\" \
    }, \
    \"errors\":[ \
    { \
    \"shape\":\"ServiceException\", \
    \"error\":{\"httpStatusCode\":500}, \
    \"exception\":true, \
    \"documentation\":\"<p>The AWS Lambda service encountered an internal error.</p>\" \
    }, \
    { \
    \"shape\":\"ResourceNotFoundException\", \
    \"error\":{\"httpStatusCode\":404}, \
    \"exception\":true, \
    \"documentation\":\"<p>The resource (for example, a Lambda function or access policy statement) specified in the request does not exist.</p>\" \
    }, \
    { \
    \"shape\":\"InvalidParameterValueException\", \
    \"error\":{\"httpStatusCode\":400}, \
    \"exception\":true, \
    \"documentation\":\"<p>One of the parameters in the request is invalid. For example, if you provided an IAM role for AWS Lambda to assume in the <code>CreateFunction</code> or the <code>UpdateFunctionConfiguration</code> API, that AWS Lambda is unable to assume you will get this exception. </p>\" \
    }, \
    { \
    \"shape\":\"TooManyRequestsException\", \
    \"error\":{\"httpStatusCode\":429}, \
    \"exception\":true \
    } \
    ], \
    \"documentation\":\"<p>Updates the configuration parameters for the specified Lambda function by using the values provided in the request. You provide only the parameters you want to change. This operation must only be used on an existing Lambda function and cannot be used to update the function's code. </p> <p>This operation requires permission for the <code>lambda:UpdateFunctionConfiguration</code> action.</p>\" \
    } \
    }, \
    \"shapes\":{ \
    \"Action\":{ \
    \"type\":\"string\", \
    \"pattern\":\"(lambda:[*]|lambda:[a-zA-Z]+|[*])\" \
    }, \
    \"AddPermissionRequest\":{ \
    \"type\":\"structure\", \
    \"required\":[ \
    \"FunctionName\", \
    \"StatementId\", \
    \"Action\", \
    \"Principal\" \
    ], \
    \"members\":{ \
    \"FunctionName\":{ \
    \"shape\":\"FunctionName\", \
    \"location\":\"uri\", \
    \"locationName\":\"FunctionName\", \
    \"documentation\":\"<p>Name of the Lambda function whose resource policy you are updating by adding a new permission.</p> <p> You can specify an unqualified function name (for example, \\\"Thumbnail\\\") or you can specify Amazon Resource Name (ARN) of the function (for example, \\\"arn:aws:lambda:us-west-2:account-id:function:ThumbNail\\\"). AWS Lambda also allows you to specify only the account ID qualifier (for example, \\\"account-id:Thumbnail\\\"). Note that the length constraint applies only to the ARN. If you specify only the function name, it is limited to 64 character in length. </p>\" \
    }, \
    \"StatementId\":{ \
    \"shape\":\"StatementId\", \
    \"documentation\":\"<p>A unique statement identifier.</p>\" \
    }, \
    \"Action\":{ \
    \"shape\":\"Action\", \
    \"documentation\":\"<p>The AWS Lambda action you want to allow in this statement. Each Lambda action is a string starting with \\\"lambda:\\\" followed by the API name (see <a>Operations</a>). For example, \\\"lambda:CreateFunction\\\". You can use wildcard (\\\"lambda:*\\\") to grant permission for all AWS Lambda actions. </p>\" \
    }, \
    \"Principal\":{ \
    \"shape\":\"Principal\", \
    \"documentation\":\"<p>The principal who is getting this permission. It can be Amazon S3 service Principal (\\\"s3.amazonaws.com\\\") if you want Amazon S3 to invoke the function, an AWS account ID if you are granting cross-account permission, or any valid AWS service principal such as \\\"sns.amazonaws.com\\\". For example, you might want to allow a custom application in another AWS account to push events to AWS Lambda by invoking your function. </p>\" \
    }, \
    \"SourceArn\":{ \
    \"shape\":\"Arn\", \
    \"documentation\":\"<p>This is optional; however, when granting Amazon S3 permission to invoke your function, you should specify this field with the bucket Amazon Resource Name (ARN) as its value. This ensures that only events generated from the specified bucket can invoke the function. </p> <important>If you add a permission for the Amazon S3 principal without providing the source ARN, any AWS account that creates a mapping to your function ARN can send events to invoke your Lambda function from Amazon S3.</important>\" \
    }, \
    \"SourceAccount\":{ \
    \"shape\":\"SourceOwner\", \
    \"documentation\":\"<p>The AWS account ID (without a hyphen) of the source owner. For example, if the <code>SourceArn</code> identifies a bucket, then this is the bucket owner's account ID. You can use this additional condition to ensure the bucket you specify is owned by a specific account (it is possible the bucket owner deleted the bucket and some other AWS account created the bucket). You can also use this condition to specify all sources (that is, you don't specify the <code>SourceArn</code>) owned by a specific account. </p>\" \
    }, \
    \"Qualifier\":{ \
    \"shape\":\"Qualifier\", \
    \"location\":\"querystring\", \
    \"locationName\":\"Qualifier\", \
    \"documentation\":\"<p>You can specify this optional query parameter to specify function version or alias name. The permission will then apply to the specific qualified ARN. For example, if you specify function version 2 as the qualifier, then permission applies only when request is made using qualified function ARN: </p> <p><code>arn:aws:lambda:aws-region:acct-id:function:function-name:2</code></p> <p>If you specify alias name, for example \\\"PROD\\\", then the permission is valid only for requests made using the alias ARN:</p> <p><code>arn:aws:lambda:aws-region:acct-id:function:function-name:PROD</code></p> <p>If the qualifier is not specified, the permission is valid only when requests is made using unqualified function ARN. </p> <p><code>arn:aws:lambda:aws-region:acct-id:function:function-name</code></p>\" \
    } \
    } \
    }, \
    \"AddPermissionResponse\":{ \
    \"type\":\"structure\", \
    \"members\":{ \
    \"Statement\":{ \
    \"shape\":\"String\", \
    \"documentation\":\"<p>The permission statement you specified in the request. The response returns the same as a string using \\\"\\\\\\\" as an escape character in the JSON. </p>\" \
    } \
    } \
    }, \
    \"Alias\":{ \
    \"type\":\"string\", \
    \"min\":1, \
    \"max\":128, \
    \"pattern\":\"(?!^[0-9]+$)([a-zA-Z0-9-_]+)\" \
    }, \
    \"AliasConfiguration\":{ \
    \"type\":\"structure\", \
    \"members\":{ \
    \"AliasArn\":{ \
    \"shape\":\"FunctionArn\", \
    \"documentation\":\"<p>Lambda function ARN that is qualified using alias name as the suffix. For example, if you create an alias \\\"BETA\\\" pointing to a helloworld function version, the ARN is <code>arn:aws:lambda:aws-regions:acct-id:function:helloworld:BETA</code>.</p>\" \
    }, \
    \"Name\":{ \
    \"shape\":\"Alias\", \
    \"documentation\":\"<p>Alias name.</p>\" \
    }, \
    \"FunctionVersion\":{ \
    \"shape\":\"Version\", \
    \"documentation\":\"<p>Function version to which the alias points.</p>\" \
    }, \
    \"Description\":{ \
    \"shape\":\"Description\", \
    \"documentation\":\"<p>Alias description.</p>\" \
    } \
    }, \
    \"documentation\":\"<p>Provides configuration information about a Lambda function version alias.</p>\" \
    }, \
    \"AliasList\":{ \
    \"type\":\"list\", \
    \"member\":{\"shape\":\"AliasConfiguration\"} \
    }, \
    \"Arn\":{ \
    \"type\":\"string\", \
    \"pattern\":\"arn:aws:([a-zA-Z0-9\\\\-])+:([a-z]{2}-[a-z]+-\\\\d{1})?:(\\\\d{12})?:(.*)\" \
    }, \
    \"BatchSize\":{ \
    \"type\":\"integer\", \
    \"min\":1, \
    \"max\":10000 \
    }, \
    \"Blob\":{\"type\":\"blob\"}, \
    \"BlobStream\":{ \
    \"type\":\"blob\", \
    \"streaming\":true \
    }, \
    \"Boolean\":{\"type\":\"boolean\"}, \
    \"CodeStorageExceededException\":{ \
    \"type\":\"structure\", \
    \"members\":{ \
    \"Type\":{\"shape\":\"String\"}, \
    \"message\":{\"shape\":\"String\"} \
    }, \
    \"error\":{\"httpStatusCode\":400}, \
    \"exception\":true, \
    \"documentation\":\"<p>You have exceeded your maximum total code size per account. <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/limits.html\\\">Limits</a> </p>\" \
    }, \
    \"CreateAliasRequest\":{ \
    \"type\":\"structure\", \
    \"required\":[ \
    \"FunctionName\", \
    \"Name\", \
    \"FunctionVersion\" \
    ], \
    \"members\":{ \
    \"FunctionName\":{ \
    \"shape\":\"FunctionName\", \
    \"location\":\"uri\", \
    \"locationName\":\"FunctionName\", \
    \"documentation\":\"<p>Name of the Lambda function for which you want to create an alias. </p>\" \
    }, \
    \"Name\":{ \
    \"shape\":\"Alias\", \
    \"documentation\":\"<p>Name for the alias your creating.</p>\" \
    }, \
    \"FunctionVersion\":{ \
    \"shape\":\"Version\", \
    \"documentation\":\"<p>Lambda function version for which you are creating the alias.</p>\" \
    }, \
    \"Description\":{ \
    \"shape\":\"Description\", \
    \"documentation\":\"<p>Description of the alias.</p>\" \
    } \
    } \
    }, \
    \"CreateEventSourceMappingRequest\":{ \
    \"type\":\"structure\", \
    \"required\":[ \
    \"EventSourceArn\", \
    \"FunctionName\", \
    \"StartingPosition\" \
    ], \
    \"members\":{ \
    \"EventSourceArn\":{ \
    \"shape\":\"Arn\", \
    \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Amazon Kinesis or the Amazon DynamoDB stream that is the event source. Any record added to this stream could cause AWS Lambda to invoke your Lambda function, it depends on the <code>BatchSize</code>. AWS Lambda POSTs the Amazon Kinesis event, containing records, to your Lambda function as JSON.</p>\" \
    }, \
    \"FunctionName\":{ \
    \"shape\":\"FunctionName\", \
    \"documentation\":\"<p>The Lambda function to invoke when AWS Lambda detects an event on the stream.</p> <p> You can specify an unqualified function name (for example, \\\"Thumbnail\\\") or you can specify Amazon Resource Name (ARN) of the function (for example, \\\"arn:aws:lambda:us-west-2:account-id:function:ThumbNail\\\"). AWS Lambda also allows you to specify only the account ID qualifier (for example, \\\"account-id:Thumbnail\\\"). Note that the length constraint applies only to the ARN. If you specify only the function name, it is limited to 64 character in length. </p>\" \
    }, \
    \"Enabled\":{ \
    \"shape\":\"Enabled\", \
    \"documentation\":\"<p>Indicates whether AWS Lambda should begin polling the event source. By default, <code>Enabled</code> is true. </p>\" \
    }, \
    \"BatchSize\":{ \
    \"shape\":\"BatchSize\", \
    \"documentation\":\"<p>The largest number of records that AWS Lambda will retrieve from your event source at the time of invoking your function. Your function receives an event with all the retrieved records. The default is 100 records.</p>\" \
    }, \
    \"StartingPosition\":{ \
    \"shape\":\"EventSourcePosition\", \
    \"documentation\":\"<p>The position in the stream where AWS Lambda should start reading. For more information, go to <a href=\\\"http://docs.aws.amazon.com/kinesis/latest/APIReference/API_GetShardIterator.html#Kinesis-GetShardIterator-request-ShardIteratorType\\\">ShardIteratorType</a> in the <i>Amazon Kinesis API Reference</i>. </p>\" \
    } \
    } \
    }, \
    \"CreateFunctionRequest\":{ \
    \"type\":\"structure\", \
    \"required\":[ \
    \"FunctionName\", \
    \"Runtime\", \
    \"Role\", \
    \"Handler\", \
    \"Code\" \
    ], \
    \"members\":{ \
    \"FunctionName\":{ \
    \"shape\":\"FunctionName\", \
    \"documentation\":\"<p>The name you want to assign to the function you are uploading. You can specify an unqualified function name (for example, \\\"Thumbnail\\\") or you can specify Amazon Resource Name (ARN) of the function (for example, \\\"arn:aws:lambda:us-west-2:account-id:function:ThumbNail\\\"). AWS Lambda also allows you to specify only the account ID qualifier (for example, \\\"account-id:Thumbnail\\\"). Note that the length constraint applies only to the ARN. If you specify only the function name, it is limited to 64 character in length. The function names appear in the console and are returned in the <a>ListFunctions</a> API. Function names are used to specify functions to other AWS Lambda APIs, such as <a>Invoke</a>. </p>\" \
    }, \
    \"Runtime\":{ \
    \"shape\":\"Runtime\", \
    \"documentation\":\"<p>The runtime environment for the Lambda function you are uploading. Currently, Lambda supports \\\"java\\\" and \\\"nodejs\\\" as the runtime.</p>\" \
    }, \
    \"Role\":{ \
    \"shape\":\"RoleArn\", \
    \"documentation\":\"<p>The Amazon Resource Name (ARN) of the IAM role that Lambda assumes when it executes your function to access any other Amazon Web Services (AWS) resources. For more information, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/lambda-introduction.html\\\">AWS Lambda: How it Works</a> </p>\" \
    }, \
    \"Handler\":{ \
    \"shape\":\"Handler\", \
    \"documentation\":\"<p>The function within your code that Lambda calls to begin execution. For Node.js, it is the <i>module-name</i>.<i>export</i> value in your function. For Java, it can be <code>package.class-name::handler</code> or <code>package.class-name</code>. For more information, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/java-programming-model-handler-types.html\\\">Lambda Function Handler (Java)</a>. </p>\" \
    }, \
    \"Code\":{ \
    \"shape\":\"FunctionCode\", \
    \"documentation\":\"<p>The code for the Lambda function. </p>\" \
    }, \
    \"Description\":{ \
    \"shape\":\"Description\", \
    \"documentation\":\"<p>A short, user-defined function description. Lambda does not use this value. Assign a meaningful description as you see fit.</p>\" \
    }, \
    \"Timeout\":{ \
    \"shape\":\"Timeout\", \
    \"documentation\":\"<p>The function execution time at which Lambda should terminate the function. Because the execution time has cost implications, we recommend you set this value based on your expected execution time. The default is 3 seconds. </p>\" \
    }, \
    \"MemorySize\":{ \
    \"shape\":\"MemorySize\", \
    \"documentation\":\"<p>The amount of memory, in MB, your Lambda function is given. Lambda uses this memory size to infer the amount of CPU and memory allocated to your function. Your function use-case determines your CPU and memory requirements. For example, a database operation might need less memory compared to an image processing function. The default value is 128 MB. The value must be a multiple of 64 MB.</p>\" \
    }, \
    \"Publish\":{ \
    \"shape\":\"Boolean\", \
    \"documentation\":\"<p>This boolean parameter can be used to request AWS Lambda to create the Lambda function and publish a version as an atomic operation. </p>\" \
    } \
    } \
    }, \
    \"Date\":{\"type\":\"timestamp\"}, \
    \"DeleteAliasRequest\":{ \
    \"type\":\"structure\", \
    \"required\":[ \
    \"FunctionName\", \
    \"Name\" \
    ], \
    \"members\":{ \
    \"FunctionName\":{ \
    \"shape\":\"FunctionName\", \
    \"location\":\"uri\", \
    \"locationName\":\"FunctionName\", \
    \"documentation\":\"<p>The Lambda function name for which the alias is created.</p>\" \
    }, \
    \"Name\":{ \
    \"shape\":\"Alias\", \
    \"location\":\"uri\", \
    \"locationName\":\"Name\", \
    \"documentation\":\"<p>Name of the alias to delete.</p>\" \
    } \
    } \
    }, \
    \"DeleteEventSourceMappingRequest\":{ \
    \"type\":\"structure\", \
    \"required\":[\"UUID\"], \
    \"members\":{ \
    \"UUID\":{ \
    \"shape\":\"String\", \
    \"location\":\"uri\", \
    \"locationName\":\"UUID\", \
    \"documentation\":\"<p>The event source mapping ID.</p>\" \
    } \
    } \
    }, \
    \"DeleteFunctionRequest\":{ \
    \"type\":\"structure\", \
    \"required\":[\"FunctionName\"], \
    \"members\":{ \
    \"FunctionName\":{ \
    \"shape\":\"FunctionName\", \
    \"location\":\"uri\", \
    \"locationName\":\"FunctionName\", \
    \"documentation\":\"<p>The Lambda function to delete.</p> <p> You can specify an unqualified function name (for example, \\\"Thumbnail\\\") or you can specify Amazon Resource Name (ARN) of the function (for example, \\\"arn:aws:lambda:us-west-2:account-id:function:ThumbNail\\\"). AWS Lambda also allows you to specify only the account ID qualifier (for example, \\\"account-id:Thumbnail\\\"). Note that the length constraint applies only to the ARN. If you specify only the function name, it is limited to 64 character in length. </p>\" \
    }, \
    \"Qualifier\":{ \
    \"shape\":\"Qualifier\", \
    \"location\":\"querystring\", \
    \"locationName\":\"Qualifier\", \
    \"documentation\":\"<p>Using this optional parameter you can specify a function version (but not the $LATEST version) to direct AWS Lambda to delete a specific function version. If the function version has one or more aliases pointing to it, you will get an error because you cannot have aliases pointing to it. You can delete any function version but not the $LATEST, that is, you cannot specify $LATEST as the value of this parameter. The $LATEST version can be deleted only when you want to delete all the function versions and aliases.</p> <p>You can only specify a function version and not alias name using this parameter. You cannot delete a function version using its alias.</p> <p>If you don't specify this parameter, AWS Lambda will delete the function, including all its versions and aliases.</p>\" \
    } \
    } \
    }, \
    \"Description\":{ \
    \"type\":\"string\", \
    \"min\":0, \
    \"max\":256 \
    }, \
    \"Enabled\":{\"type\":\"boolean\"}, \
    \"EventSourceMappingConfiguration\":{ \
    \"type\":\"structure\", \
    \"members\":{ \
    \"UUID\":{ \
    \"shape\":\"String\", \
    \"documentation\":\"<p>The AWS Lambda assigned opaque identifier for the mapping.</p>\" \
    }, \
    \"BatchSize\":{ \
    \"shape\":\"BatchSize\", \
    \"documentation\":\"<p>The largest number of records that AWS Lambda will retrieve from your event source at the time of invoking your function. Your function receives an event with all the retrieved records.</p>\" \
    }, \
    \"EventSourceArn\":{ \
    \"shape\":\"Arn\", \
    \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Amazon Kinesis stream that is the source of events.</p>\" \
    }, \
    \"FunctionArn\":{ \
    \"shape\":\"FunctionArn\", \
    \"documentation\":\"<p>The Lambda function to invoke when AWS Lambda detects an event on the stream.</p>\" \
    }, \
    \"LastModified\":{ \
    \"shape\":\"Date\", \
    \"documentation\":\"<p>The UTC time string indicating the last time the event mapping was updated.</p>\" \
    }, \
    \"LastProcessingResult\":{ \
    \"shape\":\"String\", \
    \"documentation\":\"<p>The result of the last AWS Lambda invocation of your Lambda function.</p>\" \
    }, \
    \"State\":{ \
    \"shape\":\"String\", \
    \"documentation\":\"<p>The state of the event source mapping. It can be \\\"Creating\\\", \\\"Enabled\\\", \\\"Disabled\\\", \\\"Enabling\\\", \\\"Disabling\\\", \\\"Updating\\\", or \\\"Deleting\\\".</p>\" \
    }, \
    \"StateTransitionReason\":{ \
    \"shape\":\"String\", \
    \"documentation\":\"<p>The reason the event source mapping is in its current state. It is either user-requested or an AWS Lambda-initiated state transition.</p>\" \
    } \
    }, \
    \"documentation\":\"<p>Describes mapping between an Amazon Kinesis stream and a Lambda function.</p>\" \
    }, \
    \"EventSourceMappingsList\":{ \
    \"type\":\"list\", \
    \"member\":{\"shape\":\"EventSourceMappingConfiguration\"} \
    }, \
    \"EventSourcePosition\":{ \
    \"type\":\"string\", \
    \"enum\":[ \
    \"TRIM_HORIZON\", \
    \"LATEST\" \
    ] \
    }, \
    \"FunctionArn\":{ \
    \"type\":\"string\", \
    \"pattern\":\"arn:aws:lambda:[a-z]{2}-[a-z]+-\\\\d{1}:\\\\d{12}:function:[a-zA-Z0-9-_]+(:(\\\\$LATEST|[a-zA-Z0-9-_]+))?\" \
    }, \
    \"FunctionCode\":{ \
    \"type\":\"structure\", \
    \"members\":{ \
    \"ZipFile\":{ \
    \"shape\":\"Blob\", \
    \"documentation\":\"<p>A base64-encoded .zip file containing your deployment package. For more information about creating a .zip file, go to <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/intro-permission-model.html#lambda-intro-execution-role.html\\\">Execution Permissions</a> in the <i>AWS Lambda Developer Guide</i>. </p>\" \
    }, \
    \"S3Bucket\":{ \
    \"shape\":\"S3Bucket\", \
    \"documentation\":\"<p>Amazon S3 bucket name where the .zip file containing your deployment package is stored. This bucket must reside in the same AWS region where you are creating the Lambda function. </p>\" \
    }, \
    \"S3Key\":{ \
    \"shape\":\"S3Key\", \
    \"documentation\":\"<p>The Amazon S3 object (the deployment package) key name you want to upload. </p>\" \
    }, \
    \"S3ObjectVersion\":{ \
    \"shape\":\"S3ObjectVersion\", \
    \"documentation\":\"<p>The Amazon S3 object (the deployment package) version you want to upload.</p>\" \
    } \
    }, \
    \"documentation\":\"<p>The code for the Lambda function.</p>\" \
    }, \
    \"FunctionCodeLocation\":{ \
    \"type\":\"structure\", \
    \"members\":{ \
    \"RepositoryType\":{ \
    \"shape\":\"String\", \
    \"documentation\":\"<p>The repository from which you can download the function.</p>\" \
    }, \
    \"Location\":{ \
    \"shape\":\"String\", \
    \"documentation\":\"<p>The presigned URL you can use to download the function's .zip file that you previously uploaded. The URL is valid for up to 10 minutes.</p>\" \
    } \
    }, \
    \"documentation\":\"<p>The object for the Lambda function location.</p>\" \
    }, \
    \"FunctionConfiguration\":{ \
    \"type\":\"structure\", \
    \"members\":{ \
    \"FunctionName\":{ \
    \"shape\":\"FunctionName\", \
    \"documentation\":\"<p>The name of the function.</p>\" \
    }, \
    \"FunctionArn\":{ \
    \"shape\":\"FunctionArn\", \
    \"documentation\":\"<p>The Amazon Resource Name (ARN) assigned to the function.</p>\" \
    }, \
    \"Runtime\":{ \
    \"shape\":\"Runtime\", \
    \"documentation\":\"<p>The runtime environment for the Lambda function.</p>\" \
    }, \
    \"Role\":{ \
    \"shape\":\"RoleArn\", \
    \"documentation\":\"<p>The Amazon Resource Name (ARN) of the IAM role that Lambda assumes when it executes your function to access any other Amazon Web Services (AWS) resources. </p>\" \
    }, \
    \"Handler\":{ \
    \"shape\":\"Handler\", \
    \"documentation\":\"<p>The function Lambda calls to begin executing your function.</p>\" \
    }, \
    \"CodeSize\":{ \
    \"shape\":\"Long\", \
    \"documentation\":\"<p>The size, in bytes, of the function .zip file you uploaded.</p>\" \
    }, \
    \"Description\":{ \
    \"shape\":\"Description\", \
    \"documentation\":\"<p>The user-provided description.</p>\" \
    }, \
    \"Timeout\":{ \
    \"shape\":\"Timeout\", \
    \"documentation\":\"<p>The function execution time at which Lambda should terminate the function. Because the execution time has cost implications, we recommend you set this value based on your expected execution time. The default is 3 seconds. </p>\" \
    }, \
    \"MemorySize\":{ \
    \"shape\":\"MemorySize\", \
    \"documentation\":\"<p>The memory size, in MB, you configured for the function. Must be a multiple of 64 MB.</p>\" \
    }, \
    \"LastModified\":{ \
    \"shape\":\"Timestamp\", \
    \"documentation\":\"<p>The timestamp of the last time you updated the function.</p>\" \
    }, \
    \"CodeSha256\":{ \
    \"shape\":\"String\", \
    \"documentation\":\"<p>It is the SHA256 hash of your function deployment package.</p>\" \
    }, \
    \"Version\":{ \
    \"shape\":\"Version\", \
    \"documentation\":\"<p>The version of the Lambda function.</p>\" \
    } \
    }, \
    \"documentation\":\"<p>A complex type that describes function metadata.</p>\" \
    }, \
    \"FunctionList\":{ \
    \"type\":\"list\", \
    \"member\":{\"shape\":\"FunctionConfiguration\"} \
    }, \
    \"FunctionName\":{ \
    \"type\":\"string\", \
    \"min\":1, \
    \"max\":140, \
    \"pattern\":\"(arn:aws:lambda:)?([a-z]{2}-[a-z]+-\\\\d{1}:)?(\\\\d{12}:)?(function:)?([a-zA-Z0-9-_]+)(:(\\\\$LATEST|[a-zA-Z0-9-_]+))?\" \
    }, \
    \"GetAliasRequest\":{ \
    \"type\":\"structure\", \
    \"required\":[ \
    \"FunctionName\", \
    \"Name\" \
    ], \
    \"members\":{ \
    \"FunctionName\":{ \
    \"shape\":\"FunctionName\", \
    \"location\":\"uri\", \
    \"locationName\":\"FunctionName\", \
    \"documentation\":\"<p>Function name for which the alias is created. An alias is a subresource that exists only in the context of an existing Lambda function. So you must specify the function name.</p>\" \
    }, \
    \"Name\":{ \
    \"shape\":\"Alias\", \
    \"location\":\"uri\", \
    \"locationName\":\"Name\", \
    \"documentation\":\"<p>Name of the alias for which you want to retrieve information.</p>\" \
    } \
    } \
    }, \
    \"GetEventSourceMappingRequest\":{ \
    \"type\":\"structure\", \
    \"required\":[\"UUID\"], \
    \"members\":{ \
    \"UUID\":{ \
    \"shape\":\"String\", \
    \"location\":\"uri\", \
    \"locationName\":\"UUID\", \
    \"documentation\":\"<p>The AWS Lambda assigned ID of the event source mapping.</p>\" \
    } \
    } \
    }, \
    \"GetFunctionConfigurationRequest\":{ \
    \"type\":\"structure\", \
    \"required\":[\"FunctionName\"], \
    \"members\":{ \
    \"FunctionName\":{ \
    \"shape\":\"FunctionName\", \
    \"location\":\"uri\", \
    \"locationName\":\"FunctionName\", \
    \"documentation\":\"<p>The name of the Lambda function for which you want to retrieve the configuration information.</p> <p> You can specify an unqualified function name (for example, \\\"Thumbnail\\\") or you can specify Amazon Resource Name (ARN) of the function (for example, \\\"arn:aws:lambda:us-west-2:account-id:function:ThumbNail\\\"). AWS Lambda also allows you to specify only the account ID qualifier (for example, \\\"account-id:Thumbnail\\\"). Note that the length constraint applies only to the ARN. If you specify only the function name, it is limited to 64 character in length. </p>\" \
    }, \
    \"Qualifier\":{ \
    \"shape\":\"Qualifier\", \
    \"location\":\"querystring\", \
    \"locationName\":\"Qualifier\", \
    \"documentation\":\"<p>Using this optional parameter you can specify function version or alias name. If you specify function version, the API uses qualified function ARN and returns information about the specific function version. if you specify alias name, the API uses alias ARN and returns information about the function version to which the alias points.</p> <p>If you don't specify this parameter, the API uses unqualified function ARN, and returns information about the $LATEST function version.</p>\" \
    } \
    } \
    }, \
    \"GetFunctionRequest\":{ \
    \"type\":\"structure\", \
    \"required\":[\"FunctionName\"], \
    \"members\":{ \
    \"FunctionName\":{ \
    \"shape\":\"FunctionName\", \
    \"location\":\"uri\", \
    \"locationName\":\"FunctionName\", \
    \"documentation\":\"<p>The Lambda function name. </p> <p> You can specify an unqualified function name (for example, \\\"Thumbnail\\\") or you can specify Amazon Resource Name (ARN) of the function (for example, \\\"arn:aws:lambda:us-west-2:account-id:function:ThumbNail\\\"). AWS Lambda also allows you to specify only the account ID qualifier (for example, \\\"account-id:Thumbnail\\\"). Note that the length constraint applies only to the ARN. If you specify only the function name, it is limited to 64 character in length. </p>\" \
    }, \
    \"Qualifier\":{ \
    \"shape\":\"Qualifier\", \
    \"location\":\"querystring\", \
    \"locationName\":\"Qualifier\", \
    \"documentation\":\"<p>Using this optional parameter to specify a function version or alias name. If you specify function version, the API uses qualified function ARN for the request and returns information about the specific Lambda function version. If you specify alias name, the API uses alias ARN and returns information about the function version to which the alias points. If you don't provide this parameter, the API uses unqualified function ARN and returns information about the $LATEST version of the Lambda function.</p>\" \
    } \
    } \
    }, \
    \"GetFunctionResponse\":{ \
    \"type\":\"structure\", \
    \"members\":{ \
    \"Configuration\":{\"shape\":\"FunctionConfiguration\"}, \
    \"Code\":{\"shape\":\"FunctionCodeLocation\"} \
    }, \
    \"documentation\":\"<p>This response contains the object for the Lambda function location (see <a>API_FunctionCodeLocation</a></p>\" \
    }, \
    \"GetPolicyRequest\":{ \
    \"type\":\"structure\", \
    \"required\":[\"FunctionName\"], \
    \"members\":{ \
    \"FunctionName\":{ \
    \"shape\":\"FunctionName\", \
    \"location\":\"uri\", \
    \"locationName\":\"FunctionName\", \
    \"documentation\":\"<p>Function name whose resource policy you want to retrieve. </p> <p> You can specify an unqualified function name (for example, \\\"Thumbnail\\\") or you can specify Amazon Resource Name (ARN) of the function (for example, \\\"arn:aws:lambda:us-west-2:account-id:function:ThumbNail\\\"). AWS Lambda also allows you to specify only the account ID qualifier (for example, \\\"account-id:Thumbnail\\\"). Note that the length constraint applies only to the ARN. If you specify only the function name, it is limited to 64 character in length. </p>\" \
    }, \
    \"Qualifier\":{ \
    \"shape\":\"Qualifier\", \
    \"documentation\":\"<p>You can specify this optional query parameter to specify function version or alias name in which case this API will return all permissions associated with the specific ARN. If you don't provide this parameter, the API will return permissions that apply to the unqualified function ARN. </p>\" \
    } \
    } \
    }, \
    \"GetPolicyResponse\":{ \
    \"type\":\"structure\", \
    \"members\":{ \
    \"Policy\":{ \
    \"shape\":\"String\", \
    \"documentation\":\"<p>The resource policy associated with the specified function. The response returns the same as a string using \\\"\\\\\\\" as an escape character in the JSON. </p>\" \
    } \
    } \
    }, \
    \"Handler\":{ \
    \"type\":\"string\", \
    \"max\":128, \
    \"pattern\":\"[^\\\\s]+\" \
    }, \
    \"HttpStatus\":{\"type\":\"integer\"}, \
    \"Integer\":{\"type\":\"integer\"}, \
    \"InvalidParameterValueException\":{ \
    \"type\":\"structure\", \
    \"members\":{ \
    \"Type\":{\"shape\":\"String\"}, \
    \"message\":{\"shape\":\"String\"} \
    }, \
    \"error\":{\"httpStatusCode\":400}, \
    \"exception\":true, \
    \"documentation\":\"<p>One of the parameters in the request is invalid. For example, if you provided an IAM role for AWS Lambda to assume in the <code>CreateFunction</code> or the <code>UpdateFunctionConfiguration</code> API, that AWS Lambda is unable to assume you will get this exception. </p>\" \
    }, \
    \"InvalidRequestContentException\":{ \
    \"type\":\"structure\", \
    \"members\":{ \
    \"Type\":{\"shape\":\"String\"}, \
    \"message\":{\"shape\":\"String\"} \
    }, \
    \"error\":{\"httpStatusCode\":400}, \
    \"exception\":true, \
    \"documentation\":\"<p>The request body could not be parsed as JSON.</p>\" \
    }, \
    \"InvocationRequest\":{ \
    \"type\":\"structure\", \
    \"required\":[\"FunctionName\"], \
    \"members\":{ \
    \"FunctionName\":{ \
    \"shape\":\"FunctionName\", \
    \"location\":\"uri\", \
    \"locationName\":\"FunctionName\", \
    \"documentation\":\"<p>The Lambda function name. </p> <p> You can specify an unqualified function name (for example, \\\"Thumbnail\\\") or you can specify Amazon Resource Name (ARN) of the function (for example, \\\"arn:aws:lambda:us-west-2:account-id:function:ThumbNail\\\"). AWS Lambda also allows you to specify only the account ID qualifier (for example, \\\"account-id:Thumbnail\\\"). Note that the length constraint applies only to the ARN. If you specify only the function name, it is limited to 64 character in length. </p>\" \
    }, \
    \"InvocationType\":{ \
    \"shape\":\"InvocationType\", \
    \"location\":\"header\", \
    \"locationName\":\"X-Amz-Invocation-Type\", \
    \"documentation\":\"<p>By default, the <code>Invoke</code> API assumes \\\"RequestResponse\\\" invocation type. You can optionally request asynchronous execution by specifying \\\"Event\\\" as the <code>InvocationType</code>. You can also use this parameter to request AWS Lambda to not execute the function but do some verification, such as if the caller is authorized to invoke the function and if the inputs are valid. You request this by specifying \\\"DryRun\\\" as the <code>InvocationType</code>. This is useful in a cross-account scenario when you want to verify access to a function without running it. </p>\" \
    }, \
    \"LogType\":{ \
    \"shape\":\"LogType\", \
    \"location\":\"header\", \
    \"locationName\":\"X-Amz-Log-Type\", \
    \"documentation\":\"<p>You can set this optional parameter to \\\"Tail\\\" in the request only if you specify the <code>InvocationType</code> parameter with value \\\"RequestResponse\\\". In this case, AWS Lambda returns the base64-encoded last 4 KB of log data produced by your Lambda function in the <code>x-amz-log-results</code> header. </p>\" \
    }, \
    \"ClientContext\":{ \
    \"shape\":\"String\", \
    \"location\":\"header\", \
    \"locationName\":\"X-Amz-Client-Context\", \
    \"documentation\":\"<p>Using the <code>ClientContext</code> you can pass client-specific information to the Lambda function you are invoking. You can then process the client information in your Lambda function as you choose through the context variable. For an example of a ClientContext JSON, go to <a href=\\\"http://docs.aws.amazon.com/mobileanalytics/latest/ug/PutEvents.html\\\">PutEvents</a> in the <i>Amazon Mobile Analytics API Reference and User Guide</i>.</p> <p>The ClientContext JSON must be base64-encoded.</p>\" \
    }, \
    \"Payload\":{ \
    \"shape\":\"Blob\", \
    \"documentation\":\"<p>JSON that you want to provide to your Lambda function as input.</p>\" \
    }, \
    \"Qualifier\":{ \
    \"shape\":\"Qualifier\", \
    \"location\":\"querystring\", \
    \"locationName\":\"Qualifier\", \
    \"documentation\":\"<p>You can use this optional paramter to specify a Lambda function version or alias name. If you specify function version, the API uses qualified function ARN to invoke a specific Lambda function. If you specify alias name, the API uses the alias ARN to invoke the Lambda function version to which the alias points.</p> <p>If you don't provide this parameter, then the API uses unqualified function ARN which results in invocation of the $LATEST version.</p>\" \
    } \
    }, \
    \"payload\":\"Payload\" \
    }, \
    \"InvocationResponse\":{ \
    \"type\":\"structure\", \
    \"members\":{ \
    \"StatusCode\":{ \
    \"shape\":\"Integer\", \
    \"location\":\"statusCode\", \
    \"documentation\":\"<p>The HTTP status code will be in the 200 range for successful request. For the \\\"RequestResonse\\\" invocation type this status code will be 200. For the \\\"Event\\\" invocation type this status code will be 202. For the \\\"DryRun\\\" invocation type the status code will be 204. </p>\" \
    }, \
    \"FunctionError\":{ \
    \"shape\":\"String\", \
    \"location\":\"header\", \
    \"locationName\":\"X-Amz-Function-Error\", \
    \"documentation\":\"<p>Indicates whether an error occurred while executing the Lambda function. If an error occurred this field will have one of two values; <code>Handled</code> or <code>Unhandled</code>. <code>Handled</code> errors are errors that are reported by the function while the <code>Unhandled</code> errors are those detected and reported by AWS Lambda. Unhandled errors include out of memory errors and function timeouts. For information about how to report an <code>Handled</code> error, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/programming-model.html\\\">Programming Model</a>. </p>\" \
    }, \
    \"LogResult\":{ \
    \"shape\":\"String\", \
    \"location\":\"header\", \
    \"locationName\":\"X-Amz-Log-Result\", \
    \"documentation\":\"<p> It is the base64-encoded logs for the Lambda function invocation. This is present only if the invocation type is \\\"RequestResponse\\\" and the logs were requested. </p>\" \
    }, \
    \"Payload\":{ \
    \"shape\":\"Blob\", \
    \"documentation\":\"<p> It is the JSON representation of the object returned by the Lambda function. In This is present only if the invocation type is \\\"RequestResponse\\\". </p> <p>In the event of a function error this field contains a message describing the error. For the <code>Handled</code> errors the Lambda function will report this message. For <code>Unhandled</code> errors AWS Lambda reports the message. </p>\" \
    } \
    }, \
    \"documentation\":\"<p>Upon success, returns an empty response. Otherwise, throws an exception.</p>\", \
    \"payload\":\"Payload\" \
    }, \
    \"InvocationType\":{ \
    \"type\":\"string\", \
    \"enum\":[ \
    \"Event\", \
    \"RequestResponse\", \
    \"DryRun\" \
    ] \
    }, \
    \"InvokeAsyncRequest\":{ \
    \"type\":\"structure\", \
    \"required\":[ \
    \"FunctionName\", \
    \"InvokeArgs\" \
    ], \
    \"members\":{ \
    \"FunctionName\":{ \
    \"shape\":\"FunctionName\", \
    \"location\":\"uri\", \
    \"locationName\":\"FunctionName\", \
    \"documentation\":\"<p>The Lambda function name.</p>\" \
    }, \
    \"InvokeArgs\":{ \
    \"shape\":\"BlobStream\", \
    \"documentation\":\"<p>JSON that you want to provide to your Lambda function as input.</p>\" \
    } \
    }, \
    \"deprecated\":true, \
    \"payload\":\"InvokeArgs\" \
    }, \
    \"InvokeAsyncResponse\":{ \
    \"type\":\"structure\", \
    \"members\":{ \
    \"Status\":{ \
    \"shape\":\"HttpStatus\", \
    \"location\":\"statusCode\", \
    \"documentation\":\"<p>It will be 202 upon success.</p>\" \
    } \
    }, \
    \"deprecated\":true, \
    \"documentation\":\"<p>Upon success, it returns empty response. Otherwise, throws an exception.</p>\" \
    }, \
    \"ListAliasesRequest\":{ \
    \"type\":\"structure\", \
    \"required\":[\"FunctionName\"], \
    \"members\":{ \
    \"FunctionName\":{ \
    \"shape\":\"FunctionName\", \
    \"location\":\"uri\", \
    \"locationName\":\"FunctionName\", \
    \"documentation\":\"<p>Lambda function name for which the alias is created.</p>\" \
    }, \
    \"FunctionVersion\":{ \
    \"shape\":\"Version\", \
    \"location\":\"querystring\", \
    \"locationName\":\"FunctionVersion\", \
    \"documentation\":\"<p>If you specify this optional parameter, the API returns only the aliases pointing to the specific Lambda function version, otherwise returns all aliases created for the Lambda function.</p>\" \
    }, \
    \"Marker\":{ \
    \"shape\":\"String\", \
    \"location\":\"querystring\", \
    \"locationName\":\"Marker\", \
    \"documentation\":\"<p>Optional string. An opaque pagination token returned from a previous ListAliases operation. If present, indicates where to continue the listing.</p>\" \
    }, \
    \"MaxItems\":{ \
    \"shape\":\"MaxListItems\", \
    \"location\":\"querystring\", \
    \"locationName\":\"MaxItems\", \
    \"documentation\":\"<p>Optional integer. Specifies the maximum number of aliases to return in response. This parameter value must be greater than 0.</p>\" \
    } \
    } \
    }, \
    \"ListAliasesResponse\":{ \
    \"type\":\"structure\", \
    \"members\":{ \
    \"NextMarker\":{ \
    \"shape\":\"String\", \
    \"documentation\":\"<p>A string, present if there are more aliases.</p>\" \
    }, \
    \"Aliases\":{ \
    \"shape\":\"AliasList\", \
    \"documentation\":\"<p>An list of alises.</p>\" \
    } \
    } \
    }, \
    \"ListEventSourceMappingsRequest\":{ \
    \"type\":\"structure\", \
    \"members\":{ \
    \"EventSourceArn\":{ \
    \"shape\":\"Arn\", \
    \"location\":\"querystring\", \
    \"locationName\":\"EventSourceArn\", \
    \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Amazon Kinesis stream.</p>\" \
    }, \
    \"FunctionName\":{ \
    \"shape\":\"FunctionName\", \
    \"location\":\"querystring\", \
    \"locationName\":\"FunctionName\", \
    \"documentation\":\"<p>The name of the Lambda function.</p> <p> You can specify an unqualified function name (for example, \\\"Thumbnail\\\") or you can specify Amazon Resource Name (ARN) of the function (for example, \\\"arn:aws:lambda:us-west-2:account-id:function:ThumbNail\\\"). AWS Lambda also allows you to specify only the account ID qualifier (for example, \\\"account-id:Thumbnail\\\"). Note that the length constraint applies only to the ARN. If you specify only the function name, it is limited to 64 character in length. </p>\" \
    }, \
    \"Marker\":{ \
    \"shape\":\"String\", \
    \"location\":\"querystring\", \
    \"locationName\":\"Marker\", \
    \"documentation\":\"<p>Optional string. An opaque pagination token returned from a previous <code>ListEventSourceMappings</code> operation. If present, specifies to continue the list from where the returning call left off. </p>\" \
    }, \
    \"MaxItems\":{ \
    \"shape\":\"MaxListItems\", \
    \"location\":\"querystring\", \
    \"locationName\":\"MaxItems\", \
    \"documentation\":\"<p>Optional integer. Specifies the maximum number of event sources to return in response. This value must be greater than 0.</p>\" \
    } \
    } \
    }, \
    \"ListEventSourceMappingsResponse\":{ \
    \"type\":\"structure\", \
    \"members\":{ \
    \"NextMarker\":{ \
    \"shape\":\"String\", \
    \"documentation\":\"<p>A string, present if there are more event source mappings.</p>\" \
    }, \
    \"EventSourceMappings\":{ \
    \"shape\":\"EventSourceMappingsList\", \
    \"documentation\":\"<p>An array of <code>EventSourceMappingConfiguration</code> objects.</p>\" \
    } \
    }, \
    \"documentation\":\"<p>Contains a list of event sources (see <a>API_EventSourceMappingConfiguration</a>)</p>\" \
    }, \
    \"ListFunctionsRequest\":{ \
    \"type\":\"structure\", \
    \"members\":{ \
    \"Marker\":{ \
    \"shape\":\"String\", \
    \"location\":\"querystring\", \
    \"locationName\":\"Marker\", \
    \"documentation\":\"<p>Optional string. An opaque pagination token returned from a previous <code>ListFunctions</code> operation. If present, indicates where to continue the listing. </p>\" \
    }, \
    \"MaxItems\":{ \
    \"shape\":\"MaxListItems\", \
    \"location\":\"querystring\", \
    \"locationName\":\"MaxItems\", \
    \"documentation\":\"<p>Optional integer. Specifies the maximum number of AWS Lambda functions to return in response. This parameter value must be greater than 0.</p>\" \
    } \
    } \
    }, \
    \"ListFunctionsResponse\":{ \
    \"type\":\"structure\", \
    \"members\":{ \
    \"NextMarker\":{ \
    \"shape\":\"String\", \
    \"documentation\":\"<p>A string, present if there are more functions.</p>\" \
    }, \
    \"Functions\":{ \
    \"shape\":\"FunctionList\", \
    \"documentation\":\"<p>A list of Lambda functions.</p>\" \
    } \
    }, \
    \"documentation\":\"<p>Contains a list of AWS Lambda function configurations (see <a>FunctionConfiguration</a>.</p>\" \
    }, \
    \"ListVersionsByFunctionRequest\":{ \
    \"type\":\"structure\", \
    \"required\":[\"FunctionName\"], \
    \"members\":{ \
    \"FunctionName\":{ \
    \"shape\":\"FunctionName\", \
    \"location\":\"uri\", \
    \"locationName\":\"FunctionName\", \
    \"documentation\":\"<p>Function name whose versions to list. You can specify an unqualified function name (for example, \\\"Thumbnail\\\") or you can specify Amazon Resource Name (ARN) of the function (for example, \\\"arn:aws:lambda:us-west-2:account-id:function:ThumbNail\\\"). AWS Lambda also allows you to specify only the account ID qualifier (for example, \\\"account-id:Thumbnail\\\"). Note that the length constraint applies only to the ARN. If you specify only the function name, it is limited to 64 character in length. </p>\" \
    }, \
    \"Marker\":{ \
    \"shape\":\"String\", \
    \"location\":\"querystring\", \
    \"locationName\":\"Marker\", \
    \"documentation\":\"<p> Optional string. An opaque pagination token returned from a previous <code>ListVersionsByFunction</code> operation. If present, indicates where to continue the listing. </p>\" \
    }, \
    \"MaxItems\":{ \
    \"shape\":\"MaxListItems\", \
    \"location\":\"querystring\", \
    \"locationName\":\"MaxItems\", \
    \"documentation\":\"<p> Optional integer. Specifies the maximum number of AWS Lambda function versions to return in response. This parameter value must be greater than 0. </p>\" \
    } \
    } \
    }, \
    \"ListVersionsByFunctionResponse\":{ \
    \"type\":\"structure\", \
    \"members\":{ \
    \"NextMarker\":{ \
    \"shape\":\"String\", \
    \"documentation\":\"<p>A string, present if there are more function versions.</p>\" \
    }, \
    \"Versions\":{ \
    \"shape\":\"FunctionList\", \
    \"documentation\":\"<p>A list of Lambda function versions.</p>\" \
    } \
    } \
    }, \
    \"LogType\":{ \
    \"type\":\"string\", \
    \"enum\":[ \
    \"None\", \
    \"Tail\" \
    ] \
    }, \
    \"Long\":{\"type\":\"long\"}, \
    \"MaxListItems\":{ \
    \"type\":\"integer\", \
    \"min\":1, \
    \"max\":10000 \
    }, \
    \"MemorySize\":{ \
    \"type\":\"integer\", \
    \"min\":128, \
    \"max\":1536 \
    }, \
    \"PolicyLengthExceededException\":{ \
    \"type\":\"structure\", \
    \"members\":{ \
    \"Type\":{\"shape\":\"String\"}, \
    \"message\":{\"shape\":\"String\"} \
    }, \
    \"error\":{\"httpStatusCode\":400}, \
    \"exception\":true, \
    \"documentation\":\"<p>Lambda function access policy is limited to 20 KB.</p>\" \
    }, \
    \"Principal\":{ \
    \"type\":\"string\", \
    \"pattern\":\".*\" \
    }, \
    \"PublishVersionRequest\":{ \
    \"type\":\"structure\", \
    \"required\":[\"FunctionName\"], \
    \"members\":{ \
    \"FunctionName\":{ \
    \"shape\":\"FunctionName\", \
    \"location\":\"uri\", \
    \"locationName\":\"FunctionName\", \
    \"documentation\":\"<p>The Lambda function name. You can specify an unqualified function name (for example, \\\"Thumbnail\\\") or you can specify Amazon Resource Name (ARN) of the function (for example, \\\"arn:aws:lambda:us-west-2:account-id:function:ThumbNail\\\"). AWS Lambda also allows you to specify only the account ID qualifier (for example, \\\"account-id:Thumbnail\\\"). Note that the length constraint applies only to the ARN. If you specify only the function name, it is limited to 64 character in length. </p>\" \
    }, \
    \"CodeSha256\":{ \
    \"shape\":\"String\", \
    \"documentation\":\"<p>The SHA256 hash of the deployment package you want to publish. This provides validation on the code you are publishing. If you provide this parameter value must match the SHA256 of the HEAD version for the publication to succeed. </p>\" \
    }, \
    \"Description\":{ \
    \"shape\":\"Description\", \
    \"documentation\":\"<p> The description for the version you are publishing. If not provided, AWS Lambda copies the description from the HEAD version. </p>\" \
    } \
    } \
    }, \
    \"Qualifier\":{ \
    \"type\":\"string\", \
    \"min\":1, \
    \"max\":128, \
    \"pattern\":\"(|[a-zA-Z0-9$_]+)\" \
    }, \
    \"RemovePermissionRequest\":{ \
    \"type\":\"structure\", \
    \"required\":[ \
    \"FunctionName\", \
    \"StatementId\" \
    ], \
    \"members\":{ \
    \"FunctionName\":{ \
    \"shape\":\"FunctionName\", \
    \"location\":\"uri\", \
    \"locationName\":\"FunctionName\", \
    \"documentation\":\"<p>Lambda function whose resource policy you want to remove a permission from.</p> <p> You can specify an unqualified function name (for example, \\\"Thumbnail\\\") or you can specify Amazon Resource Name (ARN) of the function (for example, \\\"arn:aws:lambda:us-west-2:account-id:function:ThumbNail\\\"). AWS Lambda also allows you to specify only the account ID qualifier (for example, \\\"account-id:Thumbnail\\\"). Note that the length constraint applies only to the ARN. If you specify only the function name, it is limited to 64 character in length. </p>\" \
    }, \
    \"StatementId\":{ \
    \"shape\":\"StatementId\", \
    \"location\":\"uri\", \
    \"locationName\":\"StatementId\", \
    \"documentation\":\"<p>Statement ID of the permission to remove.</p>\" \
    }, \
    \"Qualifier\":{ \
    \"shape\":\"Qualifier\", \
    \"location\":\"querystring\", \
    \"locationName\":\"Qualifier\", \
    \"documentation\":\"<p>You can specify this optional parameter to remove permission associated with a specific function version or function alias. The value of this paramter is the function version or alias name. If you don't specify this parameter, the API removes permission associated with the unqualified function ARN.</p>\" \
    } \
    } \
    }, \
    \"RequestTooLargeException\":{ \
    \"type\":\"structure\", \
    \"members\":{ \
    \"Type\":{\"shape\":\"String\"}, \
    \"message\":{\"shape\":\"String\"} \
    }, \
    \"error\":{\"httpStatusCode\":413}, \
    \"exception\":true, \
    \"documentation\":\"<p>The request payload exceeded the <code>Invoke</code> request body JSON input limit. For more information, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/limits.html\\\">Limits</a> </p>\" \
    }, \
    \"ResourceConflictException\":{ \
    \"type\":\"structure\", \
    \"members\":{ \
    \"Type\":{\"shape\":\"String\"}, \
    \"message\":{\"shape\":\"String\"} \
    }, \
    \"error\":{\"httpStatusCode\":409}, \
    \"exception\":true, \
    \"documentation\":\"<p>The resource already exists.</p>\" \
    }, \
    \"ResourceNotFoundException\":{ \
    \"type\":\"structure\", \
    \"members\":{ \
    \"Type\":{\"shape\":\"String\"}, \
    \"Message\":{\"shape\":\"String\"} \
    }, \
    \"error\":{\"httpStatusCode\":404}, \
    \"exception\":true, \
    \"documentation\":\"<p>The resource (for example, a Lambda function or access policy statement) specified in the request does not exist.</p>\" \
    }, \
    \"RoleArn\":{ \
    \"type\":\"string\", \
    \"pattern\":\"arn:aws:iam::\\\\d{12}:role/?[a-zA-Z_0-9+=,.@\\\\-_/]+\" \
    }, \
    \"Runtime\":{ \
    \"type\":\"string\", \
    \"enum\":[ \
    \"nodejs\", \
    \"java8\", \
    \"python2.7\" \
    ] \
    }, \
    \"S3Bucket\":{ \
    \"type\":\"string\", \
    \"min\":3, \
    \"max\":63, \
    \"pattern\":\"^[0-9A-Za-z\\\\.\\\\-_]*(?<!\\\\.)$\" \
    }, \
    \"S3Key\":{ \
    \"type\":\"string\", \
    \"min\":1, \
    \"max\":1024 \
    }, \
    \"S3ObjectVersion\":{ \
    \"type\":\"string\", \
    \"min\":1, \
    \"max\":1024 \
    }, \
    \"ServiceException\":{ \
    \"type\":\"structure\", \
    \"members\":{ \
    \"Type\":{\"shape\":\"String\"}, \
    \"Message\":{\"shape\":\"String\"} \
    }, \
    \"error\":{\"httpStatusCode\":500}, \
    \"exception\":true, \
    \"documentation\":\"<p>The AWS Lambda service encountered an internal error.</p>\" \
    }, \
    \"SourceOwner\":{ \
    \"type\":\"string\", \
    \"pattern\":\"\\\\d{12}\" \
    }, \
    \"StatementId\":{ \
    \"type\":\"string\", \
    \"min\":1, \
    \"max\":100, \
    \"pattern\":\"([a-zA-Z0-9-_]+)\" \
    }, \
    \"String\":{\"type\":\"string\"}, \
    \"Timeout\":{ \
    \"type\":\"integer\", \
    \"min\":1, \
    \"max\":60 \
    }, \
    \"Timestamp\":{\"type\":\"string\"}, \
    \"TooManyRequestsException\":{ \
    \"type\":\"structure\", \
    \"members\":{ \
    \"retryAfterSeconds\":{ \
    \"shape\":\"String\", \
    \"location\":\"header\", \
    \"locationName\":\"Retry-After\", \
    \"documentation\":\"<p>The number of seconds the caller should wait before retrying.</p>\" \
    }, \
    \"Type\":{\"shape\":\"String\"}, \
    \"message\":{\"shape\":\"String\"} \
    }, \
    \"error\":{\"httpStatusCode\":429}, \
    \"exception\":true \
    }, \
    \"UnsupportedMediaTypeException\":{ \
    \"type\":\"structure\", \
    \"members\":{ \
    \"Type\":{\"shape\":\"String\"}, \
    \"message\":{\"shape\":\"String\"} \
    }, \
    \"error\":{\"httpStatusCode\":415}, \
    \"exception\":true, \
    \"documentation\":\"<p>The content type of the <code>Invoke</code> request body is not JSON.</p>\" \
    }, \
    \"UpdateAliasRequest\":{ \
    \"type\":\"structure\", \
    \"required\":[ \
    \"FunctionName\", \
    \"Name\" \
    ], \
    \"members\":{ \
    \"FunctionName\":{ \
    \"shape\":\"FunctionName\", \
    \"location\":\"uri\", \
    \"locationName\":\"FunctionName\", \
    \"documentation\":\"<p>The function name for which the alias is created.</p>\" \
    }, \
    \"Name\":{ \
    \"shape\":\"Alias\", \
    \"location\":\"uri\", \
    \"locationName\":\"Name\", \
    \"documentation\":\"<p>The alias name.</p>\" \
    }, \
    \"FunctionVersion\":{ \
    \"shape\":\"Version\", \
    \"documentation\":\"<p>Using this parameter you can optionally change the Lambda function version to which the alias to points to.</p>\" \
    }, \
    \"Description\":{ \
    \"shape\":\"Description\", \
    \"documentation\":\"<p>You can optionally change the description of the alias using this parameter.</p>\" \
    } \
    } \
    }, \
    \"UpdateEventSourceMappingRequest\":{ \
    \"type\":\"structure\", \
    \"required\":[\"UUID\"], \
    \"members\":{ \
    \"UUID\":{ \
    \"shape\":\"String\", \
    \"location\":\"uri\", \
    \"locationName\":\"UUID\", \
    \"documentation\":\"<p>The event source mapping identifier.</p>\" \
    }, \
    \"FunctionName\":{ \
    \"shape\":\"FunctionName\", \
    \"documentation\":\"<p>The Lambda function to which you want the stream records sent.</p> <p> You can specify an unqualified function name (for example, \\\"Thumbnail\\\") or you can specify Amazon Resource Name (ARN) of the function (for example, \\\"arn:aws:lambda:us-west-2:account-id:function:ThumbNail\\\"). AWS Lambda also allows you to specify only the account ID qualifier (for example, \\\"account-id:Thumbnail\\\"). Note that the length constraint applies only to the ARN. If you specify only the function name, it is limited to 64 character in length. </p>\" \
    }, \
    \"Enabled\":{ \
    \"shape\":\"Enabled\", \
    \"documentation\":\"<p>Specifies whether AWS Lambda should actively poll the stream or not. If disabled, AWS Lambda will not poll the stream.</p>\" \
    }, \
    \"BatchSize\":{ \
    \"shape\":\"BatchSize\", \
    \"documentation\":\"<p>The maximum number of stream records that can be sent to your Lambda function for a single invocation.</p>\" \
    } \
    } \
    }, \
    \"UpdateFunctionCodeRequest\":{ \
    \"type\":\"structure\", \
    \"required\":[\"FunctionName\"], \
    \"members\":{ \
    \"FunctionName\":{ \
    \"shape\":\"FunctionName\", \
    \"location\":\"uri\", \
    \"locationName\":\"FunctionName\", \
    \"documentation\":\"<p>The existing Lambda function name whose code you want to replace.</p> <p> You can specify an unqualified function name (for example, \\\"Thumbnail\\\") or you can specify Amazon Resource Name (ARN) of the function (for example, \\\"arn:aws:lambda:us-west-2:account-id:function:ThumbNail\\\"). AWS Lambda also allows you to specify only the account ID qualifier (for example, \\\"account-id:Thumbnail\\\"). Note that the length constraint applies only to the ARN. If you specify only the function name, it is limited to 64 character in length. </p>\" \
    }, \
    \"ZipFile\":{ \
    \"shape\":\"Blob\", \
    \"documentation\":\"<p>Based64-encoded .zip file containing your packaged source code.</p>\" \
    }, \
    \"S3Bucket\":{ \
    \"shape\":\"S3Bucket\", \
    \"documentation\":\"<p>Amazon S3 bucket name where the .zip file containing your deployment package is stored. This bucket must reside in the same AWS region where you are creating the Lambda function.</p>\" \
    }, \
    \"S3Key\":{ \
    \"shape\":\"S3Key\", \
    \"documentation\":\"<p>The Amazon S3 object (the deployment package) key name you want to upload. </p>\" \
    }, \
    \"S3ObjectVersion\":{ \
    \"shape\":\"S3ObjectVersion\", \
    \"documentation\":\"<p>The Amazon S3 object (the deployment package) version you want to upload.</p>\" \
    }, \
    \"Publish\":{ \
    \"shape\":\"Boolean\", \
    \"documentation\":\"<p>This boolean parameter can be used to request AWS Lambda to update the Lambda function and publish a version as an atomic operation. </p>\" \
    } \
    } \
    }, \
    \"UpdateFunctionConfigurationRequest\":{ \
    \"type\":\"structure\", \
    \"required\":[\"FunctionName\"], \
    \"members\":{ \
    \"FunctionName\":{ \
    \"shape\":\"FunctionName\", \
    \"location\":\"uri\", \
    \"locationName\":\"FunctionName\", \
    \"documentation\":\"<p>The name of the Lambda function.</p> <p> You can specify an unqualified function name (for example, \\\"Thumbnail\\\") or you can specify Amazon Resource Name (ARN) of the function (for example, \\\"arn:aws:lambda:us-west-2:account-id:function:ThumbNail\\\"). AWS Lambda also allows you to specify only the account ID qualifier (for example, \\\"account-id:Thumbnail\\\"). Note that the length constraint applies only to the ARN. If you specify only the function name, it is limited to 64 character in length. </p>\" \
    }, \
    \"Role\":{ \
    \"shape\":\"RoleArn\", \
    \"documentation\":\"<p>The Amazon Resource Name (ARN) of the IAM role that Lambda will assume when it executes your function. </p>\" \
    }, \
    \"Handler\":{ \
    \"shape\":\"Handler\", \
    \"documentation\":\"<p>The function that Lambda calls to begin executing your function. For Node.js, it is the <i>module-name.export</i> value in your function. </p>\" \
    }, \
    \"Description\":{ \
    \"shape\":\"Description\", \
    \"documentation\":\"<p>A short user-defined function description. AWS Lambda does not use this value. Assign a meaningful description as you see fit.</p>\" \
    }, \
    \"Timeout\":{ \
    \"shape\":\"Timeout\", \
    \"documentation\":\"<p>The function execution time at which AWS Lambda should terminate the function. Because the execution time has cost implications, we recommend you set this value based on your expected execution time. The default is 3 seconds. </p>\" \
    }, \
    \"MemorySize\":{ \
    \"shape\":\"MemorySize\", \
    \"documentation\":\"<p>The amount of memory, in MB, your Lambda function is given. AWS Lambda uses this memory size to infer the amount of CPU allocated to your function. Your function use-case determines your CPU and memory requirements. For example, a database operation might need less memory compared to an image processing function. The default value is 128 MB. The value must be a multiple of 64 MB.</p>\" \
    } \
    } \
    }, \
    \"Version\":{ \
    \"type\":\"string\", \
    \"min\":1, \
    \"max\":1024, \
    \"pattern\":\"(\\\\$LATEST|[0-9]+)\" \
    } \
    }, \
    \"examples\":{ \
    } \
    } \
    \
    ";
}

@end
