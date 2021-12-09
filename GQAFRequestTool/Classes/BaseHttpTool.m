 //
//  HttpTool.m
//  HZ12315
//
//  Created by ZRAR on 21/10/26.
//  Copyright (c) 2021年 ZRAR. All rights reserved.
//

#import "BaseHttpTool.h"
//#import "AFNetworking.h"
#import "AFNetworking.h"

@implementation BaseHttpTool

+ (void)get:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html; charset=utf-8",@"application/json", @"text/json", @"text/javascript",@"text/plain; charset=utf-8",@"application/octet-stream",nil];
    mgr.responseSerializer.acceptableContentTypes = [mgr.responseSerializer.acceptableContentTypes setByAddingObject:@"text/plain"];
    mgr.responseSerializer.acceptableContentTypes = [mgr.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    AFLog(@"++++++++%@------%@",url,params);
    [mgr GET:url parameters:params headers:@{} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSHTTPURLResponse * responses = (NSHTTPURLResponse *)task.response;
        AFLog(@"成功状态码:%ld", responses.statusCode );
        AFLog(@"44444nocookie%@",responseObject);
       [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        if (success) {
            
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSHTTPURLResponse * responses = (NSHTTPURLResponse *)task.response;
        AFLog(@"error状态码:%ld---%@", responses.statusCode ,error);
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        if (failure) {
            failure(error);
        }
    }];
    
}
+ (void)get:(NSString *)url params:(NSDictionary *)params headValue:(NSString *) value success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html; charset=utf-8",@"application/json", @"text/json", @"text/javascript",@"text/plain; charset=utf-8",@"application/octet-stream",nil];
    mgr.responseSerializer.acceptableContentTypes = [mgr.responseSerializer.acceptableContentTypes setByAddingObject:@"text/plain"];
    mgr.responseSerializer.acceptableContentTypes = [mgr.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    
    mgr.requestSerializer = [AFHTTPRequestSerializer serializer];
    [mgr.requestSerializer setValue:value forHTTPHeaderField:@"Authorization"];
    
    AFLog(@"++++++++%@------%@",url,params);
    
    
    [mgr GET:url parameters:params headers:@{} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSHTTPURLResponse * responses = (NSHTTPURLResponse *)task.response;
        AFLog(@"成功状态码:%ld", responses.statusCode );
        AFLog(@"44444nocookie%@",responseObject);
       [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        if (success) {
            
            success(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSHTTPURLResponse * responses = (NSHTTPURLResponse *)task.response;
        AFLog(@"error状态码:%ld---%@", responses.statusCode ,error);
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        if (failure) {
            failure(error);
        }
    }];
}


+ (void)post:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html; charset=utf-8",@"application/json", @"text/json", @"text/javascript",@"text/plain; charset=utf-8",@"text/html",nil];
    mgr.responseSerializer.acceptableContentTypes = [mgr.responseSerializer.acceptableContentTypes setByAddingObject:@"text/plain"];
    mgr.responseSerializer.acceptableContentTypes = [mgr.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    
    [mgr POST:url parameters:params headers:@{} constructingBodyWithBlock:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
        if (success) {
            success (responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        if (failure) {
            failure(error);
        }
        
    }];

}

+(void)postWithData:(NSString *)url params:(NSDictionary *)params data:(NSData *)data fileName:(NSString *)fileName mimeType:(NSString *)mimeType success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    mgr.requestSerializer.timeoutInterval = 20;
    mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain", @"multipart/form-data", @"application/json", @"text/html", @"image/jpeg", @"image/png", @"application/octet-stream", @"text/json", nil];
    
    mgr.requestSerializer = [AFHTTPRequestSerializer serializer];
    [mgr POST:url parameters:params headers:@{} constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileData:data name:@"file" fileName:fileName mimeType:mimeType];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        AFLog(@"上传进度------%@", uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success (responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

+(void)postWithFilePath:(NSString *)url params:(NSDictionary *)params dataFilePath:(NSString *)filePath fileName:(NSString *)fileName mimeType:(NSString *)mimeType success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    mgr.requestSerializer.timeoutInterval = 20;
    mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain", @"multipart/form-data", @"application/json", @"text/html", @"image/jpeg", @"image/png", @"application/octet-stream", @"text/json", nil];
    
    mgr.requestSerializer = [AFHTTPRequestSerializer serializer];
    [mgr POST:url parameters:params headers:@{} constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        NSData * data = [NSData dataWithContentsOfFile:filePath];
        [formData appendPartWithFileData:data name:@"file" fileName:fileName mimeType:mimeType];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        AFLog(@"上传进度------%@", uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success (responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}
+ (void)post:(NSString *)url params:(NSDictionary *)params headValue:(NSString *) value success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html; charset=utf-8",@"application/json", @"text/json", @"text/javascript",@"text/plain; charset=utf-8",@"text/html",nil];
     mgr.responseSerializer.acceptableContentTypes = [mgr.responseSerializer.acceptableContentTypes setByAddingObject:@"text/plain"];
    mgr.responseSerializer.acceptableContentTypes = [mgr.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    
    mgr.requestSerializer = [AFHTTPRequestSerializer serializer];
    [mgr.requestSerializer setValue:value forHTTPHeaderField:@"Authorization"];
    
    
    [mgr POST:url parameters:params headers:@{} constructingBodyWithBlock:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
        if (success) {
            success (responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        if (failure) {
            failure(error);
        }
        
    }];
}


+ (void)put:(NSString *)url params:(NSDictionary *)params headValue:(NSString *) value success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html; charset=utf-8",@"application/json", @"text/json", @"text/javascript",@"text/plain; charset=utf-8",@"text/html",nil];
     mgr.responseSerializer.acceptableContentTypes = [mgr.responseSerializer.acceptableContentTypes setByAddingObject:@"text/plain"];
    mgr.responseSerializer.acceptableContentTypes = [mgr.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    
    mgr.requestSerializer = [AFHTTPRequestSerializer serializer];
    [mgr.requestSerializer setValue:value forHTTPHeaderField:@"Authorization"];
    [mgr PUT:url parameters:params headers:@{} success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
        if (success) {
            success (responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        if (failure) {
            failure(error);
        }
    }];
    
    
}
@end
