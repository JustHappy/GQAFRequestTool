//
//  BaseHttpTool.h
//  HZ12315
//
//  Created by ZRAR on 21/10/26.
//  Copyright (c) 2021年 ZRAR. All rights reserved.
//
// 适用于 AFNetWorking 4.0.1   pod 'AFNetworking', '~> 4.0.1'

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>



@interface HttpTool : NSObject


/// get 方式请求数据
/// @param path 请求路径
/// @param params 请求参数
/// @param success 请求成功后的回调（请将请求成功后想做的事情写到这个block中）
/// @param failure 请求失败后的回调（请将请求失败后想做的事情写到这个block中）
/// @param VC 当前控制器
+ (void)getWithPath:(NSString *)path params:(NSDictionary *)params success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure With:(UIViewController *)VC;


/// get 带请求头文件的数据请求方式
/// @param path 请求路径
/// @param params 请求参数
/// @param value 请求头head 的value值
/// @param success 请求成功后的回调（请将请求成功后想做的事情写到这个block中）
/// @param failure 请求失败后的回调（请将请求失败后想做的事情写到这个block中）
/// @param VC 当前控制器
+ (void)getWithHeadFiledPath:(NSString *)path params:(NSDictionary *)params headValue:(NSString *)value success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure With:(UIViewController *)VC;


/// post 方式请求数据
/// @param path 请求路径
/// @param params 请求参数
/// @param success 请求成功后的回调（请将请求成功后想做的事情写到这个block中）
/// @param failure 请求失败后的回调（请将请求失败后想做的事情写到这个block中）
/// @param VC 当前控制器
+ (void)postWithPath:(NSString *)path params:(NSDictionary *)params success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure With:(UIViewController *)VC;

/// post 带请求头文件的数据请求方式
/// @param path 请求路径
/// @param params 请求参数
/// @param value 请求头head 的value值
/// @param success 请求成功后的回调（请将请求成功后想做的事情写到这个block中）
/// @param failure 请求失败后的回调（请将请求失败后想做的事情写到这个block中）
/// @param VC 当前控制器
+ (void)postWithHeadFiledPath:(NSString *)path params:(NSDictionary *)params headValue:(NSString *)value success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure With:(UIViewController *)VC;

/// put 带请求头文件的数据请求方式
/// @param path 请求路径
/// @param params 请求参数
/// @param value 请求头head 的value值
/// @param success 请求成功后的回调（请将请求成功后想做的事情写到这个block中）
/// @param failure 请求失败后的回调（请将请求失败后想做的事情写到这个block中）
/// @param VC 当前控制器
+ (void)putWithHeadFiledPath:(NSString *)path params:(NSDictionary *)params headValue:(NSString *)value success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure With:(UIViewController *)VC;
@end
