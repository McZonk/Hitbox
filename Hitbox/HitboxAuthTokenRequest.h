#import "HitboxJSONRequest.h"


@interface HitboxAuthTokenRequest : HitboxJSONRequest

- (instancetype)initWithUsername:(NSString *)username password:(NSString *)password applicationIdentifier:(NSString *)applicationIdentifier;

@property (nonatomic, strong, readonly) NSString *username;
@property (nonatomic, strong, readonly) NSString *password;
@property (nonatomic, strong, readonly) NSString *applicationIdentifier;

@end
