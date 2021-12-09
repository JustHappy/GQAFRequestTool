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
//+ (void)getWithPath:(NSString *)path params:(NSDictionary *)params success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure With:(UIViewController *)VC
//{
//    // 拼接sign参数
//   // NSDictionary *allParams = [self jointParamsWithDict:params withUserid:NO];
//    
//    // 拼接url
////    NSString *netPath = [NSString stringWithFormat:@"%@/%@",kBaseUrl,path];
//    
//    [BaseHttpTool get:path params:params success:success failure:failure With:VC];
//}
//+ (void)getWithHeadFiledPath:(NSString *)path params:(NSDictionary *)params headValue:(NSString *)value success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure With:(UIViewController *)VC{
//    [BaseHttpTool get:path params:params headValue:value success:success failure:failure With:VC];
//}
//
///**
// * 非用户敏感POST请求
// */
//+ (void)postWithPath:(NSString *)path params:(NSDictionary *)params success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure With:(UIViewController *)VC
//{
//    //NSDictionary *allParams = [self jointParamsWithDict:params withUserid:NO];
////    NSString *netPath = [NSString stringWithFormat:@"%@/%@",kBaseUrl,path];
//    [BaseHttpTool post:path params:params success:success failure:failure With:VC];
//    
//}
//
//+ (void)postWithHeadFiledPath:(NSString *)path params:(NSDictionary *)params headValue:(NSString *)value success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure With:(UIViewController *)VC{
//    [BaseHttpTool post:path params:params headValue:value success:success failure:failure With:VC];
//}
//
//+ (void)putWithHeadFiledPath:(NSString *)path params:(NSDictionary *)params headValue:(NSString *)value success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure With:(UIViewController *)VC{
//    [BaseHttpTool put:path params:params headValue:value success:success failure:failure With:VC];
//}
//@end
