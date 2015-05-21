//
//  AnagramHelper.m
//  Anagrams
//
//  Created by Prateek Khandelwal on 5/15/15.
//  Copyright (c) 2015 Prateek Khandelwal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AnagramHelper.h"

@implementation AnagramHelper

- (NSArray *)wordsFromFileNamed:(NSString *)filename extension:(NSString *)extension {
  NSString *filePath = [[NSBundle mainBundle] pathForResource:filename ofType:extension];
  NSString *fileContents = [NSString stringWithContentsOfFile:filePath
                                                     encoding:NSISOLatin1StringEncoding
                                                        error:nil];
  return [fileContents componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
}

- (NSDictionary *)anagramDictionaryFromWords:(NSArray *)words {
  NSMutableDictionary *anagramDictionary = [[NSMutableDictionary alloc] init];
  for (NSString *word in words) {
    NSMutableArray *charArray = [NSMutableArray arrayWithCapacity:word.length];
    for (int i = 0; i < word.length; i++) {
      NSString *charStr = [word substringWithRange:NSMakeRange(i, 1)];
      [charArray addObject:charStr];
    }
    [charArray sortUsingComparator:^(NSString *a, NSString *b) {
      return [a compare:b];
    }];
    NSMutableString *result = [[NSMutableString alloc] init];
    for (NSObject *obj in charArray) {
      [result appendString:[obj description]];
    }
    if (anagramDictionary[result] != nil) {
      NSMutableArray *anagramArray = [[NSMutableArray alloc] initWithArray:anagramDictionary[result]];
      [anagramArray addObject:word];
      anagramDictionary[result] = anagramArray;
    } else {
      anagramDictionary[result] = @[word];
    }
  }
  return anagramDictionary;
}

- (void)printAnagramsFromAnagramDictionary:(NSDictionary *)anagramDictionary {
  for(NSString *key in [anagramDictionary allKeys]) {
    if ([anagramDictionary[key] count] > 1) {
      NSLog(@"%@", anagramDictionary[key]);
    }
  }
}

- (NSUInteger)totalAnagramsFromAnagramDictionary:(NSDictionary *)anagramDictionary {
  NSUInteger count = 0;
  for(NSString *key in [anagramDictionary allKeys]) {
    if ([anagramDictionary[key] count] > 1) {
      count++;
    }
  }
  return count;
}

- (NSString *)largestAnagramFromAnagramDictionary:(NSDictionary *)anagramDictionary {
  NSString *largetAnagramString = @"";
  for(NSString *key in [anagramDictionary allKeys] ) {
    if ([anagramDictionary[key] count] > 1 && largetAnagramString.length < key.length) {
      largetAnagramString = [anagramDictionary[key] firstObject];
    }
  }
  return largetAnagramString;
}

- (NSArray *)largestAnagramsArrayFromAnagramDictionary:(NSDictionary *)anagramDictionary {
  NSUInteger count = 0;
  NSArray *largestAnagramsArray = [[NSArray alloc] init];
  for(NSString *key in [anagramDictionary allKeys]) {
    if (count < [anagramDictionary[key] count]) {
      count = [anagramDictionary[key] count];
      largestAnagramsArray = anagramDictionary[key];
    }
  }
  return largestAnagramsArray;
}

@end
