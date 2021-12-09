#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#ifdef DEBUG  //调试状态

#define AFLog(...) NSLog(__VA_ARGS__)

#else //发布状态

#define AFLog(...)

#endif

typedef void (^SuccessBlock)(id responseObject);
typedef void (^FailureBlock)(NSString *error);


@interface PostTool : NSObject

/// POST 系统自带的网络请求格式
/// @param url 请求路径
/// @param params 请求参数
/// @param success 请求成功后的回调（请将请求成功后想做的事情写到这个block中）
/// @param failure 请求失败后的回调（请将请求失败后想做的事情写到这个block中）
+ (void)PostWithURL:(NSString *)url Params:(NSDictionary *)params success:(SuccessBlock)success failure:(FailureBlock)failure;

/// JSON字符串POST 系统自带的网络请求格式
/// @param url 请求地址
/// @param params 请求参数
/// @param success 请求成功后的回调（请将请求成功后想做的事情写到这个block中）
/// @param failure 请求失败后的回调（请将请求失败后想做的事情写到这个block中）
+ (void)PostWithJSONDataURL:(NSString *)url Params:(NSDictionary *)params success:(SuccessBlock)success failure:(FailureBlock)failure;

/// 带请求头的POST 系统自带的网络请求格式
/// @param url 请求地址
/// @param params 请求参数
/// @param value 请求头head对应的value值
/// @param success 请求成功后的回调（请将请求成功后想做的事情写到这个block中）
/// @param failure 请求失败后的回调（请将请求失败后想做的事情写到这个block中）
+ (void)PostWithHeadFileURL:(NSString *)url Params:(NSDictionary *)params value:(NSString *)value success:(SuccessBlock)success failure:(FailureBlock)failure;

@end

