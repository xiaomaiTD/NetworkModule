//
//  NetworkClient.m
//  NetworkModule
//
//  Created by 张国忠 on 2018/2/4.
//  Copyright © 2018年 张国忠. All rights reserved.
//

#import "APIClient.h"

@implementation APIClient

+ (APIClient *)httpClient {
    static APIClient *httpClient;
    static dispatch_once_t networkOnceToken;
    dispatch_once(&networkOnceToken, ^{
        httpClient = [[self alloc] init];
        httpClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        httpClient.responseSerializer = [AFHTTPResponseSerializer serializer];
        httpClient.requestSerializer.timeoutInterval = 20;
        //[httpClient.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        //[httpClient.requestSerializer setValue:@"" forHTTPHeaderField:@"User-Agent"];
    });
    return httpClient;
}

@end
