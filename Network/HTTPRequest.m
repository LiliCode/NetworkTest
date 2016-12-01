//
//  HTTPRequest.m
//  Network
//
//  Created by LiliEhuu on 16/11/30.
//  Copyright © 2016年 LiliEhuu. All rights reserved.
//

#import "HTTPRequest.h"
#import <AFNetworking.h>


#define IP @"http://192.168.0.177:80/llms/"
#define APIVersion @"apiv4/"


@interface HTTPRequest ()
@property (strong , nonatomic) AFHTTPSessionManager *manager;

@end

@implementation HTTPRequest

+ (instancetype)request
{
    return [[self alloc] init];
}

- (instancetype)init
{
    if (self = [super init])
    {
        
    }
    
    return self;
}

- (AFHTTPSessionManager *)manager
{
    if (!_manager)
    {
        _manager = [AFHTTPSessionManager manager];
        //自己配置
        //请求序列化
        AFJSONRequestSerializer *serializerRequest = [AFJSONRequestSerializer serializer];
        [serializerRequest setValue:@"text/html; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
        [serializerRequest setValue:@"ios" forHTTPHeaderField:@"OS"];
        //响应序列化
        AFJSONResponseSerializer *serializerResponse = [AFJSONResponseSerializer serializer];
        serializerResponse.readingOptions = NSJSONReadingAllowFragments;
        //Add @'text/html' and 'application/json' for 'acceptableContentTypes'.
        serializerResponse.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html", nil];
        //安全策略
        _manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        //设置请求序列化
        [_manager setRequestSerializer:serializerRequest];
        //设置响应序列化
        [_manager setResponseSerializer:serializerResponse];
        //设置请求超时时间
        [_manager.requestSerializer setTimeoutInterval:30];
    }
    
    return _manager;
}


- (NSString *)createHTTPUrlWithAPIName:(NSString *)apiName parms:(NSDictionary *)parmsDic encoding:(BOOL)encoding
{
    NSAssert(apiName, @"链接名称不能为空!");
    //以邻邻项目为准
    NSString *baseUrl = [IP stringByAppendingString:APIVersion];
    NSString *appdParms = [apiName stringByAppendingString:@"Html_Acc=2000003&Html_Pass=D24F2155653FA582E63112FF3BD83B70"]; //拼接拦截器参数
    for (NSString *key in parmsDic.allKeys)
    {
        appdParms = [appdParms stringByAppendingString:[NSString stringWithFormat:@"&%@=%@", key, parmsDic[key]]];
    }
    
    NSString *url = [baseUrl stringByAppendingString:appdParms];
    if (encoding)
    {
        url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    }
    
    return url;
}

- (NSURLSessionDataTask *)GET:(NSString *)url parameters:(id)parms finish:(HTTPRequestCallback)finishUsingBlock
{
    return [self.manager GET:url parameters:parms progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (finishUsingBlock)
        {
            NSError *error = nil;
            NSDictionary *result = [self parseResponse:responseObject error:&error];
            finishUsingBlock(task, result, error);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (finishUsingBlock)
        {
            finishUsingBlock(task, nil, error);
        }
    }];
}

- (NSURLSessionDataTask *)POST:(NSString *)url parameters:(id)parms finish:(HTTPRequestCallback)finishUsingBlock
{
    return [self.manager POST:url parameters:parms progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (finishUsingBlock)
        {
            NSError *error = nil;
            NSDictionary *result = [self parseResponse:responseObject error:&error];
            finishUsingBlock(task, result, error);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (finishUsingBlock)
        {
            finishUsingBlock(task, nil, error);
        }
    }];
}

/**
 *  解析响应
 */
- (NSDictionary *)parseResponse:(id)responseObject error:(NSError **)error
{
    NSMutableDictionary *info = [responseObject mutableCopy];
    //根据邻邻项目后端响应结果解析
    if ([info[@"response"] isEqualToString:@"error"])
    {
        *error = [NSError errorWithDomain:@"" code:[info[@"errorCode"] intValue] userInfo:@{NSLocalizedDescriptionKey : info[@"msg"]}];
        
        return nil;
    }
    
    [info removeObjectForKey:@"response"];
    
    return [info copy];
}




@end
