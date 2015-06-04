//
//  AppDelegate.m
//  ConflictingObjectives
//
//  Created by Prateek Khandelwal on 5/20/15.
//  Copyright (c) 2015 Prateek Khandelwal. All rights reserved.
//

#import "AppDelegate.h"
#import "ConflictingObjectivesHelper.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
  ConflictingObjectivesHelper *conflictingObjectivesHelper = [[ConflictingObjectivesHelper alloc] init];
  NSSet *wordsSet = [conflictingObjectivesHelper wordsSetFromFileNamed:@"wordlist" extension:@"txt"];
  NSArray *wordsArray = [conflictingObjectivesHelper wordsWithLength:6
                        fromTwoSmallerWordsConcatenationFromWordsSet:wordsSet];
  NSLog(@"%@", wordsArray);
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
  // Insert code here to tear down your application
}

@end
