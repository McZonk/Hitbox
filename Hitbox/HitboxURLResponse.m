#import "HitboxURLResponse.h"

@interface HitboxURLResponse ()

@property (nonatomic, strong) HitboxURLRequest *request;
@property (nonatomic, copy) NSData *data;

@end


@implementation HitboxURLResponse

- (instancetype)initWithRequest:(HitboxURLRequest *)request
{
	self = [super init];
	if(self != nil)
	{
		self.request = request;
	}
	return self;
}

- (instancetype)initWithRequest:(HitboxURLRequest *)request data:(NSData *)data error:(NSError **)error;
{
	self = [self initWithRequest:request];
	if(self != nil)
	{
		self.data = data;
	}
	return self;
}

- (NSString *)description
{
	return [NSString stringWithFormat:@"<%@: %p data:%llu>", self.class, self, (unsigned long long)self.data.length];
}

@end
