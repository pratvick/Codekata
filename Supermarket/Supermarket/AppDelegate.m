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
#import "Rule.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
  CheckoutRules *checkoutRules = [[CheckoutRules alloc] init];
  [checkoutRules addItem:@"A" withPrice:50 rule:[[Rule alloc] initWithQuantity:3 price:130]];
  [checkoutRules addItem:@"B" withPrice:30 rule:[[Rule alloc] initWithQuantity:2 price:45]];
  [checkoutRules addItem:@"C" withPrice:20];
  [checkoutRules addItem:@"D" withPrice:15];

  Checkout *checkout = [[Checkout alloc] initWithCheckoutRules:checkoutRules];
  [checkout scanAllItems:@"ABAAB"];
  NSLog(@"%ld", [checkout totalCost]);
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
  // Insert code here to tear down your application
}

@end
