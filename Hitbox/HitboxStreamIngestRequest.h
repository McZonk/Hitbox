#import "HitboxJSONRequest.h"

@class HitboxAuthToken;


@interface HitboxStreamIngestRequest : HitboxJSONRequest

- (instancetype)initWithAuthToken:(HitboxAuthToken *)authToken;

@end
