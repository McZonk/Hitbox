#import <Foundation/Foundation.h>


@class HitboxURLRequest;


@interface HitboxURLResponse : NSObject

- (instancetype)initWithRequest:(HitboxURLRequest *)request NS_DESIGNATED_INITIALIZER;

- (instancetype)initWithRequest:(HitboxURLRequest *)request data:(NSData *)data error:(NSError **)error;

/**
 * The request that originates the response
 */
@property (nonatomic, strong, readonly) HitboxURLRequest *request;

/**
 * May be nil in case a subclass parsed the data into more usable objects
 */
@property (nonatomic, copy, readonly) NSData *data;

@end
