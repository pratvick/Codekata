//
//  ConflictingObjectivesHelper.h
//  ConflictingObjectives
//
//  Created by Prateek Khandelwal on 5/20/15.
//  Copyright (c) 2015 Prateek Khandelwal. All rights reserved.
//

@interface ConflictingObjectivesHelper : NSObject

@property (readonly) NSSet *wordsSet;

- (void)setupWordsSetFromFileNamed:(NSString *)fileName extension:(NSString *)extension;

- (NSArray *)wordsOfLengthSixFromConcatenationOfTwoSmallerWordsFromWordsSet;

- (NSArray *)wordsOfLengthSixFromConcatenationOfTwoSmallerWordsFromWordsSetMostEfficient;

- (NSArray *)wordsOfLength:(NSUInteger)length
       fromConcatenationOf:(NSUInteger)number
  smallerWordsFromWordsSet:(NSSet *)wordsSet;

@end
