//
//  ConflictingObjectivesHelper.h
//  ConflictingObjectives
//
//  Created by Prateek Khandelwal on 5/20/15.
//  Copyright (c) 2015 Prateek Khandelwal. All rights reserved.
//

@interface ConflictingObjectivesHelper : NSObject

- (NSSet *)wordsOfLengthSixFromConcatenationOfTwoSmallerWordsFromWordsSet:(NSSet *)wordsSet;

- (NSArray *)wordsOfLengthSixFromConcatenationOfTwoSmallerWordsEfficientlyFromWordsSet:(NSSet *)wordsSet;

- (NSArray *)wordsOfLength:(NSUInteger)length
       fromConcatenationOf:(NSUInteger)number
  smallerWordsFromWordsSet:(NSSet *)wordsSet;

@end
