//
//  AnagramTests.m
//  AnagramTests
//
//  Created by Prateek Khandelwal on 5/18/15.
//  Copyright (c) 2015 Prateek Khandelwal. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "AnagramHelper.h"

@interface AnagramTests : XCTestCase

@end

@implementation AnagramTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testAnagramDictionaryFromWordsArray {
  NSArray *words = @[@"abcd", @"abc", @"adcb", @"acd", @"acb"];
  AnagramHelper *anagramHelper = [[AnagramHelper alloc] init];
  NSDictionary *anagramDictionary = [anagramHelper anagramDictionaryFromWords:words];
  XCTAssertEqual([anagramDictionary count], 3);
  NSArray *anagramArray = @[@"abcd", @"adcb"];
  XCTAssertEqualObjects(anagramDictionary[@"abcd"], anagramArray);
  anagramArray = @[@"abc", @"acb"];
  XCTAssertEqualObjects(anagramDictionary[@"abc"], anagramArray);
  anagramArray = @[@"acd"];
  XCTAssertEqualObjects(anagramDictionary[@"acd"], anagramArray);
  NSArray *emptyWordsArray = @[];
  anagramDictionary = [anagramHelper anagramDictionaryFromWords:emptyWordsArray];
  XCTAssertEqual([anagramDictionary count], 0);
}

- (void)testTotalAnagramsFromWordsArray {
  NSArray *words = @[@"abcd", @"adbc", @"adcb", @"abc", @"acb"];
  AnagramHelper *anagramHelper = [[AnagramHelper alloc] init];
  NSDictionary *anagramDictionary = [anagramHelper anagramDictionaryFromWords:words];
  XCTAssertEqual([anagramHelper totalAnagramsFromAnagramDictionary:anagramDictionary], 2);
}


- (void)testLargestAnagramArrayFromWordsArray {
  NSArray *words = @[@"abcd", @"adbc", @"adcb", @"abc", @"acb"];
  AnagramHelper *anagramHelper = [[AnagramHelper alloc] init];
  NSDictionary *anagramDictionary = [anagramHelper anagramDictionaryFromWords:words];
  NSArray *largestAnagramArray = [anagramHelper largestAnagramsArrayFromAnagramDictionary:anagramDictionary];
  NSArray *anagramsArray = @[@"abcd", @"adbc", @"adcb"];
  XCTAssertEqualObjects(largestAnagramArray, anagramsArray);
}

- (void)testLargestWordFromAllAnagramsArray {
  NSArray *words = @[@"abcde", @"adbcef", @"adcbe", @"abc", @"acb"];
  AnagramHelper *anagramHelper = [[AnagramHelper alloc] init];
  NSDictionary *anagramDictionary = [anagramHelper anagramDictionaryFromWords:words];
  XCTAssertEqual([anagramHelper largestAnagramFromAnagramDictionary:anagramDictionary], @"abcde");
}

@end
