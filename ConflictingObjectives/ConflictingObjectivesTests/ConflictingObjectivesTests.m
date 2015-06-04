//
//  ConflictingObjectivesTests.m
//  ConflictingObjectivesTests
//
//  Created by Prateek Khandelwal on 5/20/15.
//  Copyright (c) 2015 Prateek Khandelwal. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "ConflictingObjectivesHelper.h"

@interface ConflictingObjectivesTests : XCTestCase

@end

@implementation ConflictingObjectivesTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testWordsWithParticularLengthFromTwoSmallerWordsConcatenationFromWordsSet {
  NSSet *wordsSet = [NSSet setWithObjects:@"abcdef", @"ab", @"cdef", @"fedcba", @"fed", @"cba", nil];
  ConflictingObjectivesHelper *conflictingObjectivesHelper = [[ConflictingObjectivesHelper alloc] init];
  NSArray *resultantWordsArray = [conflictingObjectivesHelper wordsWithLength:6
                                 fromTwoSmallerWordsConcatenationFromWordsSet:wordsSet];
  NSArray *expectedWordsArray = @[@"fedcba", @"abcdef"];
  XCTAssertEqualObjects(resultantWordsArray, expectedWordsArray);
}

@end
