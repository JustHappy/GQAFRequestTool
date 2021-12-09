//
//  HttpTool.h
//  HZ12315
//
//  Created by ZRAR on 21/10/26.
//  Copyright (c) 2021年 ZRAR. All rights reserved.
//
// 适用于 AFNetWorking 4.0.1   pod 'AFNetworking', '~> 4.0.1'

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#ifdef DEBUG  //调试状态

#define AFLog(...) NSLog(__VA_ARGS__)

#else //发布状态

#define AFLog(...)

#endif

@interface BaseHttpTool : NSObject





/// get 方式请求数据
/// @param url 请求路径
/// @param params 请求参数
/// @param success 请求成功后的回调（请将请求成功后想做的事情写到这个block中
/// @param failure 请求失败后的回调（请将请求失败后想做的事情写到这个block中
/// @param VC 当前控制器
+ (void)get:(NSString *)url params:(NSDictionary *)params success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure With:(UIViewController *)VC;


/// get 带请求头文件的数据请求方式
/// @param url 请求路径
/// @param params 请求参数
/// @param value 请求头head 的value值
/// @param success 请求成功后的回调（请将请求成功后想做的事情写到这个block中）
/// @param failure 请求失败后的回调（请将请求失败后想做的事情写到这个block中）
/// @param VC 当前控制器
+ (void)get:(NSString *)url params:(NSDictionary *)params headValue:(NSString *) value success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure With:(UIViewController *)VC;


/// post 方式请求数据
/// @param url 请求路径
/// @param params 请求参数
/// @param success 请求成功后的回调（请将请求成功后想做的事情写到这个block中）
/// @param failure 请求失败后的回调（请将请求失败后想做的事情写到这个block中）
/// @param VC 当前控制器
+ (void)post:(NSString *)url params:(NSDictionary *)params success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure With:(UIViewController *)VC;


/// post 文件数据方式提交数据
/// @param url 请求路径
/// @param params 请求参数
/// @param data 需要上传的文件数据
/// @param fileName 需要上传的文件名
/// @param mimeType 需要上传的文件格式
/// @param success 请求成功后的回调（请将请求成功后想做的事情写到这个block中）
/// @param failure 请求失败后的回调（请将请求失败后想做的事情写到这个block中）
/// @param VC 当前控制器
+ (void)postWithData:(NSString *)url params:(NSDictionary *)params data:(NSData *)data fileName:(NSString *)fileName mimeType:(NSString *)mimeType success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure With:(UIViewController *)VC;

/// post 文件路径方式提交数据
/// @param url 请求路径
/// @param params 请求参数
/// @param filePath 需要上传的文件路径
/// @param fileName 需要上传的文件名
/// @param mimeType 需要上传的文件格式
/// @param success 请求成功后的回调（请将请求成功后想做的事情写到这个block中）
/// @param failure 请求失败后的回调（请将请求失败后想做的事情写到这个block中）
/// @param VC 当前控制器
+ (void)postWithFilePath:(NSString *)url params:(NSDictionary *)params dataFilePath:(NSString *)filePath fileName:(NSString *)fileName mimeType:(NSString *)mimeType success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure With:(UIViewController *)VC;


/// post 带请求头文件的数据请求方式
/// @param url 请求路径
/// @param params 请求参数
/// @param value 请求头head的value值
/// @param success 请求成功后的回调（请将请求成功后想做的事情写到这个block中）
/// @param failure 请求失败后的回调（请将请求失败后想做的事情写到这个block中）
/// @param VC 当前控制器
+ (void)post:(NSString *)url params:(NSDictionary *)params headValue:(NSString *) value success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure With:(UIViewController *)VC;



/// put 带请求头文件的数据请求方式
/// @param url 请求路径
/// @param params 请求参数
/// @param value 请求头head的value值
/// @param success 请求成功后的回调（请将请求成功后想做的事情写到这个block中）
/// @param failure 请求失败后的回调（请将请求失败后想做的事情写到这个block中）
/// @param VC 当前控制器
+ (void)put:(NSString *)url params:(NSDictionary *)params headValue:(NSString *) value success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure With:(UIViewController *)VC;
@end
