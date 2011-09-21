#import "VenmoSpecs.h"

@interface VenmoHTTPJSONSpecs : SenTestCase

@end

#import "VenmoHTTPJSON.h"

@implementation VenmoHTTPJSONSpecs

- (void)specOperationQueue {
    NSOperationQueue *returnedQueue = [VenmoHTTPJSON operationQueue];
    VMAssertNotNil(returnedQueue);
    VMAssertTrue([returnedQueue isMemberOfClass:[NSOperationQueue class]]);
    VMAssertEquals(returnedQueue, [VenmoHTTPJSON operationQueue]);
}

- (void)specGetURLCompletionHandler {
    id mockSelf = [OCMockObject mockForClass:[VenmoHTTPJSON class]];
    
}

- (void)specGetURLQueueCompletionHandler {
    id mockURLConnection = [OCMockObject mockForClass:[NSURLConnection class]];
    NSURL *url = [[NSURL alloc] init];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    VenmoHTTPJSONCompletionHandler handler = ^(NSURLResponse *response, id body, NSError *error) {};
    
//    typedef void(^VenmoHTTPJSONCompletionHandler)(NSURLResponse *response, id body, NSError *error);

    void (^namedHandler)(NSURLResponse *, NSData *, NSError *);
    namedHandler = ^(NSURLResponse *response, NSData *data, NSError *error) {
        id body = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
        handler(response, body, error);
    };
    
    [[[mockURLConnection expect] andReturn:nil] sendAsynchronousRequest:request 
                                                                  queue:queue
                                                      completionHandler:namedHandler];
    [VenmoHTTPJSON getURL:url queue:queue completionHandler:handler];
}
//error: specGetURLQueueCompletionHandler (VenmoHTTPJSONSpecs) failed: *** -[NSProxy doesNotRecognizeSelector:sendAsynchronousRequest:queue:completionHandler:] called!



//- (void)testControllerSetsUpCellCorrectly {
//	RootViewController *controller = [[RootViewController alloc] initWithStyle:UITableViewStylePlain];
//	id mockTableView = [OCMockObject mockForClass:[UITableView class]];
//	[[[mockTableView expect] andReturn:nil] dequeueReusableCellWithIdentifier:@"HelloWorldCell"];
//    
//	UITableViewCell *cell = [controller tableView:mockTableView cellForRowAtIndexPath:nil];
//    
//	STAssertNotNil(cell, @"returns a cell");
//	STAssertEqualObjects(@"Hello World!", cell.textLabel.text, @"sets label");
//	[mockTableView verify];
//}

@end
