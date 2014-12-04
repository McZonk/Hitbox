#import "HitboxAuthTokenRequest.h"

#import "HitboxAuthTokenResponse.h"


@interface HitboxAuthTokenRequest ()

@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *password;
@property (nonatomic, strong) NSString *applicationIdentifier;

@end


@implementation HitboxAuthTokenRequest

- (instancetype)initWithUsername:(NSString *)username password:(NSString *)password applicationIdentifier:(NSString *)applicationIdentifier
{
	self = [super init];
	if(self != nil)
	{
		self.username = username;
		self.password = password;
		self.applicationIdentifier = applicationIdentifier;
	}
	return self;
}

- (Class)responseClass
{
	return HitboxAuthTokenResponse.class;
}

- (NSURL *)URL
{
	return [self.class.baseURL URLByAppendingPathComponent:@"auth/token"];
}

- (NSMutableURLRequest *)URLRequest
{
	//curl -X POST --data "login=Username&pass=Secretpassword&app=desktop" http://api.hitbox.tv/auth/token
	
	NSMutableURLRequest *URLRequest = super.URLRequest;
	
	NSDictionary *parameters = @{
		@"login": self.username,
		@"pass": self.password,
		@"app": self.applicationIdentifier,
	};
	
	URLRequest.HTTPMethod = @"POST";
	URLRequest.HTTPBody = [self.class URLEncodedDataWithParameters:parameters];
	[URLRequest addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
	
	return URLRequest;
}

@end
