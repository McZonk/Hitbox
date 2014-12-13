#import "HitboxStreamIngestResponse.h"

#import "HitboxStreamIngest.h"


@interface HitboxStreamIngestResponse ()

@property (nonatomic, strong) HitboxStreamIngest *defaultIngest;
@property (nonatomic, copy) NSArray *ingests;

@property (nonatomic, copy) NSString *streamName;
@property (nonatomic, copy) NSString *streamKey;
@property (nonatomic, copy) NSString *streamPath;

@end


@implementation HitboxStreamIngestResponse

- (instancetype)initWithRequest:(HitboxURLRequest *)request JSON:(NSDictionary *)JSON error:(NSError **)error
{
	self = [super initWithRequest:request];
	if(self != nil)
	{
		//NSLog(@"%@", JSON);
		
		{
			NSString *JSONURL = JSON[@"stream_default_ingest_url"];
			if([JSONURL isKindOfClass:NSString.class])
			{
				HitboxStreamIngest *ingest = [[HitboxStreamIngest alloc] initWithURL:[NSURL URLWithString:JSONURL] name:@"Default"];
				self.defaultIngest = ingest;
			}
		}
		
		NSArray *JSONingests = JSON[@"stream_ingest_list"];
		if([JSONingests isKindOfClass:NSArray.class])
		{
			NSMutableArray *ingests = [NSMutableArray arrayWithCapacity:JSONingests.count];
			
			for(NSDictionary *JSONingest in JSONingests)
			{
				if([JSONingest isKindOfClass:NSDictionary.class])
				{
					NSString *JSONURL = JSONingest[@"ingest_url"];
					NSString *JSONName = JSONingest[@"ingest_location"];
					
					if([JSONURL isKindOfClass:NSString.class] && [JSONName isKindOfClass:NSString.class])
					{
						HitboxStreamIngest *ingest = [[HitboxStreamIngest alloc] initWithURL:[NSURL URLWithString:JSONURL] name:JSONName];
						[ingests addObject:ingest];
					}
				}
			}
			
			self.ingests = ingests;
		}
		
		NSString *streamName = JSON[@"stream_name"];
		if([streamName isKindOfClass:NSString.class])
		{
			self.streamName = streamName;
		}
		
		NSString *streamKey = JSON[@"stream_key"];
		if([streamKey isKindOfClass:NSString.class])
		{
			self.streamKey = streamKey;
		}
		
		NSString *streamPath = JSON[@"stream_path"];
		if([streamPath isKindOfClass:NSString.class])
		{
			self.streamPath = streamPath;
		}
	}
	return self;
}

@end
