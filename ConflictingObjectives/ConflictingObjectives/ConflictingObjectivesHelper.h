//
//  ConflictingObjectivesHelper.h
//  ConflictingObjectives
//
//  Created by Prateek Khandelwal on 5/20/15.
//  Copyright (c) 2015 Prateek Khandelwal. All rights reserved.
//

@interface ConflictingObjectivesHelper : NSObject

- (NSSet *)wordsSetFromFileNamed:(NSString *)fileName extension:(NSString *)extension;

- (NSArray *)wordsWithLength:(NSUInteger)wordLength
fromConcatenationOfTwoSmallerWordsFromWordsSet:(NSSet *)wordsSet;

@end
