//
//  HTTPRequest.h
//  Network
//
//  Created by LiliEhuu on 16/11/30.
//  Copyright © 2016年 LiliEhuu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^HTTPRequestCallback)(NSURLSessionDataTask *task, id data, NSError *error);

@interface HTTPRequest : NSObject

/**
 *  初始化请求
 */
+ (instancetype)request;

/**
 *  根据链接参数创建url
 */
- (NSString *)createHTTPUrlWithAPIName:(NSString *)apiName parms:(NSDictionary *)parmsDic encoding:(BOOL)encoding;

/**
 *  http get请求
 */
- (NSURLSessionDataTask *)GET:(NSString *)url parameters:(id)parms finish:(HTTPRequestCallback)finishUsingBlock;

/**
 *  http post请求
 */
- (NSURLSessionDataTask *)POST:(NSString *)url parameters:(id)parms finish:(HTTPRequestCallback)finishUsingBlock;


@end
