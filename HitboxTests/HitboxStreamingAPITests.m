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


static HitboxAuthorization *sharedAuthorization = nil;


@interface HitboxTests : XCTestCase

@property (nonatomic, strong) HitboxAuthorization *authToken;

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
		
		HitboxAuthorization *authorization = authTokenResponse.authorization;
		
		XCTAssert(authorization != nil);
		XCTAssert(authorization.username != nil);
		XCTAssert(authorization.authToken != nil);
		
		sharedAuthorization = authorization;
		
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

	HitboxAuthorization *authorization = sharedAuthorization;

	XCTAssert(authToken != nil);
	
	HitboxStreamIngestRequest *request = [[HitboxStreamIngestRequest alloc] initWithAuthorization:authorization];
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
