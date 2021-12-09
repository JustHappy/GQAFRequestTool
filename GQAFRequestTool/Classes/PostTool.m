#import "PostTool.h"



NSString *const ResponseErrorKey = @"com.alamofire.serialization.response.error.response";
NSInteger const Interval = 3;

@interface PostTool ()

@end

@implementation PostTool

//[mgr.requestSerializer setValue: @"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];

//[mgr.requestSerializer setValue:@"Basic YXJtbzphcm1vX3NlY3JldA==" forHTTPHeaderField:@"Authorization"];
+ (void)PostWithURL:(NSString *)url Params:(NSDictionary *)params success:(SuccessBlock)success failure:(FailureBlock)failure With:(UIViewController *)VC{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"POST"];
    //设置本次请求的数据请求格式
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (data) {
            //利用iOS自带原生JSON解析data数据 保存为Dictionary
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            success(dict);
            
        }else{
            NSHTTPURLResponse *httpResponse = error.userInfo[ResponseErrorKey];
            
            if (httpResponse.statusCode != 0) {
                NSLog(@"code--suc:%ld",(long)httpResponse.statusCode);
                NSString *ResponseStr = [NSString stringWithFormat:@"%ld",httpResponse.statusCode];
                failure(ResponseStr);
                
            } else {
                NSString *ErrorCode = [NSString stringWithFormat:@"%ld",error.code];
                NSLog(@"code--suc:%ld",(long)httpResponse.statusCode);
                failure(ErrorCode);
            }
        }
    }];
    [task resume];
    
}
+ (void)PostWithJSONDataURL:(NSString *)url Params:(NSDictionary *)params success:(SuccessBlock)success failure:(FailureBlock)failure With:(UIViewController *)VC{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"POST"];
    NSData * jsonData = [NSJSONSerialization dataWithJSONObject:params options:NSJSONWritingPrettyPrinted error:nil];
    [request setHTTPBody:jsonData];
    //设置本次请求的数据请求格式
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (data) {
            //利用iOS自带原生JSON解析data数据 保存为Dictionary
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            success(dict);
            
        }else{
            NSHTTPURLResponse *httpResponse = error.userInfo[ResponseErrorKey];
            
            if (httpResponse.statusCode != 0) {
                NSLog(@"code--suc:%ld",(long)httpResponse.statusCode);
                NSString *ResponseStr = [NSString stringWithFormat:@"%ld",httpResponse.statusCode];
                failure(ResponseStr);
                
            } else {
                NSString *ErrorCode = [NSString stringWithFormat:@"%ld",error.code];
                NSLog(@"code--suc:%ld",(long)httpResponse.statusCode);
                failure(ErrorCode);
            }
        }
    }];
    [task resume];
}
+ (void)PostWithHeadFileURL:(NSString *)url Params:(NSDictionary *)params value:(NSString *)value success:(SuccessBlock)success failure:(FailureBlock)failure With:(UIViewController *)VC{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"POST"];
    //设置本次请求的数据请求格式
//    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:value forHTTPHeaderField:@"Authorization"];
    NSData * jsonData = [NSJSONSerialization dataWithJSONObject:params options:NSJSONWritingPrettyPrinted error:nil];
    [request setHTTPBody:jsonData];
    
    NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (data) {
            //利用iOS自带原生JSON解析data数据 保存为Dictionary
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            success(dict);
            
        }else{
            NSHTTPURLResponse *httpResponse = error.userInfo[ResponseErrorKey];
            
            if (httpResponse.statusCode != 0) {
                NSLog(@"code--suc:%ld",(long)httpResponse.statusCode);
                NSString *ResponseStr = [NSString stringWithFormat:@"%ld",httpResponse.statusCode];
                failure(ResponseStr);
                
            } else {
                NSString *ErrorCode = [NSString stringWithFormat:@"%ld",error.code];
                NSLog(@"code--suc:%ld",(long)httpResponse.statusCode);
                failure(ErrorCode);
            }
        }
    }];
    [task resume];
}
@end
