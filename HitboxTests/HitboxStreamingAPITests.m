//
//  HitboxTests.m
//  HitboxTests
//
//  Created by Maximilian Christ on 03/12/14.
//  Copyright (c) 2014 McZonk. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>

#import "Hitbox.h"

#import "HitboxLogin.h"


static HitboxAuthToken *sharedAuthToken = nil;


@interface HitboxTests : XCTestCase

@property (nonatomic, strong) HitboxAuthToken *authToken;

@end


@implementation HitboxTests

- (void)setUp
{
	[super setUp];
}

- (void)tearDown
{
	[super tearDown];
}

- (void)testAuthToken
{
	XCTestExpectation *expectation = [self expectationWithDescription:[NSString stringWithFormat:@"%s", __FUNCTION__]];
	
	HitboxAuthTokenRequest *request = [[HitboxAuthTokenRequest alloc] initWithUsername:HITBOX_TEST_USERNAME password:HITBOX_TEST_PASSWORD applicationIdentifier:HITBOX_TEST_APPLICATIONIDENTIFIER];
	
	HitboxURLConnection *connection = [[HitboxURLConnection alloc] initWithRequest:request queue:nil completionHandler:^(HitboxURLResponse *response, NSError *error) {
		XCTAssert(response != nil);
		XCTAssert(error == nil, @"%@", error);
		XCTAssert([response isKindOfClass:HitboxAuthTokenResponse.class]);
		
		HitboxAuthTokenResponse *authTokenResponse = (HitboxAuthTokenResponse *)response;
		
		HitboxAuthToken *authToken = authTokenResponse.authToken;
		
		XCTAssert(authToken != nil);
		XCTAssert(authToken.username != nil);
		XCTAssert(authToken.authToken != nil);
		
		sharedAuthToken = authToken;
		
		[expectation fulfill];
	}];
	[HitboxURLConnection.sharedOperationQueue addOperation:connection];
	
	[self waitForExpectationsWithTimeout:30.0 handler:^(NSError *error) {
		[connection cancel];
	}];
}

- (void)testStreamIngest
{
	XCTestExpectation *expectation = [self expectationWithDescription:[NSString stringWithFormat:@"%s", __FUNCTION__]];

	HitboxAuthToken *authToken = sharedAuthToken;

	XCTAssert(authToken != nil);
	
	HitboxStreamIngestRequest *request = [[HitboxStreamIngestRequest alloc] initWithAuthToken:authToken];
	
	HitboxURLConnection *connection = [[HitboxURLConnection alloc] initWithRequest:request queue:nil completionHandler:^(HitboxURLResponse *response, NSError *error) {
		XCTAssert(response != nil);
		XCTAssert(error == nil, @"%@", error);
		XCTAssert([response isKindOfClass:HitboxStreamIngestResponse.class]);
		
		HitboxStreamIngestResponse *streamingIngestResponse = (HitboxStreamIngestResponse *)response;
		
		XCTAssert(streamingIngestResponse.streamName != nil);
		XCTAssert(streamingIngestResponse.streamKey != nil);
		XCTAssert(streamingIngestResponse.streamPath != nil);
		
		NSArray *ingests = streamingIngestResponse.ingests;
		
		XCTAssert(ingests.count > 0);
		
		HitboxStreamIngest *ingest = ingests.firstObject;
		
		XCTAssert(ingest.URL != nil);
		XCTAssert(ingest.name != nil);
		
		NSURL *streamURL = [ingest URLWithStreamPath:streamingIngestResponse.streamPath];
		
		XCTAssert(streamURL != nil);
		
		[expectation fulfill];
	}];
	[HitboxURLConnection.sharedOperationQueue addOperation:connection];
	
	[self waitForExpectationsWithTimeout:30.0 handler:^(NSError *error) {
		[connection cancel];
	}];
}

@end
