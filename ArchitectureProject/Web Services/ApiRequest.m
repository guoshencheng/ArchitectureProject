//
//  ApiRequest.m
//  ArchitectureProject
//
//  Created by guoshencheng on 6/16/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "ApiRequest.h"

@implementation ApiRequest

#pragma mrak - PublicMethod

- (NSString *)assembleParameters {
    NSMutableArray *parts = [NSMutableArray array];
    for (NSString *key in [self.parameters allKeys]) {
        NSString *part = [NSString stringWithFormat:@"%@=%@", key, [self.parameters valueForKey:key]];
        [parts addObject: part];
    }
    
    return [parts componentsJoinedByString: @"&"];
}

#pragma mark - FactoryMethod

+ (instancetype)requestForTestServer {
    ApiRequest *request = [self defaultRequest];
    request.url = @"http://10.0.2.217:8888/api";
    request.parameters = @{@"id":@"books" };
    return  request;
}

#pragma mark - Private Methods

+ (instancetype)defaultRequest {
    ApiRequest *request = [[ApiRequest alloc] init];
    request.method = ApiRequestMethodGet;
    request.parameters = [NSMutableDictionary dictionary];
    return request;
}

@end
