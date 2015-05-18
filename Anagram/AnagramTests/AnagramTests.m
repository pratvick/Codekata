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

- (void)testExample {
  NSArray *words = @[@"abcd", @"abc", @"adcb", @"acd", @"acb"];
  AnagramHelper *anagramHelper = [[AnagramHelper alloc] init];
  NSDictionary *anagramDictionary = [anagramHelper anagramDictionaryFromWords:words];
  XCTAssertEqual([anagramDictionary count], 3);
  NSArray *anagramArray = @[@"abcd", @"adcb"];
  XCTAssertEqualObjects(anagramDictionary[@"abcd"], anagramArray);
}

@end
