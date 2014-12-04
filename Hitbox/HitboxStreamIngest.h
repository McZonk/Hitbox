#import <Foundation/Foundation.h>


@interface HitboxStreamIngest : NSObject

- (instancetype)initWithURL:(NSURL *)URL name:(NSString *)name;

@property (nonatomic, copy, readonly) NSURL *URL;
@property (nonatomic, copy, readonly) NSString *name;

/**
 * Builds a full URL
 * @param streamPath use HitboxStreamIngestResponse.streamPath as parameter
 * @return URL to stream to including the stream key
 */
- (NSURL *)URLWithStreamPath:(NSString *)streamPath;

@end
