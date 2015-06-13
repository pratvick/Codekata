//
//  AppDelegate.m
//  Supermarket
//
//  Created by Prateek Khandelwal on 6/12/15.
//  Copyright (c) 2015 Prateek Khandelwal. All rights reserved.
//

#import "AppDelegate.h"
#import "CheckoutRules.h"
#import "Checkout.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
  CheckoutRules *checkoutRules = [[CheckoutRules alloc] init];
  [checkoutRules addItem:@"A" withPrice:10];
  [checkoutRules addItem:@"B" withPrice:20];
  [checkoutRules addItem:@"C" withPrice:30];
  [checkoutRules addItem:@"D" withPrice:40];
  Checkout *checkout = [[Checkout alloc] initWithCheckoutRules:checkoutRules];
  [checkout scanItem:@"A"];
  [checkout scanItem:@"B"];
  [checkout scanItem:@"C"];
  [checkout scanItem:@"A"];
  [checkout scanItem:@"D"];
  NSLog(@"%ld", [checkout totalCost]);
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
  // Insert code here to tear down your application
}

@end
