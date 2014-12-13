#import "HitboxJSONResponse.h"


@class HitboxAuthorization;


@interface HitboxAuthTokenResponse : HitboxJSONResponse

@property (nonatomic, strong, readonly) HitboxAuthorization *authorization;

@end
