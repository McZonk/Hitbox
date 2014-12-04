#import "HitboxURLResponse.h"

@interface HitboxJSONResponse : HitboxURLResponse

- (instancetype)initWithRequest:(HitboxURLRequest *)request JSON:(NSDictionary *)JSON error:(NSError **)error;

@property (nonatomic, copy, readonly) NSDictionary *JSON;

@end
