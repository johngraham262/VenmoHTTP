#import "VenmoHTTPJSON.h"

@implementation VenmoHTTPJSON

+ (NSOperationQueue *)operationQueue {
    static NSOperationQueue *operationQueue;
    static dispatch_once_t pred;
    
    if (operationQueue) return operationQueue;
    
    dispatch_once(&pred, ^{
        operationQueue = [NSOperationQueue alloc];
        operationQueue = [operationQueue init];
    });
    
    return operationQueue;
}

+ (void)getURL:(NSURL *)url completionHandler:(VenmoHTTPJSONCompletionHandler)handler {
    [self getURL:url queue:[self operationQueue] completionHandler:handler];
}

+ (void)getURL:(NSURL *)url queue:(NSOperationQueue *)queue
completionHandler:(VenmoHTTPJSONCompletionHandler)handler {
    void (^namedHandler)(NSURLResponse *, NSData *, NSError *);
    namedHandler = ^(NSURLResponse *response, NSData *data, NSError *error) {
        id body = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
        handler(response, body, error);
    };
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:queue
                           completionHandler:namedHandler];
}

@end
