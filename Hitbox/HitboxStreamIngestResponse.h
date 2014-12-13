#import "HitboxJSONResponse.h"


@class HitboxStreamIngest;


@interface HitboxStreamIngestResponse : HitboxJSONResponse

@property (nonatomic, strong, readonly) HitboxStreamIngest *defaultIngest;
@property (nonatomic, copy, readonly) NSArray *ingests;

@property (nonatomic, copy, readonly) NSString *streamName;
@property (nonatomic, copy, readonly) NSString *streamKey;
@property (nonatomic, copy, readonly) NSString *streamPath;

@end
