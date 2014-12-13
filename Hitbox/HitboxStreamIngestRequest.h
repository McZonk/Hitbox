#import "HitboxJSONRequest.h"

@class HitboxAuthorization;


@interface HitboxStreamIngestRequest : HitboxJSONRequest

- (instancetype)initWithAuthorization:(HitboxAuthorization *)authorization;

@end
