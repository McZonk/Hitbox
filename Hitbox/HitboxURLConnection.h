#import <Foundation/Foundation.h>

@class HitboxURLRequest;
@class HitboxURLResponse;
@protocol HitboxAuthorization;


typedef void(^HitboxURLConnectionCompletionHandler)(HitboxURLResponse *response, NSError *error);


@interface HitboxURLConnection : NSOperation

- (instancetype)initWithRequest:(HitboxURLRequest *)request queue:(dispatch_queue_t)queue completionHandler:(HitboxURLConnectionCompletionHandler)completionHandler;

@end
