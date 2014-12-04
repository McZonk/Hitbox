#import <Foundation/Foundation.h>


@interface HitboxURLRequest : NSObject

+ (NSURL *)baseURL;

+ (NSString *)URLEncodedStringWithParameters:(NSDictionary *)parameters;
+ (NSData *)URLEncodedDataWithParameters:(NSDictionary *)parameters;

- (instancetype)init;

- (Class)responseClass;

- (NSURL *)URL;

- (NSMutableURLRequest *)URLRequest;

@end
