//
//  ConflictingObjectivesHelper.m
//  ConflictingObjectives
//
//  Created by Prateek Khandelwal on 5/20/15.
//  Copyright (c) 2015 Prateek Khandelwal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ConflictingObjectivesHelper.h"
#import "NSArray+PermutationAdditions.h"

@interface ConflictingObjectivesHelper()

@property (readwrite) NSSet *wordsSet;

@end

@implementation ConflictingObjectivesHelper

- (void)setupWordsSetFromFileNamed:(NSString *)fileName extension:(NSString *)extension {
  NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:extension];
  NSString *fileContents = [NSString stringWithContentsOfFile:filePath
                                                     encoding:NSISOLatin1StringEncoding
                                                        error:nil];
  NSArray *wordsArray = [fileContents componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
  self.wordsSet = [NSSet setWithArray:wordsArray];
}

/**
 Most readable code
 */
- (NSArray *)wordsOfLengthSixFromConcatenationOfTwoSmallerWordsFromWordsSet {
  NSMutableArray *wordsArray = [[NSMutableArray alloc] init];
  for (NSString *word in self.wordsSet) {
    BOOL wordFound = NO;
    if (word.length == 6) {
      for (NSUInteger breakWordAtIndex = 1; breakWordAtIndex < word.length; breakWordAtIndex++) {
        NSString *wordFirstPart = [word substringToIndex:breakWordAtIndex];
        NSString *wordSecondPart = [word substringFromIndex:breakWordAtIndex];
        if ([self.wordsSet member:wordFirstPart] != nil && [self.wordsSet member:wordSecondPart] != nil) {
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

/**
 Most efficient code
 */
- (NSArray *)wordsOfLengthSixFromConcatenationOfTwoSmallerWordsFromWordsSetMostEfficient {
  NSMutableSet *wordsOfLengthOneSet = [[NSMutableSet alloc] init];
  NSMutableSet *wordsOfLengthTwoSet = [[NSMutableSet alloc] init];
  NSMutableSet *wordsOfLengthThreeSet = [[NSMutableSet alloc] init];
  NSMutableSet *wordsOfLengthFourSet = [[NSMutableSet alloc] init];
  NSMutableSet *wordsOfLengthFiveSet = [[NSMutableSet alloc] init];
  for (NSString *word in self.wordsSet) {
    if (word.length == 1) {
      [wordsOfLengthOneSet addObject:word];
    } else if (word.length == 2) {
      [wordsOfLengthTwoSet addObject:word];
    } else if (word.length == 3) {
      [wordsOfLengthThreeSet addObject:word];
    } else if (word.length == 4) {
      [wordsOfLengthFourSet addObject:word];
    } else if (word.length == 5) {
      [wordsOfLengthFiveSet addObject:word];
    }
  }
  NSMutableArray *wordsArray = [[NSMutableArray alloc] init];
  for (NSString *word in self.wordsSet) {
    BOOL wordFound = NO;
    if (word.length == 6) {
      for (NSUInteger breakWordAtIndex = 1; breakWordAtIndex < word.length; breakWordAtIndex++) {
        NSString *wordFirstPart = [word substringToIndex:breakWordAtIndex];
        NSString *wordSecondPart = [word substringFromIndex:breakWordAtIndex];
        if ((breakWordAtIndex == 1 &&
            [wordsOfLengthOneSet member:wordFirstPart] != nil &&
            [wordsOfLengthFiveSet member:wordSecondPart] != nil) ||
            (breakWordAtIndex == 2 &&
             [wordsOfLengthTwoSet member:wordFirstPart] != nil &&
             [wordsOfLengthFourSet member:wordSecondPart] != nil) ||
            (breakWordAtIndex == 3 &&
             [wordsOfLengthThreeSet member:wordFirstPart] != nil &&
             [wordsOfLengthThreeSet member:wordSecondPart] != nil) ||
            (breakWordAtIndex == 4 &&
             [wordsOfLengthFourSet member:wordFirstPart] != nil &&
             [wordsOfLengthTwoSet member:wordSecondPart] != nil) ||
            (breakWordAtIndex == 5 &&
             [wordsOfLengthFiveSet member:wordFirstPart] != nil &&
             [wordsOfLengthOneSet member:wordSecondPart] != nil)) {
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

/**
 Most extendible code
 */
- (NSArray *)wordsOfLength:(NSUInteger)length
       fromConcatenationOf:(NSUInteger)number
  smallerWordsFromWordsSet:(NSSet *)wordsSet {
  NSMutableArray *breakingIndexesArray = [[NSMutableArray alloc] init];
  for (NSUInteger i = 1; i < (length - number); i++) {
    [breakingIndexesArray addObject:[NSNumber numberWithInt:0]];
  }
  for (NSUInteger i = 1; i < number; i++) {
    [breakingIndexesArray addObject:[NSNumber numberWithInt:1]];
  }
  NSMutableArray *wordsArray = [[NSMutableArray alloc] init];
  NSArray *allPermutationsOfIndexesToBreakWord = [breakingIndexesArray allPermutations];
  for (NSString *word in wordsSet) {
    if (word.length == length) {
      for (NSUInteger index = 0; index < [allPermutationsOfIndexesToBreakWord count]; index++) {
        NSArray *permutationOfIndexesToBreakWord = allPermutationsOfIndexesToBreakWord[index];
        NSMutableArray *allPartsOfWord = [[NSMutableArray alloc] init];
        NSUInteger previousBreakingIndex = 0;
        for (NSUInteger permutationArrayIndex = 0; permutationArrayIndex < [permutationOfIndexesToBreakWord count]; permutationArrayIndex++) {
          if (permutationOfIndexesToBreakWord[permutationArrayIndex] == [NSNumber numberWithInt:1]) {
            NSRange indexRange = NSMakeRange(previousBreakingIndex, (word.length - previousBreakingIndex) - (word.length - permutationArrayIndex) + 1);
            [allPartsOfWord addObject:[word substringWithRange:indexRange]];
            previousBreakingIndex = permutationArrayIndex + 1;
          }
        }
        NSRange indexRange = NSMakeRange(previousBreakingIndex, word.length - previousBreakingIndex);
        [allPartsOfWord addObject:[word substringWithRange:indexRange]];
        BOOL wordFound = YES;
        for (NSUInteger wordPartsArrayIndex = 0; wordPartsArrayIndex < [allPartsOfWord count]; wordPartsArrayIndex++) {
          if ([wordsSet member:allPartsOfWord[wordPartsArrayIndex]] == nil) {
            wordFound = NO;
            break;
          }
        }
        if (wordFound == YES){
          //NSLog(@"%@\n", allPartsOfWord);
          [wordsArray addObject:word];
          break;
        }
      }
    }
  }
  return wordsArray;
}

@end
