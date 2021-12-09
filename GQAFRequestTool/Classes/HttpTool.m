////
////  HttpTool.m
////  HZ12315
////
////  Created by ZRAR on 21/10/26.
////  Copyright (c) 2021年 ZRAR. All rights reserved.
////
//
//#import "HttpTool.h"
//#import "BaseHttpTool.h"
//
//@implementation HttpTool
//
//
///**
// * 非用户敏感get请求
// */
//+ (void)getWithPath:(NSString *)path params:(NSDictionary *)params success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure
//{
//    // 拼接sign参数
//   // NSDictionary *allParams = [self jointParamsWithDict:params withUserid:NO];
//    
//    // 拼接url
////    NSString *netPath = [NSString stringWithFormat:@"%@/%@",kBaseUrl,path];
//    
//    [BaseHttpTool get:path params:params success:success failure:failure];
//}
//+ (void)getWithHeadFiledPath:(NSString *)path params:(NSDictionary *)params headValue:(NSString *)value success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure{
//    [BaseHttpTool get:path params:params headValue:value success:success failure:failure];
//}
//
///**
// * 非用户敏感POST请求
// */
//+ (void)postWithPath:(NSString *)path params:(NSDictionary *)params success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure
//{
//    //NSDictionary *allParams = [self jointParamsWithDict:params withUserid:NO];
////    NSString *netPath = [NSString stringWithFormat:@"%@/%@",kBaseUrl,path];
//    [BaseHttpTool post:path params:params success:success failure:failure];
//    
//}
//
//+ (void)postWithHeadFiledPath:(NSString *)path params:(NSDictionary *)params headValue:(NSString *)value success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure{
//    [BaseHttpTool post:path params:params headValue:value success:success failure:failure];
//}
//
//+ (void)putWithHeadFiledPath:(NSString *)path params:(NSDictionary *)params headValue:(NSString *)value success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure{
//    [BaseHttpTool put:path params:params headValue:value success:success failure:failure];
//}
//@end
