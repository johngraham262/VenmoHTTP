#import <Foundation/Foundation.h>

typedef void(^VenmoHTTPJSONCompletionHandler)(NSURLResponse *response, id body, NSError *error);

@interface VenmoHTTPJSON : NSObject

+ (NSOperationQueue *)operationQueue;

//+ (void)sendAsynchronousRequest:(NSURLRequest *)request
//                          queue:(NSOperationQueue*) queue
//              completionHandler:(void (^)(NSURLResponse*, NSData*, NSError*)) handler NS_AVAILABLE(10_7, 5_0);

// GET
//+ (void)getPath:(NSString *)path completionHandler:(VenmoHTTPJSONCompletionHandler)handler;
//+ (void)getPath:(NSString *)path queue:(NSOperationQueue *)queue completionHandler:(VenmoHTTPJSONCompletionHandler)handler;
//
//+ (void)getPath:(NSString *)path parameters:(NSDictionary *)parameters completionHandler:(VenmoHTTPJSONCompletionHandler)handler;
//+ (void)getPath:(NSString *)path queue:(NSOperationQueue *)queue parameters:(NSDictionary *)parameters completionHandler:(VenmoHTTPJSONCompletionHandler)handler;

+ (void)getURL:(NSURL *)path completionHandler:(VenmoHTTPJSONCompletionHandler)handler;
+ (void)getURL:(NSURL *)path queue:(NSOperationQueue *)queue completionHandler:(VenmoHTTPJSONCompletionHandler)handler;

//+ (void)getURL:(NSURL *)path parameters:(NSDictionary *)parameters completionHandler:(VenmoHTTPJSONCompletionHandler)handler;
//+ (void)getURL:(NSURL *)path queue:(NSOperationQueue *)queue parameters:(NSDictionary *)parameters completionHandler:(VenmoHTTPJSONCompletionHandler)handler;

//// POST
//+ (void)postPath:(NSString *)path completionHandler:(VenmoHTTPJSONCompletionHandler)handler;
//+ (void)postPath:(NSString *)path queue:(NSOperationQueue *)queue completionHandler:(VenmoHTTPJSONCompletionHandler)handler;
//
//+ (void)postPath:(NSString *)path parameters:(NSDictionary *)parameters completionHandler:(VenmoHTTPJSONCompletionHandler)handler;
//+ (void)postPath:(NSString *)path queue:(NSOperationQueue *)queue parameters:(NSDictionary *)parameters completionHandler:(VenmoHTTPJSONCompletionHandler)handler;
//
//+ (void)postPath:(NSURL *)path completionHandler:(VenmoHTTPJSONCompletionHandler)handler;
//+ (void)postPath:(NSURL *)path queue:(NSOperationQueue *)queue completionHandler:(VenmoHTTPJSONCompletionHandler)handler;
//
//+ (void)postPath:(NSURL *)path parameters:(NSDictionary *)parameters completionHandler:(VenmoHTTPJSONCompletionHandler)handler;
//+ (void)postPath:(NSURL *)path queue:(NSOperationQueue *)queue parameters:(NSDictionary *)parameters completionHandler:(VenmoHTTPJSONCompletionHandler)handler;

@end
