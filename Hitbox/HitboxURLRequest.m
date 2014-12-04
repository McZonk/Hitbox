#import "HitboxURLRequest.h"

#import "HitboxURLResponse.h"


@implementation HitboxURLRequest

+ (NSURL *)baseURL
{
	return [NSURL URLWithString:@"http://api.hitbox.tv/"];
}

+ (NSString *)URLEncodedStringWithParameters:(NSDictionary *)parameters
{
	NSMutableString *string = [NSMutableString string];
	for(NSString *key in parameters)
	{
		NSString *object = parameters[key];
		
		if(string.length > 0)
		{
			[string appendString:@"&"];
		}
		
		[string appendString:[key stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
		[string appendString:@"="];
		[string appendString:[object stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
	}
	
	return string;
}

+ (NSData *)URLEncodedDataWithParameters:(NSDictionary *)parameters
{
	return [[self URLEncodedStringWithParameters:parameters] dataUsingEncoding:NSUTF8StringEncoding];
}

- (instancetype)init
{
	self = [super init];
	if(self != nil)
	{
		
	}
	return self;
}

- (Class)responseClass
{
	return HitboxURLResponse.class;
}

- (NSURL *)URL
{
	return self.class.baseURL;
}

- (NSMutableURLRequest *)URLRequest
{
	return [NSMutableURLRequest requestWithURL:self.URL cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:15.0];
}

- (NSString *)description
{
	return [NSString stringWithFormat:@"<%@: %p %@>", self.class, self, self.URL];
}

@end
