#import "HitboxJSONResponse.h"


@class HitboxAuthToken;


@interface HitboxAuthTokenResponse : HitboxJSONResponse

@property (nonatomic, strong, readonly) HitboxAuthToken *authToken;

@end
