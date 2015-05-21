//
//  AnagramHelper.h
//  Anagrams
//
//  Created by Prateek Khandelwal on 5/15/15.
//  Copyright (c) 2015 Prateek Khandelwal. All rights reserved.
//

@interface AnagramHelper : NSObject

- (NSArray *)wordsFromDictionary;

- (NSDictionary *)anagramDictionaryFromWords:(NSArray *)words;

- (void)printAnagramsFromAnagramDictionary:(NSDictionary *)anagramDictionary;

- (NSUInteger)totalAnagramsFromAnagramDictionary:(NSDictionary *)anagramDictionary;

- (NSString *)largestAnagramFromAnagramDictionary:(NSDictionary *)anagramDictionary;

- (NSArray *)largestAnagramsArrayFromAnagramDictionary:(NSDictionary *)anagramDictionary;

@end