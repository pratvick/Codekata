//
//  FileReadingHelper.h
//  ConflictingObjectives
//
//  Created by Prateek Khandelwal on 6/11/15.
//  Copyright (c) 2015 Prateek Khandelwal. All rights reserved.
//

@interface FileReadingHelper : NSObject

- (NSSet *)wordsSetFromFileNamed:(NSString *)fileName extension:(NSString *)extension;

@end
