//
//  FileReadingHelper.m
//  ConflictingObjectives
//
//  Created by Prateek Khandelwal on 6/11/15.
//  Copyright (c) 2015 Prateek Khandelwal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FileReadingHelper.h"

@implementation FileReadingHelper : NSObject

- (NSSet *)wordsSetFromFileNamed:(NSString *)fileName extension:(NSString *)extension {
  NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:extension];
  NSString *fileContents = [NSString stringWithContentsOfFile:filePath
                                                     encoding:NSISOLatin1StringEncoding
                                                        error:nil];
  NSArray *wordsArray = [fileContents componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
  return [NSSet setWithArray:wordsArray];
}

@end
