//
//  ConflictingObjectivesHelper.m
//  ConflictingObjectives
//
//  Created by Prateek Khandelwal on 5/20/15.
//  Copyright (c) 2015 Prateek Khandelwal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ConflictingObjectivesHelper.h"

@implementation ConflictingObjectivesHelper

- (NSSet *)wordsSetFromFileNamed:(NSString *)fileName extension:(NSString *)extension {
  NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:extension];
  NSString *fileContents = [NSString stringWithContentsOfFile:filePath
                                                     encoding:NSISOLatin1StringEncoding
                                                        error:nil];
  NSArray *wordsArray = [fileContents componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
  return [NSSet setWithArray:wordsArray];
}

- (NSArray *)wordsWithLength:(NSUInteger)wordLength
fromTwoSmallerWordsConcatenationFromWordsSet:(NSSet *)wordsSet {
  BOOL wordFound;
  NSString *wordFirstPart;
  NSString *wordSecondPart;
  NSMutableArray *wordsArray = [[NSMutableArray alloc] init];
  for (NSString *word in wordsSet) {
    wordFound = NO;
    if (word.length == wordLength) {
      for (NSUInteger breakWordAtIndex = 1; breakWordAtIndex < word.length; breakWordAtIndex++) {
        wordFirstPart = [word substringToIndex:breakWordAtIndex];
        wordSecondPart = [word substringFromIndex:breakWordAtIndex];
        if ([wordsSet member:wordFirstPart] != nil && [wordsSet member:wordSecondPart] != nil) {
          wordFound = YES;
          break;
        }
      }
      if (wordFound) {
        [wordsArray addObject:word];
        //NSLog(@"%@ + %@ = %@", wordFirstPart, wordSecondPart, word);
      }
    }
  }
  return wordsArray;
}

@end
