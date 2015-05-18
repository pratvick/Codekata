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

- (NSArray *)wordsFromDictionary {
  NSString *filePath = [[NSBundle mainBundle] pathForResource:@"wordlist" ofType:@"txt"];
  NSError *error;
  NSString *fileContents = [NSString stringWithContentsOfFile:filePath
                                                     encoding:NSISOLatin1StringEncoding
                                                        error:&error];
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
    NSLog(@"%@", anagramDictionary[key]);
  }
}

- (NSString *)largestAnagramFromAnagramDictionary:(NSDictionary *)anagramDictionary {
  NSString *largetAnagramString = @"";
  for(NSString *key in [anagramDictionary allKeys] ) {
    if (largetAnagramString.length < key.length) {
      largetAnagramString = [anagramDictionary[key] firstObject];
    }
  }
  return largetAnagramString;
}

- (NSArray *)anagramsArrayHavingMostNumberOfWordsFromAnagramDictionary:(NSDictionary *)anagramDictionary {
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
