#import <Foundation/Foundation.h>


@interface HitboxStreamIngest : NSObject

- (instancetype)initWithURL:(NSURL *)URL name:(NSString *)name;

@property (nonatomic, copy, readonly) NSURL *URL;
@property (nonatomic, copy, readonly) NSString *name;

- (NSURL *)URLWithStreamPath:(NSString *)streamPath;

@end
