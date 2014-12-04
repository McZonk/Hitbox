#import "HitboxAuthTokenResponse.h"

#import "HitboxAuthToken.h"
#import "HitboxAuthTokenRequest.h"


@interface HitboxAuthTokenResponse ()

@property (nonatomic, strong) HitboxAuthToken *authToken;

@end


@implementation HitboxAuthTokenResponse

- (instancetype)initWithRequest:(HitboxURLRequest *)request JSON:(NSDictionary *)JSON error:(NSError **)error
{
	self = [super initWithRequest:request];
	if(self != nil)
	{
		NSString *username = ((HitboxAuthTokenRequest *)request).username;
		if(username == nil)
		{
			// TODO: error handling
			return nil;
		}
		
		NSString *authToken = JSON[@"authToken"];
		if(authToken == nil)
		{
			// TODO: error handling
			return nil;
		}
		
		self.authToken = [[HitboxAuthToken alloc] initWithUsername:username authToken:authToken];
	}
	return self;
}

@end
