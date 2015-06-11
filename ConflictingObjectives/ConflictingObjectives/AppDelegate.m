//
//  AppDelegate.m
//  ConflictingObjectives
//
//  Created by Prateek Khandelwal on 5/20/15.
//  Copyright (c) 2015 Prateek Khandelwal. All rights reserved.
//

#import "AppDelegate.h"
#import "ConflictingObjectivesHelper.h"
#import "FileReadingHelper.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
  ConflictingObjectivesHelper *conflictingObjectivesHelper = [[ConflictingObjectivesHelper alloc] init];
  FileReadingHelper *fileReadingHelper = [[FileReadingHelper alloc] init];
  NSSet *wordsSet = [fileReadingHelper wordsSetFromFileNamed:@"wordlist" extension:@"txt"];
  /*
  NSArray *wordsArray = [conflictingObjectivesHelper wordsOfLength:10
                                               fromConcatenationOf:4
                                          smallerWordsFromWordsSet:wordsSet];
  NSLog(@"%@", wordsArray);
  */
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
  // Insert code here to tear down your application
}

@end
