#import "HitboxJSONResponse.h"


@interface HitboxJSONResponse ()

@property (nonatomic, copy) NSDictionary *JSON;

@end


@implementation HitboxJSONResponse

- (instancetype)initWithRequest:(HitboxURLRequest *)request data:(NSData *)data error:(NSError **)error
{
	id JSON = [NSJSONSerialization JSONObjectWithData:data options:0 error:error];
	if(JSON == nil)
	{
		return nil;
	}
	
	return [self initWithRequest:request JSON:JSON error:error];
	return self;
}

- (instancetype)initWithRequest:(HitboxURLRequest *)request JSON:(NSDictionary *)JSON error:(NSError **)error
{
	self = [super initWithRequest:request];
	if(self != nil)
	{
		self.JSON = JSON;
	}
	return self;
}

- (NSString *)description
{
	return [NSString stringWithFormat:@"<%@: %p JSON:%@>", self.class, self, self.JSON];
}

@end
