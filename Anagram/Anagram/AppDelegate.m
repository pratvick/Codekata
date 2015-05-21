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
  NSArray *wordsArray = [anagramHelper wordsFromFileNamed:@"wordlist" extension:@"txt"];
  NSDictionary *anagramDictionary = [anagramHelper anagramDictionaryFromWords:wordsArray];
  [anagramHelper printAnagramsFromAnagramDictionary:anagramDictionary];
  NSLog(@"Total anagrams: %ld", [anagramHelper totalAnagramsFromAnagramDictionary:anagramDictionary]);
  NSArray *largestAnagramsArray = [anagramHelper largestAnagramsArrayFromAnagramDictionary:anagramDictionary];
  NSLog(@"Largest anagrams array: %@", largestAnagramsArray);
  NSString *largestAnagramString = [anagramHelper largestAnagramFromAnagramDictionary:anagramDictionary];
  NSLog(@"Largest anagram String: %@", largestAnagramString);
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
  // Insert code here to tear down your application
}

@end
