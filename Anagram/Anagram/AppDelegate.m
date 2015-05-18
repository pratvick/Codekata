//
//  AppDelegate.m
//  Anagram
//
//  Created by Prateek Khandelwal on 5/18/15.
//  Copyright (c) 2015 Prateek Khandelwal. All rights reserved.
//

#import "AppDelegate.h"
#import "AnagramHelper.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
  AnagramHelper *anagramHelper = [[AnagramHelper alloc] init];
  NSArray *wordsArray = [anagramHelper wordsFromDictionary];
  NSDictionary *anagramDictionary = [anagramHelper anagramDictionaryFromWords:wordsArray];
  NSInteger total = 0;
  for(NSString *key in [anagramDictionary allKeys] ) {
    if ([anagramDictionary[key] count] > 1) {
      total++;
    }
  }
  NSLog(@"Total number of Anagrams:%ld", total);
  NSArray *anagramsArray = [anagramHelper anagramsArrayHavingMostNumberOfWordsFromAnagramDictionary:anagramDictionary];
  NSLog(@"%@", anagramsArray);
  NSString *largestAnagramString = [anagramHelper largestAnagramFromAnagramDictionary:anagramDictionary];
  NSLog(@"%@", largestAnagramString);
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
  // Insert code here to tear down your application
}

@end
